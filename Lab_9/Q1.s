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
	LDR R0,=NUM
	LDRB R1,[R0]
	LDR R0,=RESULT
	
	AND R2,R1,#0x0F ;First Digit
	CMP R2,#09 
	ADDGT R2,#07 ;Skip 7 extra characters between digits and Letters in ASCII
	
	ADD R2,#0x30 ;Covert to ASCII
	STRB R2,[R0]
	
	AND R3,R1,#0xF0 ;2nd Digit
	MOV R3,R3,LSR#04
	CMP R3,#09
	
	ADDGT R3,#07 ;Skip 7 extra characters between digits and Letters in ASCII
	ADD R3,#0x30 ;Covert to ASCII
	STRB R3,[R0,#01]
NUM DCD 0x000003A
	AREA data, DATA, READWRITE
RESULT DCD 0
	END