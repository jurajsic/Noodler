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
(declare-fun sigmaStar_4 () String)
(declare-fun literal_5 () String)
(declare-fun x_6 () String)
(declare-fun x_9 () String)
(declare-fun literal_8 () String)
(declare-fun x_10 () String)
(declare-fun x_11 () String)
(declare-fun literal_13 () String)
(declare-fun x_12 () String)
(declare-fun literal_7 () String)
(declare-fun x_14 () String)
(declare-fun literal_15 () String)
(declare-fun x_16 () String)
(declare-fun x_18 () String)
(declare-fun literal_17 () String)
(declare-fun x_20 () String)
(declare-fun literal_19 () String)
(declare-fun x_21 () String)
(declare-fun literal_22 () String)
(declare-fun x_23 () String)
(declare-fun x_24 () String)
(declare-fun x_26 () String)
(declare-fun literal_25 () String)
(declare-fun x_29 () String)
(declare-fun literal_30 () String)
(declare-fun x_32 () String)
(declare-fun x_31 () String)
(declare-fun literal_27 () String)
(declare-fun literal_28 () String)
(declare-fun x_33 () String)
(declare-fun x_35 () String)
(declare-fun literal_34 () String)
(declare-fun x_38 () String)
(declare-fun literal_39 () String)
(declare-fun x_41 () String)
(declare-fun x_40 () String)
(declare-fun literal_37 () String)
(declare-fun literal_36 () String)
(declare-fun x_42 () String)
(declare-fun x_43 () String)
(assert (= literal_5 "\x2f"))
(assert (= x_6 (str.++ sigmaStar_4 literal_5)))
(assert (= x_9 (str.++ x_6 sigmaStar_4)))
(assert (= literal_8 "\x2f"))
(assert (= x_10 (str.++ x_9 literal_8)))
(assert (= x_11 (str.++ x_10 sigmaStar_4)))
(assert (= literal_13 "\x3c\x2f\x73\x65\x6c\x65\x63\x74\x3e\x0d\x0a\x09\x3c\x2f\x74\x64\x3e\x0d\x0a\x09\x3c\x74\x64\x3e\x3c\x69\x6e\x70\x75\x74\x20\x74\x79\x70\x65\x3d\x27\x74\x65\x78\x74\x27\x20\x6d\x61\x78\x6c\x65\x6e\x67\x74\x68\x3d\x27\x31\x30\x27\x20\x6e\x61\x6d\x65\x3d\x27\x73\x74\x61\x72\x74\x64\x61\x74\x65\x27\x20\x73\x69\x7a\x65\x3d\x27\x38\x27\x20\x76\x61\x6c\x75\x65\x3d\x27"))
(assert (= literal_7 ""))
(assert (or (= x_12 x_11) (= x_12 literal_7)))
(assert (= x_14 (str.++ literal_13 x_12)))
(assert (= literal_15 "\x27\x20\x2f\x3e\x3c\x2f\x74\x64\x3e\x0d\x0a\x09\x3c\x74\x64\x3e\x3c\x69\x6e\x70\x75\x74\x20\x74\x79\x70\x65\x3d\x27\x74\x65\x78\x74\x27\x20\x6d\x61\x78\x6c\x65\x6e\x67\x74\x68\x3d\x27\x31\x30\x27\x20\x6e\x61\x6d\x65\x3d\x27\x6d\x69\x64\x64\x61\x74\x65\x27\x20\x73\x69\x7a\x65\x3d\x27\x38\x27\x20\x76\x61\x6c\x75\x65\x3d\x27"))
(assert (= x_16 (str.++ x_14 literal_15)))
(assert (= x_18 (str.++ x_16 x_12)))
(assert (= literal_17 "\x3e\x53\x65\x63\x6f\x6e\x64\x3c\x2f\x6f\x70\x74\x69\x6f\x6e\x3e\x0d\x0a\x09\x20\x3c\x2f\x73\x65\x6c\x65\x63\x74\x3e\x0d\x0a\x09\x3c\x2f\x74\x64\x3e\x0d\x0a\x20\x20\x20\x3c\x2f\x74\x72\x3e\x0d\x0a\x20\x20\x20\x3c\x2f\x74\x61\x62\x6c\x65\x3e\x0d\x0a\x0d\x0a\x20\x20\x20\x3c\x62\x72\x3e\x0d\x0a\x0d\x0a\x20\x20\x20\x3c\x74\x61\x62\x6c\x65\x20\x63\x65\x6c\x6c\x70\x61\x64\x64\x69\x6e\x67\x3d\x27\x30\x27\x20\x62\x6f\x72\x64\x65\x72\x3d\x27\x30\x27\x20\x61\x6c\x69\x67\x6e\x3d\x27\x63\x65\x6e\x74\x65\x72\x27\x20\x77\x69\x64\x74\x68\x3d\x27\x36\x30\x30\x27\x3e\x0d\x0a\x20\x20\x20\x3c\x74\x72\x3e\x0d\x0a\x20\x20\x20\x3c\x74\x64\x3e\x0d\x0a\x09\x3c\x69\x6e\x70\x75\x74\x20\x74\x79\x70\x65\x3d\x27\x62\x75\x74\x74\x6f\x6e\x27\x20\x76\x61\x6c\x75\x65\x3d\x27\x45\x64\x69\x74\x20\x53\x65\x6d\x65\x73\x74\x65\x72\x27\x20\x6f\x6e\x43\x6c\x69\x63\x6b\x3d\x27\x64\x6f\x63\x75\x6d\x65\x6e\x74\x2e\x65\x64\x69\x74\x73\x65\x6d\x65\x73\x74\x65\x72\x2e\x65\x64\x69\x74\x73\x65\x6d\x65\x73\x74\x65\x72\x2e\x76\x61\x6c\x75\x65\x3d\x31\x3b\x64\x6f\x63\x75\x6d\x65\x6e\x74\x2e\x65\x64\x69\x74\x73\x65\x6d\x65\x73\x74\x65\x72\x2e\x70\x61\x67\x65\x32\x2e\x76\x61\x6c\x75\x65\x3d\x35\x3b\x64\x6f\x63\x75\x6d\x65\x6e\x74\x2e\x65\x64\x69\x74\x73\x65\x6d\x65\x73\x74\x65\x72\x2e\x73\x75\x62\x6d\x69\x74\x28\x29\x3b\x27\x3e\x0d\x0a\x09\x3c\x69\x6e\x70\x75\x74\x20\x74\x79\x70\x65\x3d\x27\x62\x75\x74\x74\x6f\x6e\x27\x20\x76\x61\x6c\x75\x65\x3d\x27\x43\x61\x6e\x63\x65\x6c\x27\x20\x6f\x6e\x43\x6c\x69\x63\x6b\x3d\x27\x64\x6f\x63\x75\x6d\x65\x6e\x74\x2e\x65\x64\x69\x74\x73\x65\x6d\x65\x73\x74\x65\x72\x2e\x70\x61\x67\x65\x32\x2e\x76\x61\x6c\x75\x65\x3d\x35\x3b\x64\x6f\x63\x75\x6d\x65\x6e\x74\x2e\x65\x64\x69\x74\x73\x65\x6d\x65\x73\x74\x65\x72\x2e\x73\x75\x62\x6d\x69\x74\x28\x29\x3b\x27\x3e\x0d\x0a\x20\x20\x20\x3c\x2f\x74\x64\x3e\x0d\x0a\x20\x20\x20\x3c\x2f\x74\x72\x3e\x0d\x0a\x20\x20\x20\x3c\x2f\x74\x61\x62\x6c\x65\x3e\x0d\x0a\x0d\x0a\x20\x20\x3c\x69\x6e\x70\x75\x74\x20\x74\x79\x70\x65\x3d\x27\x68\x69\x64\x64\x65\x6e\x27\x20\x6e\x61\x6d\x65\x3d\x27\x65\x64\x69\x74\x73\x65\x6d\x65\x73\x74\x65\x72\x27\x3e\x0d\x0a\x20\x20\x3c\x69\x6e\x70\x75\x74\x20\x74\x79\x70\x65\x3d\x27\x68\x69\x64\x64\x65\x6e\x27\x20\x6e\x61\x6d\x65\x3d\x27\x73\x65\x6d\x65\x73\x74\x65\x72\x69\x64\x27\x20\x76\x61\x6c\x75\x65\x3d\x27"))
(assert (= x_20 (str.++ literal_17 sigmaStar_0)))
(assert (= literal_19 "\x27\x20\x2f\x3e\x3c\x2f\x74\x64\x3e\x0d\x0a\x09\x3c\x74\x64\x3e\x3c\x69\x6e\x70\x75\x74\x20\x74\x79\x70\x65\x3d\x27\x74\x65\x78\x74\x27\x20\x6d\x61\x78\x6c\x65\x6e\x67\x74\x68\x3d\x27\x31\x30\x27\x20\x6e\x61\x6d\x65\x3d\x27\x65\x6e\x64\x64\x61\x74\x65\x27\x20\x73\x69\x7a\x65\x3d\x27\x38\x27\x20\x76\x61\x6c\x75\x65\x3d\x27"))
(assert (= x_21 (str.++ x_18 literal_19)))
(assert (= literal_22 "\x3e\x0d\x0a\x20\x20\x3c\x69\x6e\x70\x75\x74\x20\x74\x79\x70\x65\x3d\x68\x69\x64\x64\x65\x6e\x27\x20\x6e\x61\x6d\x65\x3d\x27\x70\x61\x67\x65\x32\x27\x20\x76\x61\x6c\x75\x65\x3d\x27"))
(assert (= x_23 (str.++ x_20 literal_22)))
(assert (= x_24 (str.++ x_21 x_12)))
(assert (= x_26 (str.++ x_23 sigmaStar_2)))
(assert (= literal_25 "\x27\x20\x2f\x3e\x3c\x2f\x74\x64\x3e\x0d\x0a\x09\x3c\x74\x64\x3e\x0d\x0a\x09\x20\x3c\x73\x65\x6c\x65\x63\x74\x20\x6e\x61\x6d\x65\x3d\x27\x68\x61\x6c\x66\x27\x3e\x0d\x0a\x09\x20\x20\x3c\x6f\x70\x74\x69\x6f\x6e\x20\x76\x61\x6c\x75\x65\x3d\x27\x31\x27\x20"))
(assert (= x_29 (str.++ x_24 literal_25)))
(assert (= literal_30 "\x3e\x0d\x0a\x20\x20\x3c\x69\x6e\x70\x75\x74\x20\x74\x79\x70\x65\x3d\x68\x69\x64\x64\x65\x6e\x27\x20\x6e\x61\x6d\x65\x3d\x27\x6c\x6f\x67\x6f\x75\x74\x27\x3e\x0d\x0a\x20\x20\x3c\x69\x6e\x70\x75\x74\x20\x74\x79\x70\x65\x3d\x27\x68\x69\x64\x64\x65\x6e\x27\x20\x6e\x61\x6d\x65\x3d\x27\x70\x61\x67\x65\x27\x20\x76\x61\x6c\x75\x65\x3d\x27"))
(assert (= x_32 (str.++ x_26 literal_30)))
(assert (= literal_27 "\x53\x45\x4c\x45\x43\x54\x45\x44"))
(assert (= literal_28 ""))
(assert (or (= x_31 literal_27) (= x_31 literal_28)))
(assert (= x_33 (str.++ x_29 x_31)))
(assert (= x_35 (str.++ x_32 sigmaStar_1)))
(assert (= literal_34 "\x3e\x46\x69\x72\x73\x74\x3c\x2f\x6f\x70\x74\x69\x6f\x6e\x3e\x0d\x0a\x09\x20\x20\x3c\x6f\x70\x74\x69\x6f\x6e\x20\x76\x61\x6c\x75\x65\x3d\x27\x32\x27\x20"))
(assert (= x_38 (str.++ x_33 literal_34)))
(assert (= literal_39 "\x3e\x0d\x0a\x0d\x0a\x20\x3c\x2f\x66\x6f\x72\x6d\x3e\x0d\x0a\x0d\x0a\x20\x3c\x74\x61\x62\x6c\x65\x20\x77\x69\x64\x74\x68\x3d\x35\x32\x30\x27\x20\x62\x6f\x72\x64\x65\x72\x3d\x30\x20\x63\x65\x6c\x6c\x73\x70\x61\x63\x69\x6e\x67\x3d\x30\x20\x63\x65\x6c\x6c\x70\x61\x64\x64\x69\x6e\x67\x3d\x30\x20\x68\x65\x69\x67\x68\x74\x3d\x31\x3e\x0d\x0a\x20\x20\x3c\x74\x72\x3e\x0d\x0a\x20\x20\x20\x3c\x74\x64\x20\x76\x61\x6c\x69\x67\x6e\x3d\x27\x74\x6f\x70\x27\x3e\x0d\x0a\x09\x26\x6e\x62\x73\x70\x3b\x0d\x0a\x20\x20\x20\x3c\x2f\x74\x64\x3e\x0d\x0a\x20\x20\x3c\x2f\x74\x72\x3e\x0d\x0a\x20\x3c\x2f\x74\x61\x62\x6c\x65\x3e\x0d\x0a\x20"))
(assert (= x_41 (str.++ x_35 literal_39)))
(assert (= literal_37 ""))
(assert (= literal_36 "\x53\x45\x4c\x45\x43\x54\x45\x44"))
(assert (or (= x_40 literal_37) (= x_40 literal_36)))
(assert (= x_42 (str.++ x_38 x_40)))
(assert (= x_43 (str.++ x_42 x_41)))
(assert (str.in_re x_43 (re.++ (re.* re.allchar) (re.++ (str.to_re "\x5c\x3c\x53\x43\x52\x49\x50\x54") (re.* re.allchar)))))
(check-sat)
(exit)