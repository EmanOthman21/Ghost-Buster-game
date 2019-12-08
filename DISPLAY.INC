DISPLAY_RESULT MACRO 
LOCAL OUTERLOOP3, INNERLOOP3, UPPER3, LOWER3, LEFT3, RIGHT3,UPPER4, LOWER4, LEFT4, RIGHT4,COMPARE
 PUSH DX
 PUSH CX
 PUSH BX
 PUSH AX
 PUSH DI

 ;{ OPEN VEDIO MODE
     MOV     AX, 4F02H
     MOV     BX, 105H
     INT     10H
 ;} 

 ;{ DRAWING BACKGROUND
                    MOV     BH, 0      ; DISPLAYPAGE DOESN'T CHANGE
                    MOV     DX, 0     ; Y TO START
                    MOV     CX, 0
                    MOV     AL, 0
                    MOV     AH, 0CH
                           OUTERLOOP3: 
                                          INNERLOOP3: 
                                                            INT     10H
                                                            INC     CX
                                                            CMP     CX, 1024
                                                            JNZ     INNERLOOP3
                                          ;}
                                    MOV     CX,0
                                    INC     DX         ; NEXT Y
                                    CMP     DX, 780
                                    JNZ     OUTERLOOP3
;}
;{ CLEAR THE PAGE
                    MOV     AX, 0600H
                    MOV     BH, 0
                    MOV     CX, 0
                    MOV     DX, 184FH
                    INT     10H
                ;}

     ;{Draw a red square 
                
                    MOV DX, 100
                    MOV CX, 20
                    MOV AL, 4
                    MOV AH, 0CH 
                    UPPER3:
                        INT 10H 
                        INC CX    
                        CMP CX, 1004
                    JNZ UPPER3

                    MOV DX, 250
                    MOV CX, 20
                    MOV AL, 4
                    MOV AH, 0CH 
                    LOWER3:
                        INT 10H 
                        INC CX    
                        CMP CX, 1004
                    JNZ LOWER3
                
                    MOV DX,100
                    MOV CX, 20
                    MOV AL, 4
                    MOV AH, 0CH 
                    RIGHT3:
                        INT 10H 
                        INC DX    
                        CMP DX, 250
                    JNZ RIGHT3

                    MOV DX, 100
                    MOV CX, 1004
                    MOV AL, 4
                    MOV AH, 0CH 
                    LEFT3:
                        INT 10H 
                        INC DX    
                        CMP DX, 250
                    JNZ LEFT3
                ;}   
    ;{DRAW THE RED TANK 
                    MOV SI , OFFSET BITMAP_UP_PLAYER1
                    DRAW_OBJECT TANKSIZE, SI, 54, 150                
                ;}   
    ;{SET THE CURSOR            
                    MOV     AH, 2
                    MOV     DX, 0A12H
                    INT     10H
                ;}    
    ;{PRINT THE SCORE OF PLAYER1
                 MOV     AH,09             
                 LEA     DX,SCORE 
                 INT     21H     
                 PRINTNUM     PLAYER1_SCORE, SCORE1_DECIMAL,30,10
                ;}

    ;{Draw a BLUE square 
                
                    MOV DX, 300
                    MOV CX, 20
                    MOV AL, 1
                    MOV AH, 0CH 
                    UPPER4:
                        INT 10H 
                        INC CX    
                        CMP CX, 1004
                    JNZ UPPER4

                    MOV DX,450
                    MOV CX, 20
                    MOV AL, 1
                    MOV AH, 0CH 
                    LOWER4:
                        INT 10H 
                        INC CX    
                        CMP CX, 1004
                    JNZ LOWER4
                
                    MOV DX,300
                    MOV CX, 20
                    MOV AL, 1
                    MOV AH, 0CH 
                    RIGHT4:
                        INT 10H 
                        INC DX    
                        CMP DX,450
                    JNZ RIGHT4

                    MOV DX, 300
                    MOV CX, 1004
                    MOV AL, 1
                    MOV AH, 0CH 
                    LEFT4:
                        INT 10H 
                        INC DX    
                        CMP DX,450
                    JNZ LEFT4
                ;}   
                 ;{DRAW  THE BLUE TANK
                    MOV SI , OFFSET BITMAP_UP_PLAYER2
                    DRAW_OBJECT TANKSIZE, SI, 54, 350                
                ;} 
                ;{SET CURSOR  
                    MOV     AH, 2
                    MOV     DX, 1712H
                    INT     10H
                ;}
                ;{ PRINT THE SCORE OF PLAYER2
                 MOV     AH,09             
                 LEA     DX,SCORE 
                 INT     21H     
                 PRINTNUM     PLAYER2_SCORE, SCORE2_DECIMAL,30,23
                 ;}
        ;{DELAY       
        MOV BH,04H         ;4 SECONDS FOR DELAY       
		MOV AH,2CH
		INT 21H
		MOV [DI],DH             
		
		COMPARE:
		INT 21H                     
		SUB DH,[DI]                
		CMP DH,BH                 
		JB COMPARE
        ;}
        
        POP DI
        POP AX
        POP BX
        POP CX
        POP DX

ENDM DISPLAY_RESULT


