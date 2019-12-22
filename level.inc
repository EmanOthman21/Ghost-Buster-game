LEVEL MACRO 
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
                    MOV     AL, 0     ;BACKGROUND COLOR
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
                    MOV     DX, 1B34H
                    INT     10H
                ;}
                cmp level_flag,1
      jz rgm1
      cmp level_flag,2
         jmp skip99
    rc_gm:  jmp GAME_REJECTED
      skip99:
          jmp skip98
    rgm1:  jmp gamelevel1
      skip98:
      jmp skip97
    rgm2:  jmp gamelevel2
      skip97:
                LEA     SI, level1
                PRINT1:
                    ;{ PRINTING MENUETIME1
                        MOV     AH, 9
                        MOV     BH, 0
                        MOV     AL, [SI]
                        MOV     CX, 1
                        MOV     BL, 016H
                        INT     10H
                        INC     DL
                        MOV     AH, 2
                        INT     10H
                        INC     SI
                        MOV     AL, [SI]
                        CMP     AL, '$'
                        JNZ     PRINT1
                    ;}
                    ;{ CURSUR = (1BH,34H)
                        MOV     AH, 2
                        MOV     DX, 1D34H
                        INT     10H
                    ;}
                    LEA     SI, level2
                    PRINT2:
                    ;{ PRINTING MENUETIME2
                        MOV     AH, 9
                        MOV     BH, 0
                        MOV     AL, [SI]
                        MOV     CX, 1
                        MOV     BL, 016H
                        INT     10H
                        INC     DL
                        MOV     AH, 2
                        INT     10H
                        INC     SI
                        MOV     AL, [SI]
                        CMP     AL, '$'
                        JNZ     PRINT2 
                    ;}
                   
                   
ENDM level