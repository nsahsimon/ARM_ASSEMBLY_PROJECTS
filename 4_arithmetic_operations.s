.global _start
_start:
	#load r0 AND R1 with constants
	MOV R0, #2
	MOV R1, #5
	
	ADD R2, R0, R1 //R2 = R0 + R1
	
	SUB R3, R0, R1 //R3 = R0 - R1
	
	MUL R4, R0, R1 //R4 = R0 - R1
	
	#Operations which set the flag register i.e cpsr
	SUBS R5, R0, R1 //R5 = R0 - R1 SETS THE CARRY FLAG TO 1 if NEGATIVE
	
	#Load r0 and r1 with new constants
	MOV R0, #0xFFFFFFFF
	MOV R1, #0x2
	
	ADDS R6, R0, R1 //R6 = R0 + R1 , sets the Carry flag to 1 if any carry and then STORES the CARRY
	
	ADC R8, R0, R1 //R8 = R0 + R1 + CARRY
	
#Manually storing data in the stack (RAM)
.data
#create a list of data called "myList"
myList:
	.word 1,2,3,4,5

	
	 