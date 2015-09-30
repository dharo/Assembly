/* Div Mod with shifted subtraction */





MOV R1, #0
MOV R2, #1		@ increment of division
MOV R4, #6		@ denominator
MOV R5, #55		@ numerator
MOV R0, R5
MOV R3, R4

_shiftleft:
	LSL R3, #1	@ denominator shift left
	LSL R2, #1	@ division shift left
	CMP R0, R3
BGT _shiftleft
LSR R3, #1
LSR R2, #1

/* Loop and keep subtracting off the shifted denominator*/

while(R0>=R3){		//keep looping until division is complete
	R1+=R2;		//increment the division by the increment
	R0-=R3;		//subtract shifted denominator with remainder of numerator
	//shift right until denominator is less than numerator
	while(r2>1 && R3 > R0){	//shift denominator until less than numerator
		R2>>=1;		//shift increment left
		R3>>=1;		//shift denominator left
	}
}
