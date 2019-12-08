NM2 MACRO
LOCAL OUTERLOOP2, INNERLOOP2, UPPER2, LOWER2, LEFT2, RIGHT2
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
                           OUTERLOOP2: 
                                          INNERLOOP2: 
                                                            INT     10H
                                                            INC     CX
                                                            CMP     CX, 1024
                                                            JNZ     INNERLOOP2
                                          ;}
                                    MOV     CX,0
                                    INC     DX         ; NEXT Y
                                    CMP     DX, 780
                                    JNZ     OUTERLOOP2
                ;}


                  ;{ CLEAR THE PAGE
                    MOV     AX, 0600H
                    MOV     BH, 0
                    MOV     CX, 0
                    MOV     DX, 184FH
                    INT     10H
                ;}
                
                ;{Draw a blue square 
                
                    MOV DX, 219
                    MOV CX, 20
                    MOV AL, 1
                    MOV AH, 0CH 
                    UPPER2:
                        INT 10H 
                        INC CX    
                        CMP CX, 1004
                    JNZ UPPER2

                    MOV DX, 519
                    MOV CX, 20
                    MOV AL, 1
                    MOV AH, 0CH 
                    LOWER2:
                        INT 10H 
                        INC CX    
                        CMP CX, 1004
                    JNZ LOWER2
                
                    MOV DX, 219
                    MOV CX, 20
                    MOV AL, 1
                    MOV AH, 0CH 
                    RIGHT2:
                        INT 10H 
                        INC DX    
                        CMP DX, 519
                    JNZ RIGHT2

                    MOV DX, 219
                    MOV CX, 1004
                    MOV AL, 1
                    MOV AH, 0CH 
                    LEFT2:
                        INT 10H 
                        INC DX    
                        CMP DX, 519
                    JNZ LEFT2
                ;}

                ;{DRAW TANK
                    MOV SI , OFFSET BITMAP_UP_PLAYER2
                    DRAW_OBJECT TANKSIZE, SI, 232, 350                

                ;}

                ;{ CURSUR = (34H,1AH)
                    MOV     AH, 2
                    MOV     DX, 1727H
                    INT     10H
                ;}
                ;{    
                    MOV     AH,09
                    LEA     DX,PLAYER2REQUESRNAME
                    INT     21H
                ;}
                ;{ GET PLAYER2 NAME
                    MOV    AH, 0AH
                    LEA    DX, PLAYER2NAME    
                    INT    21H
                ;}

ENDM NM2