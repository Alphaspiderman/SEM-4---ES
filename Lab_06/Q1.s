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
	LDR R0, =VAL1
	LDR R1, [R0] ; 1st Val
	
	LDR R0, =VAL2
	LDR R2, [R0] ; 2nd Val
	
	LDR R0, =RES
	MOV R4, #0 ; LSBs
	MOV R5, #0 ; MSBs
	MOV R3, #0 ; Counter
	B LOOP

LOOP
	ADDS R4, R4, R1
	ADCS R5, R5, #0
	ADD R3, R3, #1 ;  Can not use SUBS as we want to preserve flags
	CMP R3, R2
	BNE LOOP
	STR R4, [R0], #4
	STR R5, [R0]
	
VAL1 DCD 0x11112233
VAL2 DCD 0x000000AA
	AREA data, DATA, READWRITE
RES DCD 0,0
	END