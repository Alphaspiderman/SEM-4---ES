	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x40001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =VALUE1 
	LDR R1, [R0]
	LDR R0,=VALUE2 
	LDR R2, [R0]
	UMULL R3, R4, R2, R1
	LDR R0, =RESULT
	STR R4, [R0], #4
	STR R3, [R0]
STOP
	B STOP
VALUE1 DCD 0X54000000 ; First 32 bit number
VALUE2 DCD 0X10000002 ; Second 32 bit number 
	AREA data, DATA, READWRITE
RESULT DCD 0