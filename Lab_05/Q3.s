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
	LDR R0, =OP1
	LDR R1, [R0]
	
	LDR R0, =OP2
	LDR R2, [R0]
	
	SUBS R3, R1, R2 	; LSB

	LDR R0, =DST
	STR R3, [R0]
	

OP1 DCD 0x32545678
OP2 DCD 0x12355678
	AREA mydata, DATA, READWRITE
DST DCD 0
	END