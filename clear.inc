;-----------------------------------------------------------------------------
;  macro to draw any needed object(square) providing the length of the side,
;  a register containing the offset of the colors in the ds, starting x and y
;-----------------------------------------------------------------------------
CLEAR_SCREEN MACRO SIZEX, SIZEY, X, Y
LOCAL INNERLOOP, OUTERLOOP
;{        
   PUSH AX
   PUSH DI
   PUSH SI
   PUSH CX
   PUSH BX
   MOV     DX, Y     ; Y TO START DRAWING AT
   MOV BP, SIZEY
   MOV AL, 0

   OUTERLOOP:;{ FOR(BP = 50; BD > 0; BP--)
      MOV     CX, X    ; X TO START 
      MOV DI, SIZEX
      INNERLOOP:;{ FOR(DX = 50; DX > 0; DX--)
         MOV     AH, 0CH    ; AH=0CH IS BIOS.WRITEPIXEL
         INT     10H
         INC     CX         ; NEXT X POSITION
         DEC     DI
         JNZ     INNERLOOP
         ;}
      INC     DX         ; NEXT Y POSITION
      DEC     BP
      JNZ     OUTERLOOP
	  
      POP BX
      POP CX
      POP SI   
      POP DI 
      POP AX
;} 
ENDM CLEAR_SCREEN
                          
                          