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
(declare-fun literal_3 () String)
(declare-fun x_4 () String)
(declare-fun x_2 () String)
(declare-fun epsilon () String)
(declare-fun x_5 () String)
(declare-fun literal_6 () String)
(declare-fun x_7 () String)
(assert (= literal_3 "\x3c\x74\x64\x20\x76\x61\x6c\x69\x67\x6e\x3d\x27\x74\x6f\x70\x27\x20\x77\x69\x64\x74\x68\x3d\x27\x31\x30\x30\x25\x27\x3e\x3c\x64\x69\x76\x20\x63\x6c\x61\x73\x73\x3d\x27\x74\x62\x6c\x32\x27\x20\x73\x74\x79\x6c\x65\x3d\x27\x66\x6f\x6e\x74\x2d\x77\x65\x69\x67\x68\x74\x3a\x62\x6f\x6c\x64\x3b\x76\x65\x72\x74\x69\x63\x61\x6c\x2d\x61\x6c\x69\x67\x6e\x3a\x74\x6f\x70\x27\x3e"))
(assert (= x_4 (str.++ literal_3 sigmaStar_0)))
(assert (= epsilon ""))
(assert (= x_2 epsilon))
(assert (= x_5 (str.++ x_4 x_2)))
(assert (= literal_6 "\x3c\x2f\x64\x69\x76\x3e\x5c\x6e"))
(assert (= x_7 (str.++ x_5 literal_6)))
(assert (str.in_re x_7 (re.++ (re.* re.allchar) (re.++ (str.to_re "\x5c\x3c\x53\x43\x52\x49\x50\x54") (re.* re.allchar)))))
(check-sat)
(exit)