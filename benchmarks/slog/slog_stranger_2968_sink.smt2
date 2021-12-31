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
(declare-fun sigmaStar_1 () String)
(declare-fun sigmaStar_2 () String)
(declare-fun literal_3 () String)
(declare-fun x_4 () String)
(declare-fun literal_5 () String)
(declare-fun x_6 () String)
(declare-fun literal_7 () String)
(declare-fun x_8 () String)
(declare-fun literal_9 () String)
(declare-fun x_10 () String)
(assert (= literal_3 "\x53\x45\x4c\x45\x43\x54\x20\x2a\x20\x46\x52\x4f\x4d\x20"))
(assert (= x_4 (str.++ literal_3 sigmaStar_2)))
(assert (= literal_5 "\x73\x69\x74\x65\x5f\x6c\x69\x6e\x6b\x73\x20\x57\x48\x45\x52\x45\x20\x6c\x69\x6e\x6b\x5f\x70\x6f\x73\x69\x74\x69\x6f\x6e\x3c\x3d\x27\x32\x27\x20\x4f\x52\x44\x45\x52\x20\x42\x59\x20\x6c\x69\x6e\x6b\x5f\x6f\x72\x64\x65\x72"))
(assert (= x_6 (str.++ x_4 literal_5)))
(assert (= literal_7 "\x3c\x64\x69\x76\x20\x63\x6c\x61\x73\x73\x3d\x27\x73\x69\x64\x65\x2d\x6c\x61\x62\x65\x6c\x27\x3e\x3c\x62\x3e"))
(assert (= x_8 (str.++ literal_7 x_6)))
(assert (= literal_9 "\x3c\x2f\x62\x3e\x3c\x2f\x64\x69\x76\x3e\x5c\x6e"))
(assert (= x_10 (str.++ x_8 literal_9)))
(assert (str.in_re x_10 (re.++ (re.* re.allchar) (re.++ (str.to_re "\x5c\x3c\x53\x43\x52\x49\x50\x54") (re.* re.allchar)))))
(check-sat)
(exit)