ADD R1, R0, 2
ADD R3, R1, R0
ADD R5, R1, R0
STR R3, R7, 0
LDR R6, R7, 0
NOP
NOP
NOP

NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP

ADD R1, R0, 8
STR R1, R1, 0
NOP
LDR R2, R1, 0
NOP
ADD R3, R1, 0
LDR R4, R2, 0
NOP


;- end result should be r0:0,r1:8,r2:8,r3:8,r4:8,r5:2,r6:2,r7:0
