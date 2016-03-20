# This TM computes the function f(0^n) = 0^{2n}.
 
states:		qin20, qin21,
		qin1,qin2,qin3,qin4,qin5,qin6,qin7,qin8,qin9,qin10,qin11,qin12,
		qinit,q333,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,
                q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,
		q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,q40,q41,q42,q43,q44,
		q45,q46,q47,q48,q49,q50,qA,qR
input_alphabet:  0,1,2,3,a,b,!,$,:
tape_alphabet:   0,1,2,3,a,b,!,$,:,x,_
start_state:     qinit
accept_state:    qA
reject_state:    qR
delta:		#initial state
		qinit,! -> q1,!,R
		
		#start state
		q1,0 -> q2,0,R
		q1,1 -> q2,1,R
		q1,3 -> q333,3,R
		q2,$ -> q3,$,R ##LETS BEGIN!

		#start at state 0, on input a
		q3,0 -> q4,0,R
		q4,a -> q5,a,R
		q5,1 -> q6,1,R #read in !0$0a1
		q5,0 -> q42,0,R #read in !0$0a0
		q42,: -> q43,:,R # !0$0a0:
		q43,0 -> q8,0,R # !0$0a0:0
	
		#state 0, on input b
		q6,: -> q7,:,R ##read in !0$0a1:
		q7,0 -> q8,0,R ##read in !0$0a1:0
		q8,b -> q9,b,R #read in !0$0a1:0b
		q9,1 -> q44,1,R # !0$0a0:0b1 this is 0b1 special case
		q44,: -> q11,:,R # !0$0a0:0b1:
		q9,2 -> q10,2,R #read in !0$0a1:0b2 this is 0b2 special case
		q10,: -> q11,:,R

		#state 1, input a
		q11,1 -> q12,1,R #read in !0$0a1:0b2:1
		q12,a -> q13,a,R #read in !0$0a1:0b2:1a
		q13,1 -> q14,1,R #read in !0$0a1:0b2:1a1
		q13,2 -> q45,2,R # case 1a2
		q45,: -> q15,:,R
		q14,: -> q15,:,R #read in !0$0a1:0b2:1a1:

		#state 1, input b
		q15,1 -> q16,1,R #read in !0$0a1:0b2:1a1:1
		q16,b -> q17,b,R #read in !0$0a1:0b2:1a1:1b
		q17,0 -> q18,0,R #read in !0$0a1:0b2:1a1:1b0
		q17,1 -> q46,1,R # case 1b1
		q46,: -> q19,:,R
		q17,2 -> q47,2,R #case 1b2
		q47,: -> q19,:,R
		q18,: -> q19,:,R #read in !0$0a1:0b2:1a1:1b0:

		#state 2, input a
		q19,2 -> q20,2,R #read in !0$0a1:0b2:1a1:1b0:2
                q20,a -> q21,a,R #read in !0$0a1:0b2:1a1:1b0:2a
                q21,1 -> q22,1,R #read in !0$0a1:0b2:1a1:1b0:2a1
                q22,: -> q23,:,R #read in !0$0a1:0b2:1a1:1b0:2a1:
		q21,2 -> q48,2,R #case 2a2
		q48,: -> q23,:,R
		q21,0 -> q49,0,R #case 2a0
		q49,: -> q23,:,R
		
		#state 2, input b
		q23,2 -> q24,2,R #read in !0$0a1:0b2:1a1:1b0:2a1:2
                q24,b -> q25,b,R #read in !0$0a1:0b2:1a1:1b0:2a1:2b
                q25,1 -> q26,1,R #read in !0$0a1:0b2:1a1:1b0:2a1:2b1
                q26,: -> q27,:,R #read in !0$0a1:0b2:1a1:1b0:2a1:2b1:
		q25,2 -> q50,2,R #case 2b2
		q50,: -> q27,:,R		

		#state 3, input a
		q27,3 -> q28,1,R #read in !0$0a1:0b2:1a1:1b0:2a1:2b1:3
                q28,a -> q29,1,R #read in !0$0a1:0b2:1a1:1b0:2a1:2b1:3a
                q29,3 -> q30,1,R #read in !0$0a1:0b2:1a1:1b0:2a1:2b1:3a3
                q30,: -> q31,1,R #read in !0$0a1:0b2:1a1:1b0:2a1:2b1:3a3:

		#state 3, input b
		q31,3 -> q32,1,R #read in !0$0a1:0b2:1a1:1b0:2a1:2b1:3a3:3
                q32,b -> q33,1,R #read in !0$0a1:0b2:1a1:1b0:2a1:2b1:3a3:3b
                q33,3 -> q34,1,R #read in !0$0a1:0b2:1a1:1b0:2a1:2b1:3a3:3b3
                q34,$ -> q35,1,R #read in !0$0a1:0b2:1a1:1b0:2a1:2b1:3a3:3b3$

		#accept
		q35,3 -> q333,3,R
		q35,2 -> q36,2,R
		q35,1 -> q36,1,R
		q35,0 -> qin10,0,R

		qin10,a -> qin11,a,R #state 1
		qin10,_ -> qA,_,R
		qin10,b -> qin3,b,R

		q36,a -> qin20,a,R
		q36,b -> qin21,b,R

		qin20,a -> qin20,a,R #state 0
		qin20,b -> qin21,b,R 

		qin21,a -> qin21,a,R #state 1
		qin21,_ -> qA,_,R
		qin21,b -> qR,b,R

		qin11,a -> qin3,a,R #qin3 is state 2
		qin11,b-> qin10,b,R #state 0 is qin2

		qin2,b -> qin3,b,R
		qin2,_ -> qA,_,R
		qin2,a -> qin11,a,R

		qin3,a -> qin10,a,R
		qin3,b -> qin11,b,R

		qin4,b -> qin3,b,R
		qin4,_ -> qA,_,R
		qin4,a -> qin11,a,R
		qin4,b -> qin2,b,R
		qin5,a->qin6,a,R
		qin6,_ -> qA,_,R

		qin1,a -> qin7,a,R
		qin9,_ -> qA,_,R
		qin9,a -> qin8,a,R
		qin9,b -> qR,b,R

		qin1,b -> qin8,b,R
		qin7,a -> qin7,a,R
		qin7,b -> qin8,b,R
		qin7,_ -> qA,_,R
		qin8,a -> qin8,a,R
		qin8,b -> qR,b,R
		qin8,_ -> qA,_,R


		q36,: -> q37,:,R

                q37,3 -> q38,3,R #accept is *:3
                q37,2 -> q38,2,R #accept is *:2

		#start test case 1
		q38,a -> q39,a,R #q38 is state 0
		q38,b -> q41,b,R #0->2
		
		q38,: -> q37,:,R #for 2 or 3 for cases such as 1:2:3 or 0:2:3

		q39,b -> q40,b,R #q39 is state 1
		q39,a -> q39,a,R
		q39,_ -> qA,_,R

		q40,b -> q41,b,R 

		q41,a -> q39,a,R
		q41,b -> q39,b,R			
		q41,_ -> qA,_,R #q41 is state 2
 
	#q333 is for accept state 3, of course, we would need to start at 3
		q333,a ->qA,a,R
		q333,b -> qA,b,R
		q333,_ -> qA,_,R

