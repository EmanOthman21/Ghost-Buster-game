GHOSTWORD MACRO
LOCAL ROW, COL, CON, CON2, CLM, RW, D, C, GMODC, GMODR
;GHOSTBUSTERS
;{ THIS BLOCK DRAW GHOST WORD 
    ;INITAL POINT
    MOV DX,250 ; Y = 250
    MOV CX,400 ; X = 400

    MOV AL,04
    MOV AH,0CH
    ;{ THIS DRAW ALL VERTICAL LINES OF GHOST WORD
    ROW: 

        COL:
        ;{ VERTICAL LINS OF 'G'
         INT 10H 
         ADD CX,30
            ;{ IF(G) WE HANDLE IT'S VERTICAL LINES 
                CMP DX,270
                JA D
                INT 10H
                JMP CON
                D: CMP DX,290 
                JB CON
                INT 10H
            ;}
        ;}   
        CON:
        ;{ VERTICAL LINS OF 'H'
            ADD CX,20
            INT 10H
            ADD CX,30
            INT 10H
        ;} 
        ;{ VERTICAL LINS OF 'O'
            ADD CX,20
            INT 10H
            ADD CX,30
            INT 10H
         ;}
        ;{ VERTICAL LINS OF 'S' 
         ADD CX,20
            ;{ IF(S) WE HANDLE IT'S VERTICAL LINES 
                CMP DX,275
                JA C
                INT 10H
                JMP CON2
                C: 
                ADD CX,30
                INT 10H 
                SUB CX,30
            ;}
         CON2:
            ;{ VERTICAL LINS OF 'T' 
                ADD CX,65
                INT 10H
            ;} 
        SUB CX,215 
        INC DX
        CMP DX,310
        JNZ COL
    MOV DX,250      
    INC CX
    CMP CX,410
    JNZ ROW    
    ;}
    ;{ MODIFICATION TO 'G'
        MOV CX,420
        MOV DX,280
        GMODR:
            GMODC:
                INT 10H
                INC CX
                CMP CX,440
            JNZ GMODC
        MOV CX,420
        INC DX
        CMP DX,290
        JNZ GMODR    
    ;}
    ; BACK TO INTAIL POINT TO DRAW HORIZONTAL 
    MOV CX,400
    MOV DX,250
    ;{ THIS BLOCK JUST DRAW HORIZONTAL LINES OF GHOST WORD
    CLM: 
        RW:
        ;{ HORIZONTAL LINS OF 'G'
            INT 10H
            ADD DX,50
            INT 10H
        ;}
        
        ;{ HORIZONTAL LINS OF 'H'
            SUB DX,50
            ADD CX,50
            ADD DX,25
            INT 10H
        ;}

        ;{ HORIZONTAL LINS OF 'O'
            SUB DX,25
            SUB CX,50
            ADD CX,100
            INT 10H
            ADD DX,50
            INT 10H
        ;}
        ;{ HORIZONTAL LINS OF 'S'
            SUB DX,50
            ADD CX,50
            INT 10H
            ADD DX,25
            INT 10H
            SUB DX,25
            ADD DX,50
            INT 10H
        ;}
        ;{ HORIZONTAL LINS OF 'T'
            SUB DX,50
            ADD CX,50
            INT 10H
        ;}
        SUB CX,200
        INC CX
        CMP CX,440
        JNZ RW
    MOV CX,400
    INC DX
    CMP DX,260
    JNZ CLM
;}
ENDM GHOSTWORD