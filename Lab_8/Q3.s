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
	CMP R2, R1
	BHS STP
	B DIV

JMP ADD R3, R3, #1
	BEQ STP

DIV SUBS R1, R1, R2
	BCS JMP
	
STP LDR R0, =DST
	STR R3, [R0], #4

NUM1 DCD 25
NUM2 DCD 5
	AREA mydata, DATA, READWRITE
DST DCD 0
	END