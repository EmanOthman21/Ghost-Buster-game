;-----------------------------------------------------------------------------
;  macro to draw any needed object(square) providing the length of the side,
;  a register containing the offset of the colors in the ds, starting x and y
;-----------------------------------------------------------------------------
DRAW_OBJECT MACRO SIZE, BITMAP, X, Y
LOCAL INNERLOOP, OUTERLOOP
;{
   MOV SI, BITMAP  ;TAKE THE RIGHT BITMAP FROM A REGISTER CONTAINING THE OFFSET
   MOV     DX, Y     ; Y TO START DRAWING AT
   MOV BP, SIZE        
   OUTERLOOP:;{ FOR(BP = 50; BD > 0; BP--)
      MOV     CX, X    ; X TO START 
      MOV DI, SIZE
      INNERLOOP:;{ FOR(DX = 50; DX > 0; DX--)
         LODSB              ; FETCH COLOR FOR THIS PIXEL
         MOV     AH, 0CH    ; AH=0CH IS BIOS.WRITEPIXEL
         INT     10H
         INC     CX         ; NEXT X POSITION
         DEC     DI
         JNZ     INNERLOOP
         ;}
      INC     DX         ; NEXT Y POSITION
      DEC     BP
      JNZ     OUTERLOOP
;} 
ENDM DRAW_OBJECT
