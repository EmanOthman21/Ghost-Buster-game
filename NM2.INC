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

               PRINT_MESSAGE:
                ;{  
                    
                    MOV CX,15
                    MOV SI,OFFSET PLAYER2NAME        ;THIS TO CLEAR THE NAME BEFORE SET IT AGAIN 
                    RESET:
                    MOV BL,20H                       
                    MOV [SI],BL
                    INC SI
                    LOOP RESET

                    ;{ CURSUR = (34H,1AH)            SET THE CURSOR TO PRINT "ENTER YOUR NAME"
                    MOV     AH, 2
                    MOV     DX, 1727H
                    INT     10H
                    ;}

                    MOV     AH,09                    ;PRINT "PLEASE ENTER YOUR NAME"  
                    LEA     DX,PLAYER2REQUESRNAME
                    INT     21H
                   
                    MOV     AH,09                    ;PRINT SPACES TO CLEAR THIS AREA (TO HANDLE THE REPEATION)
                    LEA     DX,SPACE
                    INT     21H

                    MOV     AH, 2                    ;SET THE CURSOR TO PRINT AFTER THE MESSAGE
                    MOV     DX, 1747H
                    INT     10H
                ;}
                MOV CX,15
                MOV SI,OFFSET PLAYER2NAME

                READ_PLAYER2_NAME:
                    MOV AH,1H                        ;READ ONE CHAR
                    INT 21H
                    CMP AL,13                        ;IF HE PRESS ENTER WE WILL MAKE CHECKS ON THE FIRST CHAR
                    JZ CHECK
                    MOV [SI],AL                      ;IF NOT WE WILL STORE THE CHAR
                    INC SI  
                LOOP READ_PLAYER2_NAME

                
            CHECK: 
                MOV SI,OFFSET PLAYER2NAME
                MOV AL,[SI]                         
                CMP AL,41H
                JL PRINT_MESSAGE                 ;IF CHAR<'A' 
                CMP AL,5AH
                JLE FINISH                         ;IF CHAR >'A'&CHAR<'Z'
                CMP AL,61H
                JL PRINT_MESSAGE                 ;IF CHAR <'a'
                CMP AL,7AH 
                JA PRINT_MESSAGE                 ;IF CHAR >'z'
            FINISH:    

ENDM NM2