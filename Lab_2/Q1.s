; Lab 1
; Q1
	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =SRC		; Load address of source into R0
	LDR R1, =DST		; Load address of destination into r1
	LDR R3, [R0]		; Load data pointed by R0 (aka data of SRC) into R3
	STR R3, [R1]		; Store data from R3 into address pointed by R1 (aka DST)
STOP
	B STOP
SRC DCD 8 				; Declare SRC as a Constant Double with value 8
	AREA mydata, DATA, READWRITE
DST DCD 0
	END
	