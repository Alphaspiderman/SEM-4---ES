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
	LDR R0, =SRC1
	LDR R1, =SRC2
	LDR R2, =DST
	ADD R0, #12
	ADD R1, #12
	ADD R2, #12
	MOV R3, #4
	B Adder
Adder
	LDR R4, [R0]
	LDR R5, [R1]
	
	ADD R4, R7
	ADDS R6, R4, R5
	MOV R7, #0
	BCS COF
	B ITR
COF
	MOV R7, #1
	B ITR
ITR
	STR R6, [R2]
	
	SUB R0, #4
	SUB R1, #4
	SUB R2, #4
	
	SUBS R3, #1
	BNE Adder

SRC1 DCD 0x12345678,0x12345678,0x12345678,0xF2345678
SRC2 DCD 0x12345678,0x12345678,0x12345678,0x12345678
	AREA mydata, DATA, READWRITE
DST DCD 0,0,0,0
	END