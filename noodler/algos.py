"""
Basic operations on automata, string equations, and SESystems.

Public functions
----------------
* multiop: Apply binary operation on list of automata
* equivalent_all: Are given automata equivalent?
* chain_automata: Concatenate automata using ε-transitions
* eps_preserving_product: ε-NFA × NFA with ε-transitions preserved.
* eps_segmentation: compute levels of ε-transitions
* split_segment_aut: split segment automaton into segments
"""
from typing import Callable, Sequence, Dict

import awalipy

from .core import Aut, SegAut, TransID


# Comments ###
# When splitting a segment automaton into segments
# I only trim the automata. Minimization can be run.


def multiop(automata: Sequence[Aut],
            operation: Callable[[Aut, Aut], Aut]) -> Aut:
    """
    Apply binary operation on multiple automata.

    Returns op(…op(op(A1, A2), A3), … An) where op is operation

    Parameters
    ----------
    automata : list of auts
        Must be non-empty.
    operation : function (aut × aut → aut)

    Returns
    -------
    res : aut
        op(…op(op(A1, A2), A3), … An)
    """
    if len(automata) == 0:
        raise ValueError("Sequence `automata` must be non-empty!")

    res = automata[0].copy()
    for aut in automata[1:]:
        res = operation(res, aut)

    return res


def equivalent_all(auts: Sequence[Aut]) -> bool:
    """
    Check whether all automata are equivalent.

    Parameters
    ----------
    auts : iterable of auts

    Returns
    -------
        True if all automata from ``auts`` are equivalent.
        False otherwise.
    """
    if len(auts) <= 1:
        return True

    aut_l = list(auts)
    first_a = aut_l[0]
    for other in aut_l[1:]:
        if not first_a.are_equivalent(other):
            return False

    return True


def chain_automata(automata: Sequence[Aut]) -> SegAut:
    """
    Chain sequence of auts into aut for concatenation.

    Connect the automata in the sequence by ε-transitions. For
    ``a_1, a_2, … , a_n`` create automaton A that represents the
    language L(A) = L(a_1) · L(a_2) · … · L(a_n). A is basically
    an union of ``a_1 … a_n`` as they are, connected with
    ε-transitions. Each final state of ``a_i`` is connected by
    an ε-transition with each initial state of ``a_{i+1}.

    TODO: reimplement using multiop

    Parameters
    ----------
    automata : list of auts
        Must be non-empty

    Returns
    -------
    A : SegAut
        Automaton that links auts from ``automata`` by ε-transitions
        between final an initial states.
    """
    res: SegAut = multiop(automata, awalipy.union)
    res.allow_eps_transition_here()

    # pre_a is the automaton which will be source of ε-transitions,
    # next_a is the automaton whose initial states receive the ε-tr.
    # offsets keep the shift in automata numbers between res and
    #   pre/next
    pre_a = automata[0]
    pre_offset = 0

    # 1. For each final of pre_a:
    #     I. add ε to next_a
    #     II. Unset final
    # 2. Unset init_states of next_a
    for next_a in automata[1:]:
        next_offset = pre_offset + len(pre_a.states())

        for final_pre in pre_a.final_states():
            final_res = pre_offset + final_pre

            # Add ε-transitions
            for init_next in next_a.initial_states():
                init_res = next_offset + init_next
                res.add_eps_transition(final_res, init_res)

            res.unset_final(final_res)

        for init_next in next_a.initial_states():
            init_res = next_offset + init_next
            res.unset_initial(init_res)

        pre_a = next_a
        pre_offset = next_offset

    return res


# noinspection PyIncorrectDocstring
def eps_preserving_product(aut_l: SegAut,
                           aut_r: Aut,
                           **opts) -> SegAut:
    """
    Intersection of ε-NFA with NFA.

    Create product of ``aut_l`` and ``aut_r``, where ``aut_l``
    can contain ε-transitions. The product preserves the
    ε-transitions of ``aut_l``. This means, for each ε-trans
    of the form `s -ε-> p` and each product state `(s, a)`, an
    ε-transition `(s, a) -ε-> (p, a)` is created.

    Parameters
    ----------
    aut_l : aut with ε-transitions
    aut_r : aut without ε-transitions
        Automata must share alphabets.

    opts
    ----
    history : Bool, default False
        Store history into state names.

    Returns
    -------
    aut
        Product of ``aut_l`` with ``aut_r`` with ε-transitions
        preserved.

    Notes
    -----
    Currently inefficient! It builds all pairs of states and
    only later trims the automaton. We should build only the
    reachable part to speed things up.
    """
    names = opts.get("history", False)

    state_map = {}
    alphabet = aut_l.alphabet()
    new_aut = awalipy.make_automaton(alphabet)
    new_aut.allow_eps_transition_here()

    # Create states
    for s in aut_l.states():
        for t in aut_r.states():
            if names:
                st = new_aut.add_state(f"{aut_l.get_state_name(s)} | {aut_r.get_state_name(t)}")
            else:
                st = new_aut.add_state()
            state_map[s, t] = st
            if aut_l.is_final(s) and aut_r.is_final(t):
                new_aut.set_final(st)
            if aut_l.is_initial(s) and aut_r.is_initial(t):
                new_aut.set_initial(st)

    for sl in aut_l.states():
        for sr in aut_r.states():
            for a in alphabet:
                for tl in aut_l.outgoing(sl, a):
                    dst_l = aut_l.dst_of(tl)
                    for tr in aut_r.outgoing(sr, a):
                        dst_r = aut_r.dst_of(tr)
                        new_aut.set_transition(state_map[sl, sr],
                                               state_map[dst_l, dst_r],
                                               a)

            for tl in aut_l.outgoing(sl, "\\e"):
                dst_l = aut_l.dst_of(tl)
                new_aut.add_eps_transition(state_map[sl, sr], state_map[dst_l, sr])
    new_aut.trim_here()

    return new_aut


def eps_segmentation(aut: SegAut) -> Dict[int, Sequence[TransID]]:
    """
    Compute depth of ε-transitions.

    This works only for segment-automata. These are automata
    whose state space can be split into several segments
    connected by ε-transitions in a chain. No other
    ε-transitions are allowed. As a consequence, no ε-trans.
    can appear in a cycle.

    Parameters
    ----------
    aut : aut
        Segment automaton.

    Returns
    -------
    depths : dict of lists of ε-transitions
        For each depth i we have that depths[i] contains a list
        of ε-transitions of depth `i`.
    """
    depths = {}

    # store already visited states
    visited = {}
    for i in aut.states():
        visited[i] = False

    to_do = []
    for s in aut.initial_states():
        to_do.append((s, 0))

    while len(to_do) > 0:
        state, depth = to_do.pop()
        if not (visited[state]):
            visited[state] = True
            # noinspection PyArgumentList
            out_trs = aut.outgoing(state)
            for tr in out_trs:
                if aut.label_of(tr) == "\\e":
                    depths.setdefault(depth, [])
                    depths[depth].append(tr)
                    to_do.append((aut.dst_of(tr), depth + 1))
                else:
                    to_do.append((aut.dst_of(tr), depth))

    return depths


def split_segment_aut(aut: SegAut) -> Sequence[Aut]:
    """
    Splits segment automaton into segments.

    Returns a list of segments for aut in the order
    from left (initial state in segment automaton) to
    right (final states of segment automaton).

    Parameters
    ----------
    aut : aut
        Segment-automaton

    Returns
    -------
    list of auts
        Segments of ``aut``
    """
    # We need to make a copy before eps_segmentation
    # otherwise the trans_id could not match. We destroy
    # this automaton anyway in the process...
    aut = aut.copy()
    eps_trans = eps_segmentation(aut)

    segments = [aut.copy() for _ in eps_trans]
    segments.append(aut.copy())

    for depth, trans in eps_trans.items():
        # Split the left segment from aut into new_segment.
        for tr in trans:
            assert aut.label_of(tr) == "\\e"
            assert segments[depth].label_of(tr) == "\\e"
            segments[depth].set_final(aut.src_of(tr))
            segments[depth].del_transition(tr)
            for i in range(depth + 1, len(segments)):
                segments[i].del_transition(tr)
                segments[i].set_initial(aut.dst_of(tr))
                # aut.set_initial(aut.dst_of(tr))
            # aut.del_transition(tr)

    return [seg.trim().proper() for seg in segments]