; Selection
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
	LDR R0, =LIST
	LDR R1, =DST
	LDR R2, =eol
	
CPY
	CMP R0, R2
	LDR R3, [R0], #4
	STR R3, [R1], #4
	ADD R5, R5, #1
	BNE CPY
	
	; R5 is outer count
SELS
	MOV R6, R5 ; Inner Count
	SUBS R6, R6, #1
	BEQ DONE
	LDR R1, =DST
	MOV R8, R7
	MOV R9, R7
	
SELSS
	LDR R3, [R1, R8]
	LDR R4, [R1, R9]
	CMP R3, R4
	MOVGT R8, R9
	ADD R9, R9, #4
	SUBS R6, R6, #1
	BNE SELSS
	LDR R3, [R1, R7]
	LDR R4, [R1, R8]
	CMP R3, R4
	STRGT R3, [R1, R8]
	STRGT R4, [R1, R7]
	ADDS R7, R7, #4
	SUBS R5, R5, #1
	BNE SELS
DONE B DONE

LIST DCD 65,55,45,35,25,15,10,9,6,4
eol DCD 0
	AREA mydata, DATA, READWRITE
DST DCD 0,0,0,0,0,0,0,0,0,0,0
	END