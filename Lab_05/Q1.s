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
	LDR R1, [R0], #4 	; MSB
	LDR R2, [R0], #4
	LDR R3, [R0], #4
	LDR R4, [R0]	 	; LSB 
	
	LDR R0, =OP2
	LDR R5, [R0], #4 	; MSB
	LDR R6, [R0], #4
	LDR R7, [R0], #4
	LDR R8, [R0]	 	; LSB
	
	ADDS R9, R4, R8 	; LSB
	ADCS R10, R3, R7
	ADCS R11, R2, R6
	ADCS R12, R1, R5 	; MSB
	
	LDR R0, =DST
	STR R12, [R0], #4
	STR R11, [R0], #4
	STR R10, [R0], #4
	STR R9, [R0]
	

OP1 DCD 0x12345678,0x12345678,0x12345678,0xF2345678 ; OP1 = 123456781234567812345678F2345678
OP2 DCD 0x12345678,0x12345678,0x12345678,0x32345678 ; OP2 = 12345678123456781234567832345678
	AREA mydata, DATA, READWRITE
DST DCD 0,0,0,0
	END