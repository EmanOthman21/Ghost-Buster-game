
.model small
.stack 64
.data    
STARTX equ 250
STARTY equ 400
HEGITH equ 60
WDTH equ 60

			
.code
main proc far
mov ax,@data
mov ds,ax



   ;{ OPEN VIDEO MODE
         MOV    AX, 4F02H 
         MOV    BX, 105H      
         INT    10H   
   ;}


       ;INITAL POINT
    MOV DX,STARTY ; Y = 250
    MOV CX,STARTX ; X = 400

    MOV AL,04
    MOV AH,0CH
    ;{ THIS DRAW ALL VERTICAL LINES OF GHOST WORD
    ROW: 

        COL:
        ;{ IF(S) WE HANDLE IT'S VERTICAL LINES 
                CMP DX,STARTY + HEGITH / 2
                JA C
                INT 10H
                ADD CX, WDTH - 10
                INT 10H
                SUB CX,WDTH - 10
                JMP CON2
                C: 
                ADD CX,WDTH / 2
                SUB CX,5
                INT 10H 
                ADD CX,5
                SUB CX,WDTH / 2
            ;} 
         CON2:    ;{
                ADD CX,WDTH + 10
                INT 10H
                
                ADD CX,WDTH/2
                SUB CX,5
                INT 10H
                SUB CX,WDTH/2
                ADD CX,5

                ADD CX,WDTH -10
                INT 10H
                SUB CX,WDTH - 10
                SUB CX,WDTH +10

            ;}
            ;{
                 ADD CX,2 * WDTH + 22
                 INT 10H
                 ADD CX,WDTH - 7
                 INT 10H
                 SUB CX,3 * WDTH + 15
            ;}
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
    MOV DX,STARTY + HEGITH / 2
    ;{ THIS BLOCK JUST DRAW HORIZONTAL LINES OF GHOST WORD
    CLM: 
        RW:
        ;{ HORIZONTAL LINS OF 'G'
            INT 10H
        ;}
        ;{
        ADD DX,HEGITH / 2 - 10
        ADD CX, WDTH + 10
        INT 10H
        SUB DX, HEGITH/2 - 10
        SUB CX,WDTH+10
        ;}
        
        INC CX
        CMP CX,STARTX + WDTH
        JNZ RW
    MOV CX,STARTX
    INC DX
    CMP DX,STARTY + HEGITH / 2 + 10
    JNZ CLM
;}
 ; BACK TO INTAIL POINT TO DRAW HORIZONTAL 
    MOV CX,STARTX + 2* WDTH + 30 
    MOV DX,STARTY
    MOV SI,STARTY
    ;{ THIS BLOCK JUST DRAW HORIZONTAL LINES OF GHOST WORD
    CLMN: 
        RWN:
        ;{ HORIZONTAL LINS OF 'N'
            INT 10H
        ;}
            INC CX
            INC DX
            CMP CX,STARTX + 3* WDTH + 17
        JNZ RWN
            ADD SI,1
            MOV CX,STARTX + 2* WDTH + 30
            MOV DX,SI
            CMP DX,STARTY + 14
    JNZ CLMN
;}

mov al,4ch
int 21h  

main endp



end main
