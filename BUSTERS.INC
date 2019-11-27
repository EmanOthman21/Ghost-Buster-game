BUSTERWORD MACRO
LOCAL ROW, COL, CON, CON2, CLM, RW, D, C, CN, R, L, CON3, T, CON4, CON5, CON6, CLMM, ROOW, K, CON7, CON8, CON9, F, CON10
;{ THIS BLOCK DRAW BUSTER WORD 
    ;INITAL POINT
    MOV DX,320 ; Y = 320
    MOV CX,380 ; X = 380

    MOV AL,01
    MOV AH,0CH
    ;{ THIS DRAW ALL VERTICAL LINES OF BUSTER WORD
    ROW: 

        COL:
        ;{ VERTICAL LINS OF 'B'
         INT 10H 
         ADD CX,30
            ;{ IF(B) WE HANDLE IT'S VERTICAL LINES 
                CMP DX,345
                JA D
                INT 10H
                JMP CON
                D: CMP DX,355 
                JB CON
                INT 10H
            ;}
        ;}   
        CON:
        ;{ VERTICAL LINS OF 'U'
            ADD CX,20
            INT 10H
            ADD CX,30
            INT 10H
        ;}
        ;{ VERTICAL LINS OF 'S' 
         ADD CX,20
            ;{ IF(S) WE HANDLE IT'S VERTICAL LINES 
                CMP DX,345
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
        ;} 
 
        ;{ VERTICAL LINS OF 'E'
            ADD CX,35
            INT 10H
         ;}
         ;{ VERTICAL LINS OF 'R'
            ADD CX,50
            INT 10H
            ADD CX,30
                ;{ IF(R) WE HANDLE IT'S VERTICAL LINES 
                    CMP DX,345
                    JA R
                    INT 10H
                    JMP CN
                    R: CMP DX,355 
                    JB CN
                    INT 10H
                ;}
         ;}
        CN:
        SUB CX,280 
        INC DX
        CMP DX,380
        JNZ COL
    MOV DX,320      
    INC CX
    CMP CX,390
    JNZ ROW    
    ;}
    ; BACK TO INTAIL POINT TO DRAW HORIZONTAL 
    MOV DX,320
    MOV CX,380
    ;{ THIS BLOCK JUST DRAW HORIZONTAL LINES OF BUSTER WORD
    CLM: 
        RW:
        ;{ HORIZONTAL LINS OF 'B'
            INT 10H
            ADD DX,20
            ;{ IF(B) WE HANDLE IT'S HORIZONTAL LINES 
                CMP CX,415
                JA T
                INT 10H
                JMP CON4
                T: CMP DX,345 
                JA CON3
                INT 10H
                CON3: CMP DX,355
                JB CON4
                INT 10H
                CON4: ADD DX,10
                CMP CX,415
                JA L
                INT 10H
                JMP CON6
                L: CMP DX,345 
                JA CON5
                INT 10H
                CON5: CMP DX,355
                JB CON6
                INT 10H
                CON6:
                ADD DX,20
                INT 10H 
            ;}
        SUB DX,50
        ;}
        ;{ HORIZONTAL LINS OF 'U'
            ADD CX,50
            ADD DX,50
            INT 10H
            SUB CX,50
            SUB DX,50
        ;}
        ;{ HORIZONTAL LINS OF 'S'
            ADD CX,100
            INT 10H
            ADD DX,25
            INT 10H
            SUB DX,25
            ADD DX,50
            INT 10H
            SUB DX,50
            SUB CX,100
        ;}
    INC CX
    CMP CX,420
    JNZ RW
    MOV CX,380
    INC DX
    CMP DX,330
    JNZ CLM
;}
    MOV DX,320
    MOV CX,530
    ;{ THIS BLOCK JUST DRAW HORIZONTAL LINES OF BUSTER WORD
    CLMM: 
        ROOW:
        INT 10H
        ;{ HORIZONTAL LINS OF 'E'
            ADD CX,50
            INT 10H
            ADD DX,25
            INT 10H
            ADD DX,25
            INT 10H
            SUB CX,50
            SUB DX,50
        ;}
        ;{HORIZONTAL LINS OF 'R'
            ADD CX,100
            INT 10H
            ADD DX,20
            ;{ IF(R) WE HANDLE IT'S HORIZONTAL LINES 
                CMP CX,665
                JA K
                INT 10H
                JMP CON8
                K: CMP DX,345 
                JA CON8
                INT 10H
                CON7: CMP DX,355
                JB CON8
                INT 10H
                CON8: ADD DX,10
                CMP CX,665
                JA F
                INT 10H
                JMP CON9
                F: CMP DX,345 
                JA CON10
                INT 10H
                CON10: CMP DX,355
                JB CON9
                INT 10H
                CON9: 
            ;}
        SUB DX,30
        SUB CX,100
        ;}

        ;}
        INC CX
        CMP CX,570
        JNZ ROOW
    MOV CX,530
    INC DX
    CMP DX,330
    JNZ CLMM
;}    
ENDM BUSTERWORD