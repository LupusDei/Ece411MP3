;stalling test of the century

LOOP:
ADD R2, R0, 8 ; init inst
NOP
NOP
STR R2, R0, 0 ; place 8 at addr 0 -- it should cause a cache miss
LDR R3, R0, 0 ; r3 should get 8
LDR R4, R0, 16 ; r4 shold get the BRnzp inst after the second cache miss-- the doify mirrors inst and data mem
NOP
NOP

BRnzp LOOP 
NOP
NOP
NOP
NOP
NOP
NOP
NOP
