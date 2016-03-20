# This TM takes as input <G> for some G in G(V4) and accepts G iff it is 
# connected.


states:		qinit,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,
		q15,q16,q17,q18,q19,q20,q21,q22,qA,qR

input_alphabet:  !,:,$,1,2,3,4

tape_alphabet:   !,:,$,1,2,3,4,x,_

start_state:     qinit

accept_state:    qA

reject_state:    qR
		
			
delta:          #init, to the left of q1 is $, we are moving R 
		qinit,! -> q1,!,R

		#state q1, need 1 since we need in order + connect all
		q1,1 -> q2,1,R

		#state q2
		q2,: -> q3,:,R  #So far, we have !1:
		q3,2 -> q4,2,R #state q4 is 1:2
		q4,$ -> q5,$,R #so far, !1:2$  NOTE: we need this for the TM!	

	
		q5,1 -> q6,1,R #read !1:2$1
		q5,2 -> q15,2,R #read !1:2$2
		q6,: -> q7,:,R #read !1:2$1:

		q7,3 -> q8,3,R # read !1:2$1:3
		q7,4 -> q9,4,R #read !1:2$1:4

		q8,$ -> q10,$,R #read !1:2$1:3$
		q10,3 ->q20,3,R #read !1:2$1:3$3
		q9,$ -> q11,$,R #read !1:2$1:4$
	
		q10,1 -> q12,1,R #read !1:2$1:3$1
		q10,2 -> q15,2,R #read !1:2$1:3$2
		q12,: -> q13,:,R #read !1:2$1:3$1:
		q13,4 -> q14,4,R #read !1:2$1:3$1:4 accept	
		
		q11,2 -> q15,2,R #read !1:2$1:4$2
                q15,: -> q16,:,R #read !1:2$1:3$2:
		q16,3 -> q17,3,R #read !1:2$1:3$2:3
                q16,4 -> q18,4,R #read !1:2$1:3$2:4 accept 
		q18,_ -> qA,_,R
		q17,_ -> qA,_,R
		#special case !1:2$2:4$3:4
		q18,$ -> q19,$,R	

		q17,$ -> q19,$,R ##read !1:2$1:3$2:3$
		q19,2 -> q18,2,R #if see 2 again, then only one left is 2:4
		q19,3 -> q20,3,R ##read !1:2$1:3$2:3$3
		q20,: -> q21,:,R #read !1:2$1:3$2:3$3:
		q21,4 -> q22,4,R #read !1:2$1:3$2:3$3:4 accept

		#Accept states
		q14,_ -> qA,_,R
		q14,$ -> qA,_,R
		q18,_ -> qA,_,R		
		q18,: -> qA,:,R
		q22,_ -> qA,_,R
			
