NAMES MACRO
LOCAL OUTERLOOP, INNERLOOP, PRINT1, PRINT2, PRINT3
 ;{ OPEN VEDIO MODE
                        MOV     AX, 4F02H
                        MOV     BX, 105H
                        INT     10H
                    ;}


                ;{ DRAWING BACKGROUND
                    MOV     BH, 0      ; DISPLAYPAGE DOESN'T CHANGE
                    MOV     DX, 0     ; Y TO START
                    MOV     CX, 0
                    MOV     AL, 7
                    MOV     AH, 0CH
                           OUTERLOOP: 
                                          INNERLOOP: 
                                                            INT     10H
                                                            INC     CX
                                                            CMP     CX, 1024
                                                            JNZ     INNERLOOP
                                          ;}
                                    MOV     CX,0
                                    INC     DX         ; NEXT Y
                                    CMP     DX, 780
                                    JNZ     OUTERLOOP
                ;}


                  ;{ CLEAR THE PAGE
                    MOV     AX, 0600H
                    MOV     BH, 0
                    MOV     CX, 0
                    MOV     DX, 184FH
                    INT     10H
                ;}
                ;{ CURSUR = (34H,1AH)
                    MOV     AH, 2
                    MOV     DX, 1029H
                    INT     10H
                ;}
                ;{    
                    MOV     AH,09
                    LEA     DX,PLAYER1REQUESRNAME
                    INT     21H
                ;}
                ;{ GET PLAYER1 NAME
                    MOV    AH, 0AH
                    LEA    DX, PLAYER1NAME    
                    INT    21H
                ;}
                ;{ CURSUR = (34H,1AH)
                    MOV     AH, 2
                    MOV     DX, 2029H
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
ENDM NAMES