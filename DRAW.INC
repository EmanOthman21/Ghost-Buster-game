DRAW MACRO  WDTH,HEGITH,STARTX,STARTY,COLOR
LOCAL ROW, COL,C, CON2,CLM,CLMN,RW,RWN,CLMD,RWD,CLMDD,ROWDD,R,ROWRAW,ROWRAWW,CLMRAWW,K,CON8,CON9,CON10,CON7,F
PUSH AX
PUSH CX
PUSH DX
PUSH BX
PUSH SI
PUSH DI



   
    MOV    AX, 4F02H     ; THIS TO HANDLE FLICKERING WE REOPEN THE VIDEO MODE EVERYTIME 
    MOV    BX, 100H
    INT    10H
    MOV DX,STARTY ; Y = 250
    MOV CX,STARTX ; X = 400

    MOV AL,COLOR
    MOV AH,0CH
  
    ;{ THIS DRAW ALL VERTICAL LINES OF GHOST WORD
    ROW: 
        COL:
        ;{ IF(S) WE HANDLE IT'S VERTICAL LINES 
                INT 10H
                ADD CX, WDTH - 10
                INT 10H
            ;}
         CON2:
         SUB CX,WDTH - 10
        INC DX
        CMP DX,STARTY + HEGITH
        JNZ COL
    MOV DX,STARTY      
    INC CX
    CMP CX,STARTX + 10
    JNZ ROW    
    ;}


    ; BACK TO INTAIL POINT TO DRAW HORIZONTAL 
    MOV CX,STARTX
    MOV DX,STARTY 
    ;{ THIS BLOCK JUST DRAW HORIZONTAL LINES OF GHOST WORD
    CLM: 
        RW:
        ;{ HORIZONTAL LINS OF 'G'
            INT 10H
            ADD DX,HEGITH - 10
            INT 10H
        ;}
            SUB DX, HEGITH - 10
        INC CX
        CMP CX,STARTX + WDTH
        JNZ RW
    MOV CX,STARTX
    INC DX
    CMP DX,STARTY +  10 
    JNZ CLM
; }

    MOV CX,STARTX + WDTH 
    MOV DX,STARTY
    MOV SI,STARTY
    ;{ THIS BLOCK JUST DRAW HORIZONTAL LINES OF GHOST WORD
    CLMD: 
        RWD:
        ;{ HORIZONTAL LINS OF 'N'
            INT 10H
        ;}
            INC CX
            INC DX
            CMP CX,STARTX + WDTH + 5
        JNZ RWD
            ADD SI,1
            MOV CX,STARTX + WDTH 
            MOV DX,SI
            CMP DX,STARTY + 14
    JNZ CLMD
;}



    MOV CX,STARTX + WDTH 
    MOV DX,STARTY + HEGITH
    MOV SI,STARTY + HEGITH
    ;{ THIS BLOCK JUST DRAW HORIZONTAL LINES OF GHOST WORD
    CLMN: 
        RWN:
        ;{ HORIZONTAL LINS OF 'N'
            INT 10H
        ;}
            INC CX
            DEC DX
            CMP CX,STARTX + WDTH + 5
        JNZ RWN
            DEC SI
            MOV CX,STARTX + WDTH 
            MOV DX,SI
            CMP DX,STARTY + HEGITH -  14
    JNZ CLMN
;}

    MOV CX,STARTX + WDTH 
    MOV DX,STARTY + 10

    ;{ THIS DRAW ALL VERTICAL LINES OF GHOST WORD
    ROWDD: 
        COLDD:
        ;{ IF(S) WE HANDLE IT'S VERTICAL LINES 
                INT 10H
            ;}
        INC DX
        CMP DX,STARTY + HEGITH - 10
        JNZ COLDD
    MOV DX,STARTY +10      
    INC CX
    CMP CX,STARTX + WDTH + 5
    JNZ ROWDD  
    ;}
    
    MOV CX,STARTX + WDTH + 15
    MOV DX, STARTY

    ROWRAW: 
        COLRAW:
         ;{ VERTICAL LINS OF 'R'
            INT 10H
            ADD CX,WDTH - 10
                ;{ IF(R) WE HANDLE IT'S VERTICAL LINES 
                    CMP DX,STARTY +25
                    JA R
                    INT 10H
                    JMP CN
                    R: CMP DX,STARTY + 30 
                    JB CN
                    INT 10H
                ;}
         ;}
        CN:
        ;{
            ADD CX,20
            INT 10H
            ADD CX,WDTH -10
            INT 10H
        ;}

        ;{
            ADD CX,20
            INT 10H
            ADD CX,WDTH/2
            SUB CX,5
            INT 10H
            SUB CX,WDTH/2
            ADD CX,5
            ADD CX,WDTH -10
            INT 10H
        ;}
         SUB CX, 3*WDTH + 10
        INC DX
        CMP DX,STARTY + HEGITH
        JNZ COLRAW
    MOV DX,STARTY      
    INC CX
    CMP CX,STARTX + WDTH + 25 
    JNZ ROWRAW    
    ;}


    MOV CX,STARTX + WDTH + 15
    MOV DX, STARTY
    ;{ THIS BLOCK JUST DRAW HORIZONTAL LINES OF BUSTER WORD
    CLMRAWW: 
        ROWRAWW:
        INT 10H
        ;{HORIZONTAL LINS OF 'R'
            ADD DX,20
            ;{ IF(R) WE HANDLE IT'S HORIZONTAL LINES 
                CMP CX,STARTX + 2 * WDTH + 10
                JA K
                INT 10H
                JMP CON8
                K: CMP DX,STARTY + 25 
                JA CON8
                INT 10H
                CON7: CMP DX,STARTY + 35
                JB CON8
                INT 10H
                CON8: ADD DX,10
                CMP CX,STARTX + 2*WDTH + 10
                JA F
                INT 10H
                JMP CON9
                F: CMP DX,STARTY + 25  
                JA CON10
                INT 10H
                CON10: CMP DX,STARTY + 35
                JB CON9
                INT 10H
                
            ;}
            CON9:
            SUB DX,30
            ;{
                ADD CX,WDTH + 10
                INT 10H
                ADD DX,HEGITH/2 
                INT 10H
                ADD DX,HEGITH/2 -10
            ;} 
            ;{
                ADD CX,WDTH + 10
                INT 10H
                SUB CX,2*WDTH + 20
                SUB DX,HEGITH -10
            ;}

        INC CX
        CMP CX,STARTX + 2* WDTH + 15
        JNZ ROWRAWW
    MOV CX,STARTX + WDTH + 15
    INC DX
    CMP DX,STARTY + 10
    JNZ CLMRAWW
;}  

POP DI
POP SI
POP BX
POP DX
POP CX
POP AX

ENDM DRAW