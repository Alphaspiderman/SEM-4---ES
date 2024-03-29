	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10000000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =NUM
	LDRB R1, [R0]
	LDRB R2, [R0, #1]
	LDRB R3, [R0, #2]
	LDRB R4, [R0, #3]
	LDR R0, =DST
	
	LSL R2, #4
	LSL R4, #4
	
	ORR R1, R1, R2
	ORR R3, R3, R4
	
	ADD R1, R1, R3, LSL #8
	STR R1, [R0]
	
NUM DCD 0x04080907
	AREA mydata, DATA, READWRITE
DST DCD 0
	END