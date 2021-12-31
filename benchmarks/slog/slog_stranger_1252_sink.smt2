(set-info :smt-lib-version 2.6)
(set-logic QF_S)
(set-info :source |
Generated by: Hung-En Wang, Tzung-Lin Tsai, Chun-Han Lin, Fang Yu, and Jie-Hong R. Jiang
Generated on: 2019-02-28
Generator: Stranger
Application: Security analysis of string manipulating web applications
Target solver: CVC4, Norn, Z3-str2
Publication:
Hung-En Wang, Tzung-Lin Tsai, Chun-Han Lin, Fang Yu, Jie-Hong R. Jiang:
String Analysis via Automata Manipulation with Logic Circuit Representation. CAV (1) 2016: 241-260.
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)

(declare-fun sigmaStar_0 () String)
(declare-fun literal_4 () String)
(declare-fun x_3 () String)
(declare-fun epsilon () String)
(declare-fun literal_2 () String)
(declare-fun x_5 () String)
(declare-fun literal_6 () String)
(declare-fun x_7 () String)
(declare-fun literal_8 () String)
(declare-fun x_9 () String)
(declare-fun literal_10 () String)
(declare-fun x_11 () String)
(declare-fun literal_12 () String)
(declare-fun x_13 () String)
(declare-fun literal_14 () String)
(declare-fun x_15 () String)
(declare-fun literal_16 () String)
(declare-fun x_17 () String)
(assert (= literal_4 "\x3c\x61\x20\x74\x69\x74\x6c\x65\x3d\x22"))
(assert (= epsilon ""))
(assert (= literal_2 "\x6d\x61\x72\x6b\x61\x6c\x6c\x64\x72\x65\x61\x64"))
(assert (or (= x_3 epsilon) (= x_3 literal_2)))
(assert (= x_5 (str.++ literal_4 x_3)))
(assert (= literal_6 "\x22\x20\x68\x72\x65\x66\x3d\x22"))
(assert (= x_7 (str.++ x_5 literal_6)))
(assert (= literal_8 "\x2f\x6d\x6f\x64\x2f\x66\x6f\x72\x75\x6d\x2f\x6d\x61\x72\x6b\x70\x6f\x73\x74\x73\x2e\x70\x68\x70\x3f\x66\x3d"))
(assert (= x_9 (str.++ x_7 literal_8)))
(assert (= literal_10 "\x26\x61\x6d\x70\x3b\x64\x3d"))
(assert (= x_11 (str.++ x_9 literal_10)))
(assert (= literal_12 "\x26\x61\x6d\x70\x3b\x6d\x61\x72\x6b\x3d\x72\x65\x61\x64\x26\x61\x6d\x70\x3b\x72\x65\x74\x75\x72\x6e\x70\x61\x67\x65\x3d\x76\x69\x65\x77\x2e\x70\x68\x70\x22\x3e"))
(assert (= x_13 (str.++ x_11 literal_12)))
(assert (= literal_14 "\x3c\x69\x6d\x67\x20\x73\x72\x63\x3d\x22"))
(assert (= x_15 (str.++ x_13 literal_14)))
(assert (= literal_16 "\x2f\x74\x2f\x63\x6c\x65\x61\x72\x2e\x67\x69\x66\x22\x20\x68\x65\x69\x67\x68\x74\x3d\x22\x31\x31\x22\x20\x77\x69\x64\x74\x68\x3d\x22\x31\x31\x22\x20\x2f\x3e\x3c\x2f\x61\x3e"))
(assert (= x_17 (str.++ x_15 literal_16)))
(assert (str.in_re x_17 (re.++ (re.* re.allchar) (re.++ (str.to_re "\x5c\x3c\x53\x43\x52\x49\x50\x54") (re.* re.allchar)))))
(check-sat)
(exit)