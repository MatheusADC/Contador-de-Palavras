JMP Inicio
	DB FA	
	DB 60	
	DB B6	
	DB 9E	
	DB 4E	
	DB DC	
	DB FC	
	DB 8A	
	DB FE	
	DB DE	
	DB 00	
	DB 60

Inicio:
	MOV BL, C0		
	MOV CL, 02		
	MOV DL, 02		
	MOV AL, 01
	MOV [FF], AL
	MOV AL, [DL]	
	OUT 02
	NOP NOP NOP
	MOV AL, [CL]	
	INC AL
	OUT 02

Loop:
	IN 00
	CMP AL, 0D
	JZ Done
	MOV [BL], AL
	INC BL
	MOV [FE], AL
	INT 0D
	JMP Loop

ORG 60
Count:
	MOV AL, [FE]		
	CMP AL, 20		
	JNZ VerificaLetra
	MOV AL, 01
	MOV [FF], AL
	JMP FimInt

VerificaLetra:
	MOV AL, [FF]
	CMP AL, 01
	JNZ FimInt
	MOV AL, 00
	MOV [FF], AL
	INC CL
	MOV AL, [CL]
	CMP AL, 00
	JNZ Exibe
	MOV CL, 02
	INC DL

Exibe:
	MOV AL, [DL]
	OUT 02
	NOP NOP NOP
	MOV AL, [CL]
	INC AL
	OUT 02

FimInt:
	IRET

Done:
	END