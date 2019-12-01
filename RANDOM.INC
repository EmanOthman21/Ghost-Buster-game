;-----------------------------------------------------------------------------
;  MACRO TO GET RANDOM NUMBER WITHIN A PROVIDED RANGE 
;-----------------------------------------------------------------------------
RANDOMIZE MACRO LOWER, UPPER, NUMBER
   PUSH     AX
   PUSH     BX
   PUSH     CX
   PUSH     DX

   MOV      AH, 2CH  ;GET SYSTEM TIME
   INT      21H

   MOV      AL, DL
   SUB      DL, DL
   ADD      AX, DX
   SUB      DX, DX
   MOV      CX, UPPER
   SUB      CX, LOWER
   DIV      CX     ;THIS DIVIDES AX/CX AND THE REMAINDER IS AT DX(NUMBER WITHIN RANGE OF THE SUBTRACTION UPPER - LOWER)
   ADD      DX, LOWER
   MOV      NUMBER, DX

   POP      DX
   POP      CX
   POP      BX
   POP      AX
ENDM RANDOMIZE 