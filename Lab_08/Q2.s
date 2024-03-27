	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =NUM1
	LDR R1, [R0]
	LDR R0, =NUM2
	LDR R2, [R0]
	
	UMULL R3, R4, R1, R2
	
GCD CMP R1, R2
	BEQ DIV
	BHS REG
	BLO OVR

OVR SUB R2, R2, R1
	B GCD
REG SUB R1, R1, R2
	B GCD
	
ESB SUB R4, R4, #1

JMP ADD R5, R5, #1
	BEQ STP

DIV SUBS R3, R3, R1
	BCC ESB
	BCS JMP
STP LDR R0, =DST
	STR R5, [R0]

NUM1 DCD 25
NUM2 DCD 15
	AREA mydata, DATA, READWRITE
DST DCD 0
	END