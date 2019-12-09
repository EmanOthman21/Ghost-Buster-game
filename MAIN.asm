EXTRN BITMAP_LEFT_PLAYER2 : BYTE 
EXTRN BITMAP_UPLEFT_PLAYER2 : BYTE
EXTRN BITMAP_UP_PLAYER2 : BYTE
EXTRN BITMAP_DOWNLEFT_PLAYER2 : BYTE
EXTRN BITMAP_DOWN_PLAYER2 : BYTE
EXTRN BITMAP_UP_PLAYER1 : BYTE
EXTRN BITMAP_DOWN_PLAYER1 : BYTE
EXTRN BITMAP_RIGHT_PLAYER1 : BYTE
EXTRN BITMAP_DOWNRIGHT_PLAYER1 : BYTE
EXTRN BITMAP_UPRIGHT_PLAYER1 : BYTE

EXTRN GHOST1_0 : BYTE
EXTRN GHOST1_1 : BYTE
EXTRN GHOST1_2 : BYTE
EXTRN GHOST2_0 : BYTE
EXTRN GHOST2_1 : BYTE
EXTRN GHOST2_2 : BYTE
EXTRN GHOST3_0 : BYTE
EXTRN GHOST3_1 : BYTE
EXTRN GHOST3_2 : BYTE

EXTRN PORTAL : BYTE

EXTRN Bullet_1_Model : BYTE
EXTRN BULLET_2_MODEL : BYTE

EXTRN RED_HEART : BYTE
EXTRN WHITE_HEART : BYTE

EXTRN DMG_PRUP_1 : BYTE
EXTRN DMG_PRUP_2 : BYTE
EXTRN SPD_PRUP_1 : BYTE
EXTRN SPD_PRUP_2 : BYTE

EXTRN LOGO : BYTE


EXTRN SOUND: FAR

INCLUDE RANDOM.INC
INCLUDE PRINTNUM.INC
INCLUDE BUNDRY.INC
INCLUDE DWOBJ.INC
INCLUDE MENU.INC
INCLUDE GHOST.INC
INCLUDE BUSTERS.INC
INCLUDE YWON.INC
INCLUDE DRAW.INC
INCLUDE DCOL.INC
INCLUDE NAMES.INC
INCLUDE NM2.INC
INCLUDE DISPLAY.INC

 .MODEL   LARGE;TINY   :DATA+CODE = 64KB    
            ;SMALL  :DATA = 64KB AND CODE = 64KB
            ;MEDIUM :DATA = 64KB BUT NO CODE RESTRICTION
            ;COMPACT:CODE = 64KB BUT NO DATA RESTRICTION
            ;LARGE  :SINGLE SET OF DATA CAN NOT EXCEED 64KB
            ;HUGE   :NO RESTRICTION
;------------------------------------------------------
.STACK 1024   ;1024 BYTES FOR STACK      
;------------------------------------------------------                    
.DATA                           
UPPERBOUND_Y DW 55   ;THOSE BOUNDARY VALUES ARE BASED ON 640*400 VIDEO MODE
LOWERBOUND_Y DW 360
LEFTBOUND_X DW 0
RIGHTBOUND_X DW 640

BUFFER DB 0                    
STARTPOS_X_PLAYER1 DW 50
STARTPOS_Y_PLAYER1 DW 150
TANK_HP_1 DW 10
TANK_SPEED_1 DW 3
TANK_DMG_1 DW 1                   ;DMG == DAMAGE OR STRENGTH                   
ORIENTATION_PLAYER1 DW 2          ; (0 UP, 1 UPRIGHT, 2 RIGHT, 3 DOWNRIGHT, 4 DOWN)

BULLET_1_START_POSITION_X DW 100  ;THE END POINT OF TANK 1 CANON SPECIFIED ACCORDING TO THE TANK POS AND ORIENTATION
BULLET_1_START_POSITION_Y DW 175

STARTPOS_X_PLAYER2 DW 550
STARTPOS_Y_PLAYER2 DW 150
TANK_HP_2 DW 10
TANK_SPEED_2 DW 3
TANK_DMG_2 DW 1           ;DMG == DAMAGE OR STRENGTH                     
ORIENTATION_PLAYER2 DW 2  ; (0 UP, 1 UPLEFT, 2 LEFT, 3 DOWNLEFT, 4 DOWN)

HEARTS_1_START_POSITION_X DW 5
HEARTS_1_START_POSITION_Y DW 10

HEARTS_2_START_POSITION_X DW 430
HEARTS_2_START_POSITION_Y DW 10

PWRUP_BAR_1_START_POSITION_X DW 5
PWRUP_BAR_1_START_POSITION_Y DW 32

PWRUP_BAR_2_START_POSITION_X DW 430
PWRUP_BAR_2_START_POSITION_Y DW 32

BULLET_2_START_POSITION_X DW 550  ;THE END POINT OF TANK 2 CANON SPECIFIED ACCORDING TO THE TANK POS AND ORIENTATION
BULLET_2_START_POSITION_Y DW 175

BULLET_1_POSITION_X DW 100 ;THE POSITION OF THE BULLET 1 AT ANY TIME AFTER IT IS FIRED
BULLET_1_POSITION_Y DW 175
BULLET_1_STATUS DW 0  ;BULLET 1 EXISTS OR NOT 0 -> NOT EXISTING
BULLET_1_MOTION_TYPE DW 2 ; (0 UP, 1 UPLEFT, 2 LEFT, 3 DOWNLEFT, 4 DOWN)
BULLET_1_SPEED DW 10 ;INITIAL BULLET SPEED WITHOUT ANY POWERUPS
BULLET_1_SPEED_POWER_NUM DW 0 ;TO KEEP TRACK HOW MANY TIMES PLAYER1 INCREASE HIS BULLET SPEED 

BULLET_2_POSITION_X DW 550 ;THE POSITION OF THE BULLET 2 AT ANY TIME AFTER IT IS FIRED
BULLET_2_POSITION_Y DW 175
BULLET_2_STATUS DW 0  ;BULLET 2 EXISTS OR NOT 0 -> NOT EXISTING
BULLET_2_MOTION_TYPE DW 2 ; (0 UP, 1 UPLEFT, 2 LEFT, 3 DOWNLEFT, 4 DOWN)
BULLET_2_SPEED DW 10 ;INITIAL BULLET SPEED WITHOUT ANY POWERUPS
BULLET_2_SPEED_POWER_NUM DW 0 ;TO KEEP TRACK HOW MANY TIMES PLAYER2 INCREASE HIS BULLET SPEED 

BULLET_SPEED_POWERUPS DW 2 ;EVERY SPEED POWERUP THE SPEED WILL INCREASE BY 2 (BUT HAVE LIMIT 3 TIMES AT MOST)


STARTPOS_X_GHOST1 DW ?
STARTPOS_Y_GHOST1 DW ?
EXISTS_GHOST1 DW 0   ; 0 DOESN'T EXIST 1 EXISTS
MOTION_GHOST1 DW 0   ; 0 INC X AND Y, 1 INC Y DEC X , 2 INC X DEC Y, 3 DEC X AND Y
POWERUP_GHOST1 DW 0  ; 0 INCREASE HP, 1 INCREASE SPEED, 2 INCREASE DAMAGE 
STARTPOS_X_PORTAL1 DW ? ;LOCATION OF THE GHOST PORTAL
STARTPOS_Y_PORTAL1 DW ? ;LOCATION OF THE GHOST PORTAL
TYPE_GHOST1 DW 0     ; TO CHOOSE ONE OF THREE SHAPES OF GHOSTS  (0, 1, 2)


STARTPOS_X_GHOST2 DW ?
STARTPOS_Y_GHOST2 DW ?
EXISTS_GHOST2 DW 0   ; 0 DOESN'T EXIST 1 EXISTS
MOTION_GHOST2 DW 1   ; 0 INC X AND Y, 1 INC Y DEC X , 2 INC X DEC Y, 3 DEC X AND Y
POWERUP_GHOST2 DW 1  ; 0 INCREASE HP, 1 INCREASE SPEED, 2 INCREASE DAMAGE
STARTPOS_X_PORTAL2 DW ? ;LOCATION OF THE GHOST PORTAL
STARTPOS_Y_PORTAL2 DW ? ;LOCATION OF THE GHOST PORTAL
TYPE_GHOST2 DW 0     ;TO CHOOSE ONE OF THREE SHPAES OF GHOSTS  (0, 1, 2)


STARTPOS_X_GHOST3 DW ?
STARTPOS_Y_GHOST3 DW ?
EXISTS_GHOST3 DW 0   ; 0 DOESN'T EXIST 1 EXISTS
MOTION_GHOST3 DW 2   ; 0 INC X AND Y, 1 INC Y DEC X , 2 INC X DEC Y, 3 DEC X AND Y
POWERUP_GHOST3 DW 2  ; 0 INCREASE HP, 1 INCREASE SPEED, 2 INCREASE DAMAGE
STARTPOS_X_PORTAL3 DW ? ;LOCATION OF THE GHOST PORTAL
STARTPOS_Y_PORTAL3 DW ? ;LOCATION OF THE GHOST PORTAL
TYPE_GHOST3 DW 0     ;TO CHOOSE ONE OF THREE SHPAES OF GHOSTS  (0, 1, 2)

PLAYER1_SCORE DW 0
PLAYER2_SCORE DW 0
SCORE1_DECIMAL DB 4 DUP('$')   
SCORE2_DECIMAL DB 4 DUP('$')   


TIME DW 120           ; TIMER TERMINATES THE GAME WHEN ZERO
TIME_DECIMAL DB 4 DUP('$')    ;FOR DECIMAL REPRESENTAION OF TIME ON SCREEN
RANDSEED DW 25173                ;RANDSEED USED FOR RANDOMIZATION
PREV_SYS_SECOND  DB ?
LOWER4MACRO DW ?
UPPER4MACRO DW ?


TANKSIZE DW 50       ; SIZE OF ANY DRAWN TANK
PORTAL_SIZE DW 50    ;SIZE OF THE GHOST PORTAL 
GHOSTSIZE DW 40      ; SIZE OF ANY GHOST
BULLETSIZE DW 10     ; SIZE OF A BULLET
HEARTSIZE DW 20      ;SIZE OF A HEART
PRUP_ICON_SIZE DW 20 ;SIZE OF THE POWER-UP ICONS 
LOGOSIZE DW 104      ;SIZE OF LOGO IN THE INTERFACE

WINNER DW ?          ;THE WINNNER PLAYER NUMBER

LOGO_X DW 475        ;POSITION OF LOGO IN INTERFACE
LOGO_Y DW 125        ;POSITION OF LOGO IN INTERFACE


PLAYER1NAME DB 20, ?, 20 DUP ('$')
PLAYER2NAME DB 20, ?, 20 DUP ('$')  
PLAYER1REQUESRNAME DB 'PLAYER1: PLEASE ENTER YOUR NAME: $'
PLAYER2REQUESRNAME DB 'PLAYER2: PLEASE ENTER YOUR NAME: $'
SPACE DB 15 DUP(' '),'$'
SCORE DB 'YOUR SCORE: $'


MENUITEM1 DB 'PRESS F1 TO START CHATTING$'
MENUITEM2 DB 'PRESS F2 TO START THE GAME$'
MENUITEM3 DB 'PRESS ESC TO EXIT THE PROGRAM$'



;---------------------------------------------------------------------------------------------------------
.CODE                                                 
MAIN                PROC         
   MOV     AX,@DATA   
   MOV     DS,AX      
 
 ;GET PLAYER NAMES
   NAMES
   NM2
   GAME_RESET:
      CALL MAIN_MENU
      JMP GAME_RESET
  
MAIN ENDP
;---------------------------------------
GAME_LOOP PROC NEAR
   MAINLOOP:
   ;{
         MOV    AX, 4F02H     ; THIS TO HANDLE FLICKERING WE REOPEN THE VIDEO MODE EVERYTIME 
         MOV    BX, 100H
         INT    10H

         PRINTNUM     TIME, TIME_DECIMAL,35,1    ;macro to display time
         CMP    TIME, 0                    ;END GAME AT TIME 0
         JE     ENDPROGRAM1
         MOV    AH, 2CH
         INT    21H
         CMP    DH, PREV_SYS_SECOND
         JE     NOTIMECHANGE
         SUB    TIME, 1                    ;DECREASE THE 
         MOV    AX, TIME  ;TO CHECK IF 10 DIVIDES TIME THEN A NEW WAVE OF GHOST APPEAR
         INC    AX
         MOV    BL, 10
         DIV    BL
         CMP    AH, 0
         JNE    NOGHOSTWAVE
         ;{ IF IT'S TIME FOR NEW WAVE INITIALIZE THEIR POSITIONS
               CALL    RANDOMIZE_GHOST1
               CALL    RANDOMIZE_GHOST2
               CALL    RANDOMIZE_GHOST3
         ;}
         

         NOTIMECHANGE:
               NOGHOSTWAVE:
                     MOV    PREV_SYS_SECOND, DH       ;CURRENT SECOND IS PREVIOUS FOR NEXT TIME
                     
                     CALL   MOVE_GHOST1
                     CALL   MOVE_GHOST2
                     CALL   MOVE_GHOST3
                     CALL   DRAW_PORTALS
                     CALL   DRAW_TANK1
                     CALL   DRAW_TANK2
					      CALL   DRAW_HEALTH_BAR_1
				      	CALL   DRAW_HEALTH_BAR_2
                     CALL   DRAW_GHOST1
                     CALL   DRAW_GHOST2
                     CALL   DRAW_GHOST3
                     CALL MOVE_BULLET_1
                     CALL MOVE_BULLET_2

               ;{CHECK FOR COLLISIONS BETWEEN THE GHOSTS AND TANK 1 IF THE GHOST EXISTS
                     CMP EXISTS_GHOST1, 1
                     JNE SKIP_GHOST1_CHECK1
                        CALL CHECK_HIT_GHOST1_TANK1
                     SKIP_GHOST1_CHECK1:

                     CMP EXISTS_GHOST2, 1
                     JNE SKIP_GHOST2_CHECK1
                        CALL CHECK_HIT_GHOST2_TANK1
                     SKIP_GHOST2_CHECK1:

                     CMP EXISTS_GHOST3, 1
                     JNE SKIP_GHOST3_CHECK1
                        CALL CHECK_HIT_GHOST3_TANK1
                     SKIP_GHOST3_CHECK1:
               ;}
                  
               ;{USELESS BLOCK TO HANDLE JUMP OUT OF RANGE
                  JMP SKIP1
                  ENDPROGRAM1: JMP ENDPROGRAM
                  SKIP1:
               ;}

               ;{SIMILAR CHECKS FOR COLLISIONS BETWEEN THE GHOSTS AND TANK 2 IF THE GHOST EXISTS
                     CMP EXISTS_GHOST1, 1
                     JNE SKIP_GHOST1_CHECK2
                        CALL CHECK_HIT_GHOST1_TANK2
                     SKIP_GHOST1_CHECK2:

                     CMP EXISTS_GHOST2, 1
                     JNE SKIP_GHOST2_CHECK2
                        CALL CHECK_HIT_GHOST2_TANK2
                     SKIP_GHOST2_CHECK2:

                     CMP EXISTS_GHOST3, 1
                     JNE SKIP_GHOST3_CHECK3
                        CALL CHECK_HIT_GHOST3_TANK2
                     SKIP_GHOST3_CHECK3:
               ;}

                     

               ;{BEFORE CHECKING COLLISION WE MUST MAKE SURE THE BULLET EXISTS IN THE FIRST PLACE
                     ;CHECK HITTING ANY GHOST
                     CMP BULLET_1_STATUS,1
                     JNE SKIP_BUL1_CHECKS1
                           CALL CHECK_HIT_BUL1_GHOST1
                     SKIP_BUL1_CHECKS1:

                     CMP BULLET_1_STATUS,1
                     JNE SKIP_BUL1_CHECKS2
                           CALL CHECK_HIT_BUL1_GHOST2
                     SKIP_BUL1_CHECKS2:

                     CMP BULLET_1_STATUS,1
                     JNE SKIP_BUL1_CHECKS3
                           CALL CHECK_HIT_BUL1_GHOST3
                     SKIP_BUL1_CHECKS3:
                     ;MAKE SURE IT STILL EXISTS CHECK HITTING THE TANK
                     CMP BULLET_1_STATUS,1
                     JNE SKIP_BUL1_CHECKS4
                           CALL CHECK_HIT_BUL1_TANK2
                     SKIP_BUL1_CHECKS4:
               ;}

               ;{SIMILAR CHECKS FOR BULLET 2
                     ;CHECK HITTING ANY GHOST
                     CMP BULLET_2_STATUS,1
                     JNE SKIP_BUL2_CHECKS1
                           CALL CHECK_HIT_BUL2_GHOST1
                     SKIP_BUL2_CHECKS1:

                     CMP BULLET_2_STATUS,1
                     JNE SKIP_BUL2_CHECKS2
                           CALL CHECK_HIT_BUL2_GHOST2
                     SKIP_BUL2_CHECKS2:

                     CMP BULLET_2_STATUS,1
                     JNE SKIP_BUL2_CHECKS3
                           CALL CHECK_HIT_BUL2_GHOST3
                     SKIP_BUL2_CHECKS3:
                     ;MAKE SURE IT STILL EXISTS CHECK HITTING THE TANK
                     CMP BULLET_2_STATUS,1
                     JNE SKIP_BUL2_CHECKS4
                           CALL CHECK_HIT_BUL2_TANK1
                     SKIP_BUL2_CHECKS4:
               ;}

               ;{DRAW POWER-UP BARS
                  CALL DRW_PRUP_BAR_1
                  CALL DRW_PRUP_BAR_2
               ;}
               
               ;{CHECK IF THE TWO BULLETS COLLIDE
                     CMP BULLET_1_STATUS,1
                     JNE SKIP_HITTING_CHECK
                     CMP BULLET_2_STATUS,1 
                     JNE SKIP_HITTING_CHECK
                        CALL BULLETS_HIT
                     SKIP_HITTING_CHECK:
               ;}

                     CALL DRAW_BULLET_1
                     CALL DRAW_BULLET_2
                    

               ;{ DELAY 0.125 SECOND  WHERE DELAY IN MELLISECOND IS CXDX  CX AND MSB AND DX AS LSB
                     MOV     CX, 00H
                     MOV     DX, 0C350H
                     MOV     AH, 86H
                     INT     15H
               ;}

               ;{EVERY GAMELOOP ITERATION WE CHECK FOR A WINNER
                  ;{CHECK IF THE SECOND PLAYER WON
                     MOV WINNER, 2
                     CMP TANK_HP_1, 0
                     JLE FAR PTR ENDPROGRAM
                  ;}
                  ;{CHECK IF THE FIRST PLAYER WON
                     MOV WINNER, 1
                     CMP TANK_HP_2, 0
                     JLE FAR PTR ENDPROGRAM
                  ;}
               ;}
               
               ;{ IF(USER PRESS ANY KEY)
                     MOV    AH, 1
                     INT    16H
                     JNZ    CHECKKEY
               ;}
               MAINLOOP1:
                     JMP    MAINLOOP
            CHECKKEY:
               ;{
                     CALL   USERINPUT
                     ;{IF THE PRESSED KEY IS ESC START THE GAME AGAIN
                        CMP AL, 1BH
                        JNE MAINLOOP1
                     ;}
               ;}


            ENDPROGRAM: 
               ;{       
                  MOV AX, TANK_HP_2
                  CMP TANK_HP_1,AX
                  JE DRAW_CASE
                  JG PLAYER1_WON
                  MOV WINNER,2
                  JMP RESULT

                  PLAYER1_WON:
                  MOV WINNER,1

                  RESULT:
                  CALL PLAYER_LOST
                  JMP END_MAIN_LOOP

                  MOV AX, TANK_HP_2 ;TO CHECK FOR REAL DRAW 
                  CMP TANK_HP_1, AX
                  JNE FAR PTR END_MAIN_LOOP
                  DRAW_CASE :
                  ;(
                    DRAW 60,60,190,190,03
                    CALL SOUND
                    DISPLAY_RESULT 
                    CALL CLEARKEYBOARDBUFFER
                  ;)  
               ;}
      END_MAIN_LOOP:
            RETN
GAME_LOOP         ENDP   

;------------------------------------------------------------------------------------
;  _    _   _____  ______  _____    _____  _   _  _____   _    _  _______  
; | |  | | / ____||  ____||  __ \  |_   _|| \ | ||  __ \ | |  | ||__   __| 
; | |  | || (___  | |__   | |__) |   | |  |  \| || |__) || |  | |   | |    
; | |  | | \___ \ |  __|  |  _  /    | |  | . ` ||  ___/ | |  | |   | |    
; | |__| | ____) || |____ | | \ \   _| |_ | |\  || |     | |__| |   | |    
;  \____/ |_____/ |______||_|  \_\ |_____||_| \_||_|      \____/    |_|    
;------------------------------------------------------------------------------------                                                                         
                                                                          

;------------------------------------------------------------------------
; CLEARS KEYBOARD BUFFER
;--------------------------------------------------------------------------
CLEARKEYBOARDBUFFER		PROC NEAR
	PUSH		AX
	PUSH		ES
	MOV		AX, 0000H
	MOV		ES, AX
	MOV		ES:[041AH], 041EH
	MOV		ES:[041CH], 041EH				; CLEARS KEYBOARD BUFFER
	POP		ES
	POP		AX
	RETN
CLEARKEYBOARDBUFFER		ENDP 

;------------------------------------------------------------------------
; TAKE ACTION BASED ON USER INPUT
;--------------------------------------------------------------------------
USERINPUT PROC NEAR 
;{    
      ;{ TAKE THE USER INPUT FROM THE KEYBOARD BUFFER
         MOV    AH, 0
         INT    16H      
         CALL   CLEARKEYBOARDBUFFER  
      ;} 
   
      MOVEUP1:
      ;{
         CMP    AL, 'w' 
         JNE    MOVEDOWN1
         MOV    CX, STARTPOS_Y_PLAYER1
         MOV    BX, UPPERBOUND_Y
         SUB    CX, BX
         CMP    CX, 3  ;CURRENT Y DISTANCE TO THE BOUNDARY VS REMAINING DISTANCE TO THE BOUNDARY
         JL     BACKTOMAINLOOP_1
         SUB    STARTPOS_Y_PLAYER1, 3
         JMP    BACKTOMAINLOOP_1     
      ;}
      
      MOVEDOWN1:
      ;{
         CMP    AL, 's' 
         JNE    ORIENT_UP1
         MOV    CX, STARTPOS_Y_PLAYER1
         ADD    CX, TANKSIZE    ;GET THE Y COORDINATE OF THE LOWEST POINT OF THE TANK
         MOV    BX, LOWERBOUND_Y
         SUB    BX, CX
         CMP    BX, 3  ;CURRENT Y DISTANCE TO THE BOUNDARY VS REMAINING DISTANCE TO THE BOUNDARY
         JL     BACKTOMAINLOOP_1
         ADD    STARTPOS_Y_PLAYER1, 3
         JMP    BACKTOMAINLOOP_1 
      ;}
      
      ORIENT_UP1:
      ;{
         CMP    AL, 'q' 
         JNE    ORIENT_DOWN1
         CMP    ORIENTATION_PLAYER1, 0
         JE     BACKTOMAINLOOP_1
         SUB    ORIENTATION_PLAYER1, 1 
         JMP    BACKTOMAINLOOP_1
      ;}
   
      ORIENT_DOWN1:
      ;{
         CMP    AL, 'e' 
         JNE    FIREBULLET1
         CMP    ORIENTATION_PLAYER1, 4
         JE     BACKTOMAINLOOP_1
         ADD    ORIENTATION_PLAYER1, 1 
         BACKTOMAINLOOP_1:      ;JUST A MIDDLE JUMP TO USE IT FOR THE PREVIOUS LABELS
         JMP    BACKTOMAINLOOP         
      ;}

      FIREBULLET1:
      ;{
         CMP AL, 32 
         JNE MOVEUP2
         CALL FIRE_BULLET_1
         JMP BACKTOMAINLOOP_1
      ;}

      MOVEUP2:
      ;{
         CMP    AL, 'i' 
         JNE    MOVEDOWN2
         MOV    CX, STARTPOS_Y_PLAYER2
         MOV    BX, UPPERBOUND_Y
         SUB    CX, BX
         CMP    CX, 3  ;CURRENT Y DISTANCE TO THE BOUNDARY VS REMAINING DISTANCE TO THE BOUNDARY
         JL     BACKTOMAINLOOP_2
         SUB    STARTPOS_Y_PLAYER2, 3
         JMP    BACKTOMAINLOOP   
      ;}
      
      MOVEDOWN2:
      ;{
         CMP    AL, 'k' 
         JNE    ORIENT_UP2
         MOV    CX, STARTPOS_Y_PLAYER2
         ADD    CX, TANKSIZE    ;GET THE Y COORDINATE OF THE LOWEST POINT OF THE TANK
         MOV    BX, LOWERBOUND_Y
         SUB    BX, CX
         CMP    BX, 3  ;CURRENT Y DISTANCE TO THE BOUNDARY VS REMAINING DISTANCE TO THE BOUNDARY
         JL     BACKTOMAINLOOP_2
         ADD    STARTPOS_Y_PLAYER2, 3
         JMP    BACKTOMAINLOOP 
      ;}
      
      ORIENT_UP2:
      ;{
         CMP    AL, 'o' 
         JNE    ORIENT_DOWN2
         CMP    ORIENTATION_PLAYER2, 0
         JE     BACKTOMAINLOOP_2
         SUB    ORIENTATION_PLAYER2, 1 
         JMP    BACKTOMAINLOOP_2
      ;}

      ORIENT_DOWN2:
      ;{
         CMP    AL, 'u' 
         JNE    FIRE_BULLET_2
         CMP    ORIENTATION_PLAYER2, 4
         JE     BACKTOMAINLOOP_2
         ADD    ORIENTATION_PLAYER2, 1 
         JMP    BACKTOMAINLOOP_2         
      ;}

      FIRE_BULLET_2:
      ;{
         CMP AL , 13
         JNE SKIP_FIRE_BULLET_2
         CALL FIRE_BULLET2
         SKIP_FIRE_BULLET_2:
         JMP BACKTOMAINLOOP_2
      ;}

BACKTOMAINLOOP_2:

      ;{RETNURN STORED DATA
         BACKTOMAINLOOP:
      ;}   
RETN    ; IMPORTANT WE NEED AL FROM THIS PROC TO STAY THE SAME AFTER RETURN TO CHECK FOR THE ESC KEY PRESS OUTSIDE THIS PROC
USERINPUT		ENDP 
;----------------------------------------------------------------------------
;  _______         _   _  _  __
; |__   __| /\    | \ | || |/ /
;    | |   /  \   |  \| || ' / 
;    | |  / /\ \  | . ` ||  <  
;    | | / ____ \ | |\  || . \ 
;    |_|/_/    \_\|_| \_||_|\_\
;----------------------------------------------------------------------------                              
;--------------------------------------------------------------------------
; DRAWS THE FIRST PLAYER'S TANK
;-------------------------------------------------------------------------

DRAW_TANK1 PROC NEAR 
;{
    ;{SAVE DATA  
      PUSH   AX
      PUSH   BX
      PUSH    CX
      PUSH   DX
   ;}
   
   ;{;TO STORE THE TANK SIZE TO BE SENT TO THE DRAWING MACRO
      MOV    BX, TANKSIZE    
      CMP    ORIENTATION_PLAYER1, 0
      JNE    UPRIGHT
   ;}

   ;{ IF(ORIENTATION IS UP)
      MOV    SI, OFFSET BITMAP_UP_PLAYER1
      
      ;SET BULLET 1 STARTING POSITION X,Y
      MOV AX, BX ;GET HALF THE TANK SIZE 
      SHR AX , 1    
      MOV DX, STARTPOS_X_PLAYER1
      ADD DX, AX    ;ADD HALF THE SIZE OF THE TANK TO THE START REACH THE MIDPOINT OF THE UPPER EDGE
      MOV AX ,BULLETSIZE ;DIVIDE BULLET SIZE BY 2
      SHR AX, 1      
      SUB DX, AX    ;SUBTRACT HALF THE BULLET SIZE TO GET TO THE BULLETSTART POS STARTPOS_X_PLAYER1
      MOV BULLET_1_START_POSITION_X,DX
      MOV CX, STARTPOS_Y_PLAYER1
      SUB CX, BULLETSIZE   ;BULLET DRAWING STARTING POINT IS ABOVE THE CANON BY BULLET SIZE
      MOV BULLET_1_START_POSITION_Y, CX

      JMP    DRAWTANK 
   ;}
   UPRIGHT:
      ;{   
         CMP    ORIENTATION_PLAYER1, 1
         JNE    RIGHT
            ;{ IF(ORIENTATION IS UPRIGHT)
               MOV    SI, OFFSET BITMAP_UPRIGHT_PLAYER1

               ;SET BULLET 1 STARTING POSITION X,Y
               MOV DX, STARTPOS_X_PLAYER1
               ADD DX, BX  ;MOVE TO THE TOP RIGHT VERTIX BY ADDING TANK SIZE
               MOV BULLET_1_START_POSITION_X, DX
               MOV DX, STARTPOS_Y_PLAYER1
               SUB DX, BULLETSIZE
               MOV BULLET_1_START_POSITION_Y, DX ;BULLET DRAWING STARTING POINT IS ABOVE THE CANON BY BULLET SIZE

               JMP    DRAWTANK  
            ;}
      ;}
   RIGHT:
   ;{
         CMP    ORIENTATION_PLAYER1, 2
         JNE    DOWNRIGHT
         ;{ IF(ORIENTATION IS RIGHT)
            MOV    SI, OFFSET BITMAP_RIGHT_PLAYER1

            ;SET BULLET 1 STARTING POSITION X,Y
            MOV DX, STARTPOS_X_PLAYER1
            ADD DX , BX   ;ADD THE TANK SIZE TO REACH THE TOP RIGHT VERTIX
            MOV BULLET_1_START_POSITION_X, DX
            MOV AX , BX ;GET HALF THE TANK SIZE
            SHR AX, 1 
            MOV DX, AX
            MOV AX, BULLETSIZE
            SHR AX, 1
            SUB DX, AX  ;SUBTRACT HALF THE BULLETSIZE TO REACH TOP LEFT VERTIX OF THE BULLET
            SUB DX, 6   ;A RANDOM NUMBER TO MAKE THE BULLET GET OUT OF THE CANON NOT BELOW IT 
            MOV CX, STARTPOS_Y_PLAYER1
            ADD CX, DX
            MOV BULLET_1_START_POSITION_Y, CX             
            
              JMP DRAWTANK
         ;}
   ;}
   DOWNRIGHT:
   ;{
         CMP    ORIENTATION_PLAYER1, 3
         JNE    DOWN1
         ;{ IF(ORIENTATION IS DOWNRIGHT)
            MOV    SI, OFFSET BITMAP_DOWNRIGHT_PLAYER1

            ;SET BULLET 1 STARTING POSITION X,Y
            MOV DX, STARTPOS_X_PLAYER1
            ADD DX, BX ;ADD TANK SIZE TO REACH THE TOP RIGHT VERTIX OF THE TANK
            MOV BULLET_1_START_POSITION_X, DX
            MOV DX, STARTPOS_Y_PLAYER1
            ADD DX, BX ;ADD THE TANK SIZE IN Y TO GO TO THE BOTTOM LEFT VERTIX
            MOV BULLET_1_START_POSITION_Y, DX
            
            JMP DRAWTANK  
         ;}
   ;}

    
   DOWN1:
   ;{
         MOV    SI, OFFSET BITMAP_DOWN_PLAYER1

         ;SET BULLET 1 STARTING POSITION X,Y
         MOV AX , BX ;GET HALF THE TANK SIZE
         SHR AX,1
         MOV DX, AX
         MOV AX, BULLETSIZE
         SHR AX,1
         SUB DX, AX  ;SUBTRACT HALF THE BULLETSIZE TO REACH TOP LEFT VERTIX OF THE BULLET
         MOV CX, STARTPOS_X_PLAYER1
         ADD CX, DX
         MOV BULLET_1_START_POSITION_X, CX
         MOV DX,STARTPOS_Y_PLAYER1
         ADD DX, BX  ;ADD TANK SIZE TO REACH THE BOTTOM END
         MOV BULLET_1_START_POSITION_Y, DX              
   ;}
   DRAWTANK:
   ;{
         DRAW_OBJECT    TANKSIZE, SI, STARTPOS_X_PLAYER1, STARTPOS_Y_PLAYER1
   ;}
   ;{GET DATA STORED
      POP DX
      POP CX
      POP BX
      POP AX
   ;}
RETN
;}
DRAW_TANK1	ENDP

;--------------------------------------------------------------------------
; DRAWS THE SECOND PLAYER'S TANK
;-------------------------------------------------------------------------

DRAW_TANK2 PROC NEAR 
;{
   ;{STORE DATA
      PUSH    AX
      PUSH    BX
      PUSH    CX
      PUSH    DX
   ;}   
   MOV    BX, TANKSIZE    ;TO STORE THE TANK SIZE TO BE SENT TO THE DRAWING MACRO
   CMP    ORIENTATION_PLAYER2, 0
   JNE    UPLEFT
   ;{ IF(ORIENTATION IS UP)
      MOV    SI, OFFSET BITMAP_UP_PLAYER2 

      ;SET BULLET 2 STARTING POSITION X,Y
      MOV AX, BX ;GET HALF THE TANK SIZE 
      SHR AX , 1    
      MOV DX, STARTPOS_X_PLAYER2
      ADD DX, AX    ;ADD HALF THE SIZE OF THE TANK TO THE START REACH THE MIDPOINT OF THE UPPER EDGE
      MOV AX ,BULLETSIZE ;DIVIDE BULLET SIZE BY 2
      SHR AX, 1      
      SUB DX, AX    ;SUBTRACT HALF THE BULLET SIZE TO GET TO THE BULLETSTART POS STARTPOS_X_PLAYER1
      MOV BULLET_2_START_POSITION_X,DX
      MOV CX, STARTPOS_Y_PLAYER2
      SUB CX, BULLETSIZE   ;BULLET DRAWING STARTING POINT IS ABOVE THE CANON BY BULLET SIZE
      MOV BULLET_2_START_POSITION_Y, CX
      
      JMP    DRAWTANK2
   ;}
   UPLEFT: 
   ;{  
      CMP    ORIENTATION_PLAYER2, 1
      JNE    LEFT
         ;{ IF(ORIENTATION IS UPLEFT)
            MOV    SI, OFFSET BITMAP_UPLEFT_PLAYER2

            ;SET BULLET 2 STARTING POSITION X,Y
            MOV DX, BULLETSIZE
            MOV CX, STARTPOS_X_PLAYER2
            SUB CX, DX 
            MOV BULLET_2_START_POSITION_X, CX
            MOV CX, STARTPOS_Y_PLAYER2
            SUB CX , DX 
            MOV BULLET_2_START_POSITION_Y, CX
            
            JMP    DRAWTANK2  
         ;}
   ;}
   LEFT:
   ;{
      CMP    ORIENTATION_PLAYER2, 2
      JNE    DOWNLEFT
         ;{ IF(ORIENTATION IS LEFT)
            MOV    SI, OFFSET BITMAP_LEFT_PLAYER2

            ;SET BULLET 2 STARTING POSITION X,Y
            MOV DX, BULLETSIZE
            MOV CX, STARTPOS_X_PLAYER2 
            SUB CX, DX                    ;SUBTRACT BULLET SIZE TO REACH THE TOP LEFT CORNER OF THE BULLET GRID
            MOV BULLET_2_START_POSITION_X, CX

            MOV AX , BX ;GET HALF THE TANK SIZE
            SHR AX, 1 
            MOV DX, AX
            MOV AX, BULLETSIZE
            SHR AX, 1
            SUB DX, AX  ;SUBTRACT HALF THE BULLETSIZE TO REACH TOP LEFT VERTIX OF THE BULLET
            SUB DX, 6   ;A RANDOM NUMBER TO MAKE THE BULLET GET OUT OF THE CANON NOT BELOW IT 
            MOV CX, STARTPOS_Y_PLAYER2
            ADD CX, DX
            MOV BULLET_2_START_POSITION_Y, CX  

            JMP    DRAWTANK2  
         ;}
   ;}   
   DOWNLEFT:
   ;{
      CMP    ORIENTATION_PLAYER2, 3
      JNE    DOWN2
         ;{ IF(ORIENTATION IS DOWNLEFT)
            MOV    SI, OFFSET BITMAP_DOWNLEFT_PLAYER2

            ;SET BULLET 2 STARTING POSITION X,Y
            MOV DX, BULLETSIZE
            MOV CX, STARTPOS_X_PLAYER2
            SUB CX, DX        ;SUBTRACT BULLET SIZE FROM STATRING POSITION TO REACH TOP LEFT VERTIX OF THE BULLET GRID
            MOV BULLET_2_START_POSITION_X, CX
            MOV CX, STARTPOS_Y_PLAYER2
            ADD CX, BX
            MOV BULLET_2_START_POSITION_Y, CX

            JMP    DRAWTANK2  
         ;}
   ;}
   DOWN2:
   ;{
      MOV    SI, OFFSET BITMAP_DOWN_PLAYER2

      ;SET BULLET 2 STARTING POSITION X,Y
      MOV AX , BX ;GET HALF THE TANK SIZE
      SHR AX,1
      MOV DX, AX
      MOV AX, BULLETSIZE
      SHR AX,1
      SUB DX, AX  ;SUBTRACT HALF THE BULLETSIZE TO REACH TOP LEFT VERTIX OF THE BULLET
      MOV CX, STARTPOS_X_PLAYER2
      ADD CX, DX
      MOV BULLET_2_START_POSITION_X, CX
      MOV DX,STARTPOS_Y_PLAYER2
      ADD DX, BX  ;ADD TANK SIZE TO REACH THE BOTTOM END
      MOV BULLET_2_START_POSITION_Y, DX

   ;}
   DRAWTANK2:
   ;{
      DRAW_OBJECT     TANKSIZE, SI, STARTPOS_X_PLAYER2, STARTPOS_Y_PLAYER2
   ;}
   ;{GET DATA SOTRED
      POP    DX
      POP    CX
      POP    BX
      POP    AX
   ;}
RETN
;}
DRAW_TANK2	ENDP
;-------------------------------------------------------------------------------
;   _____  _    _   ____    _____  _______ 
;  / ____|| |  | | / __ \  / ____||__   __|
; | |  __ | |__| || |  | || (___     | |   
; | | |_ ||  __  || |  | | \___ \    | |   
; | |__| || |  | || |__| | ____) |   | |   
;  \_____||_|  |_| \____/ |_____/    |_|   
;-------------------------------------------------------------------------------
;--------------------------------------------------------------------------
; MAKES RANDOM PLACE FOR THE FIRST GHOST
;-------------------------------------------------------------------------
RANDOMIZE_GHOST1 PROC NEAR
;{
   ;{
      PUSH   AX
      PUSH   BX
      PUSH   CX
      PUSH   DX
   ;}
   MOV    EXISTS_GHOST1, 1
   RANDOMIZE 0, 3, MOTION_GHOST1, RANDSEED
   RANDOMIZE 0, 2, POWERUP_GHOST1, RANDSEED
   RANDOMIZE 0, 2, TYPE_GHOST1, RANDSEED 

   ;{  TO START APPROX IN THE MIDDLE
   MOV AX, LOWERBOUND_Y
   ADD AX, UPPERBOUND_Y
   SHR AX, 1
   MOV BX, AX
   SUB AX, 20
   ADD BX, 20
   MOV LOWER4MACRO, AX      
   MOV UPPER4MACRO, BX     
   ;}

   
   RANDOMIZE LOWER4MACRO, UPPER4MACRO, STARTPOS_Y_GHOST1, RANDSEED


    ;{  TO START APPROX IN THE MIDDLE
   MOV AX, RIGHTBOUND_X
   ADD AX, LEFTBOUND_X
   SHR AX, 1
   MOV BX, AX
   SUB AX, 20
   ADD BX, 20
   MOV LOWER4MACRO, AX      
   MOV UPPER4MACRO, BX     
   ;}

   
   RANDOMIZE LOWER4MACRO, UPPER4MACRO, STARTPOS_X_GHOST1, RANDSEED
  
   ;{GHOST PORTAL LOCATION
   MOV AX, STARTPOS_X_GHOST1
   SUB AX, 10
   MOV STARTPOS_X_PORTAL1, AX
   MOV AX, STARTPOS_Y_GHOST1
   SUB AX, 10
   MOV STARTPOS_Y_PORTAL1, AX 
   ;}

   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;} 
RANDOMIZE_GHOST1 ENDP

;--------------------------------------------------------------------------
; MAKES RANDOM PLACE FOR THE SECOND GHOST
;-------------------------------------------------------------------------

RANDOMIZE_GHOST2 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX

   MOV EXISTS_GHOST2, 1
   
   ;{ RANDOMIZE MOVEMENT DIRECTION WITH 1 (DOWNLEFT) OR 3 (UPLEFT)
   RANDOMIZE 0, 3 , MOTION_GHOST2, RANDSEED
   CMP MOTION_GHOST2, 2
   JB MOV_DOWNLEFT2
   MOV MOTION_GHOST2, 3    ;MOV UPLEFT
   JMP MOV_UPLEFT2
   MOV_DOWNLEFT2:
   MOV MOTION_GHOST2, 1    ;MOVE BY INC Y AND DEC X
   MOV_UPLEFT2:
   ;}
   
   RANDOMIZE 0, 2, POWERUP_GHOST2, RANDSEED
   RANDOMIZE 0, 2, TYPE_GHOST2, RANDSEED
   

   MOV AX, LOWERBOUND_Y
   SUB AX, 50
   MOV UPPER4MACRO, AX
   MOV AX, UPPERBOUND_Y
   MOV LOWER4MACRO, AX
   RANDOMIZE LOWER4MACRO, UPPER4MACRO, STARTPOS_Y_GHOST2, RANDSEED



   MOV AX, RIGHTBOUND_X
   SHR AX, 1
   SUB AX, 100
   MOV UPPER4MACRO, AX
   MOV BX, LEFTBOUND_X 
   ADD BX, 110
   MOV LOWER4MACRO, BX
   RANDOMIZE LOWER4MACRO, UPPER4MACRO, STARTPOS_X_GHOST2, RANDSEED
  
   ;{GHOST PORTAL LOCATION
   MOV AX, STARTPOS_X_GHOST2
   SUB AX, 10
   MOV STARTPOS_X_PORTAL2, AX
   MOV AX, STARTPOS_Y_GHOST2
   SUB AX, 10
   MOV STARTPOS_Y_PORTAL2, AX 
   ;}
   
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;} 
RANDOMIZE_GHOST2 ENDP

;--------------------------------------------------------------------------
; MAKES RANDOM PLACE FOR THE THIRD GHOST
;-------------------------------------------------------------------------

RANDOMIZE_GHOST3 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX

   MOV EXISTS_GHOST3, 1    ;MOVE BY INC X AND DEC Y
   
   ;{ RANDOMIZE MOVEMENT DIRECTION WITH 0 (DOWNRIGHT) OR 2 (UPRIGHT)
   RANDOMIZE 0, 3 , MOTION_GHOST3, RANDSEED
   CMP MOTION_GHOST3, 2
   JB MOV_DOWNRIGHT3
   MOV MOTION_GHOST3, 2    ;MOV UPRIGHT
   JMP MOV_UPRIGHT3
   MOV_DOWNRIGHT3:
   MOV MOTION_GHOST3, 0    ;MOVE DOWNRIGHT
   MOV_UPRIGHT3:
   ;}


   RANDOMIZE 0, 2, TYPE_GHOST3, RANDSEED
   RANDOMIZE 0, 2, POWERUP_GHOST3, RANDSEED

   
   MOV AX, LOWERBOUND_Y
   SUB AX, 50
   MOV UPPER4MACRO, AX
   MOV AX, UPPERBOUND_Y
   MOV LOWER4MACRO, AX
   RANDOMIZE  LOWER4MACRO, UPPER4MACRO, STARTPOS_Y_GHOST3, RANDSEED



   MOV AX, RIGHTBOUND_X
   SHR AX, 1
   SUB AX, 50
   MOV LOWER4MACRO, AX
   MOV BX, RIGHTBOUND_X 
   SUB BX, 80
   MOV UPPER4MACRO, BX
   RANDOMIZE LOWER4MACRO, UPPER4MACRO, STARTPOS_X_GHOST3, RANDSEED
   
   ;{GHOST PORTAL LOCATION
   MOV AX, STARTPOS_X_GHOST3
   SUB AX, 10
   MOV STARTPOS_X_PORTAL3, AX
   MOV AX, STARTPOS_Y_GHOST3
   SUB AX, 10
   MOV STARTPOS_Y_PORTAL3, AX 
   ;}

   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;} 
RANDOMIZE_GHOST3 ENDP

;--------------------------------------------------------------------------
; DRAW THE FIRST GHOST
;-------------------------------------------------------------------------

DRAW_GHOST1 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX

   CMP EXISTS_GHOST1, 1
   JNE ENDDRAW_GHOST11
   WITHIN_BOUNDARIES STARTPOS_X_GHOST1, STARTPOS_Y_GHOST1, GHOSTSIZE , EXISTS_GHOST1 ;CHECK WHETHER WITHIN BOUNDARIES
   CMP EXISTS_GHOST1, 1
   ENDDRAW_GHOST11:     ; JUST A MIDDLE LABEL FOR JUMP
   JNE ENDDRAW_GHOST1

  

   ;{FIRST TYPE 
   CMP TYPE_GHOST1, 0
   MOV SI, OFFSET GHOST1_0
   JE DRAW1
   ;}

   ;{SECOND TYPE 
   CMP TYPE_GHOST1, 1
   MOV SI, OFFSET GHOST1_1
   JE DRAW1
   ;}

   ;{THIRD TYPE
   MOV SI, OFFSET GHOST1_2
   ;}

   DRAW1:
   DRAW_OBJECT GHOSTSIZE, SI, STARTPOS_X_GHOST1, STARTPOS_Y_GHOST1
   
  
   JMP SKIP_MOVING_GHOST1_OUT
   ENDDRAW_GHOST1:
   MOV STARTPOS_Y_GHOST1, 0
   SKIP_MOVING_GHOST1_OUT:
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;} 
DRAW_GHOST1 ENDP

;--------------------------------------------------------------------------
; MOVES THE FIRST GHOST
;-------------------------------------------------------------------------

MOVE_GHOST1 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX

   CMP EXISTS_GHOST1, 1
   JNE ENDMOVE_GHOST1
   DOWNRIGHT_GHOST1:
   ;{ DOWNRIGHT MOVEMENT
      CMP MOTION_GHOST1, 0
      JNE DOWNLEFT_GHOST1
      ADD STARTPOS_X_GHOST1, 3
      ADD STARTPOS_Y_GHOST1, 3
      JMP ENDMOVE_GHOST1
   ;}
   DOWNLEFT_GHOST1:
   ;{ DOWNLEFT MOVEMENT
      CMP MOTION_GHOST1, 1
      JNE UPRIGHT_GHOST1
      SUB STARTPOS_X_GHOST1, 3
      ADD STARTPOS_Y_GHOST1, 3
      JMP ENDMOVE_GHOST1
   ;}
   UPRIGHT_GHOST1:
   ;{ UPRIGHT MOVEMENT
      CMP MOTION_GHOST1, 2
      JNE UPLEFT_GHOST1
      ADD STARTPOS_X_GHOST1, 3
      SUB STARTPOS_Y_GHOST1, 3
      JMP ENDMOVE_GHOST1
   ;}
   UPLEFT_GHOST1:
   ;{ UPLEFT MOVEMENT 
      CMP MOTION_GHOST1, 3
      ;JNE ENDMOVE_GHOST1
      SUB STARTPOS_X_GHOST1, 3
      SUB STARTPOS_Y_GHOST1, 3
      JMP ENDMOVE_GHOST1
   ;}
   
   ENDMOVE_GHOST1:
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;} 
MOVE_GHOST1 ENDP


;--------------------------------------------------------------------------
;  DRAWS THE SECOND GHOST
;-------------------------------------------------------------------------

DRAW_GHOST2 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX

   CMP EXISTS_GHOST2, 1
   JNE ENDDRAW_GHOST21
   WITHIN_BOUNDARIES STARTPOS_X_GHOST2, STARTPOS_Y_GHOST2, GHOSTSIZE , EXISTS_GHOST2 ;CHECK WHETHER WITHIN BOUNDARIES
   CMP EXISTS_GHOST2, 1
   ENDDRAW_GHOST21:    ;JUST A MIDDLE LABEL FOR JUMP
   JNE ENDDRAW_GHOST2


   


   ;{FIRST TYPE 
   CMP TYPE_GHOST2, 0
   MOV SI, OFFSET GHOST2_0
   JE DRAW2
   ;}

   ;{SECOND TYPE 
   CMP TYPE_GHOST2, 1
   MOV SI, OFFSET GHOST2_1
   JE DRAW2
   ;}

   ;{THIRD TYPE
   MOV SI, OFFSET GHOST2_2
   ;}

   DRAW2:
   DRAW_OBJECT GHOSTSIZE, SI, STARTPOS_X_GHOST2, STARTPOS_Y_GHOST2
   
  
   JMP SKIP_MOVING_GHOST2_OUT
   ENDDRAW_GHOST2:
   MOV STARTPOS_Y_GHOST2, 0
   SKIP_MOVING_GHOST2_OUT:
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;} 
DRAW_GHOST2 ENDP


;--------------------------------------------------------------------------
; MOVES THE SECOND GHOST
;--------------------------------------------------------------------------
MOVE_GHOST2 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX

   CMP EXISTS_GHOST2, 1
   JNE ENDMOVE_GHOST2
   DOWNRIGHT_GHOST2:
   ;{ DOWNRIGHT MOVEMENT
      CMP MOTION_GHOST2, 0
      JNE DOWNLEFT_GHOST2
      ADD STARTPOS_X_GHOST2, 3
      ADD STARTPOS_Y_GHOST2, 3
      JMP ENDMOVE_GHOST2
   ;}
   DOWNLEFT_GHOST2:
   ;{ DOWNLEFT MOVEMENT
      CMP MOTION_GHOST2, 1
      JNE UPRIGHT_GHOST2
      SUB STARTPOS_X_GHOST2, 3
      ADD STARTPOS_Y_GHOST2, 3
      JMP ENDMOVE_GHOST2
   ;}
   UPRIGHT_GHOST2:
   ;{ UPRIGHT MOVEMENT
      CMP MOTION_GHOST2, 2
      JNE UPLEFT_GHOST2
      ADD STARTPOS_X_GHOST2, 3
      SUB STARTPOS_Y_GHOST2, 3
      JMP ENDMOVE_GHOST2
   ;}
   UPLEFT_GHOST2:
   ;{ UPLEFT MOVEMENT
      CMP MOTION_GHOST2, 3
      JNE ENDMOVE_GHOST2
      SUB STARTPOS_X_GHOST2, 3
      SUB STARTPOS_Y_GHOST2, 3
      JMP ENDMOVE_GHOST2
   ;}
   
   ENDMOVE_GHOST2:
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;} 
MOVE_GHOST2 ENDP


;--------------------------------------------------------------------------
; DRAWS THE THIRD GHOST
;-------------------------------------------------------------------------

DRAW_GHOST3 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX

   CMP EXISTS_GHOST3, 1
   JNE ENDDRAW_GHOST31
   WITHIN_BOUNDARIES STARTPOS_X_GHOST3, STARTPOS_Y_GHOST3, GHOSTSIZE , EXISTS_GHOST3 ;CHECK WHETHER WITHIN BOUNDARIES
   CMP EXISTS_GHOST3, 1
   ENDDRAW_GHOST31:       ;JUST A MIDDLE LABEL FOR JUMP
   JNE ENDDRAW_GHOST3
   
   

   ;{FIRST TYPE 
   CMP TYPE_GHOST3, 0
   MOV SI, OFFSET GHOST3_0
   JE DRAW3
   ;}

   ;{SECOND TYPE 
   CMP TYPE_GHOST3, 1
   MOV SI, OFFSET GHOST3_1
   JE DRAW3
   ;}

   ;{THIRD TYPE
   MOV SI, OFFSET GHOST3_2
   ;}

   DRAW3:
   DRAW_OBJECT GHOSTSIZE, SI, STARTPOS_X_GHOST3, STARTPOS_Y_GHOST3
   
  
   JMP SKIP_MOVING_GHOST3_OUT
   ENDDRAW_GHOST3:
   ;MOVE THE GHOST OUTISIDE BOUNDARIES OF GAME
   MOV STARTPOS_Y_GHOST3, 0
   SKIP_MOVING_GHOST3_OUT:
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;} 
DRAW_GHOST3 ENDP


;--------------------------------------------------------------------------
; MOVES THE THIRD GHOST
;-------------------------------------------------------------------------
MOVE_GHOST3 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX

   CMP EXISTS_GHOST3, 1
   JNE ENDMOVE_GHOST3
   DOWNRIGHT_GHOST3:
   ;{ DOWNRIGHT MOVEMENT
      CMP MOTION_GHOST3, 0
      JNE DOWNLEFT_GHOST3
      ADD STARTPOS_X_GHOST3, 3
      ADD STARTPOS_Y_GHOST3, 3
      JMP ENDMOVE_GHOST3
   ;}
   DOWNLEFT_GHOST3:
   ;{ DOWNLEFT MOVEMENT
      CMP MOTION_GHOST3, 1
      JNE UPRIGHT_GHOST3
      SUB STARTPOS_X_GHOST3, 3
      ADD STARTPOS_Y_GHOST3, 3
      JMP ENDMOVE_GHOST3
   ;}
   UPRIGHT_GHOST3:
   ;{ UPRIGHT MOVEMENT
      CMP MOTION_GHOST3, 2
      JNE UPLEFT_GHOST3
      ADD STARTPOS_X_GHOST3, 3
      SUB STARTPOS_Y_GHOST3, 3
      JMP ENDMOVE_GHOST3
   ;}
   UPLEFT_GHOST3:
   ;{ UPLEFT MOVEMENT
      CMP MOTION_GHOST3, 3
      JNE ENDMOVE_GHOST3
      SUB STARTPOS_X_GHOST3, 3
      SUB STARTPOS_Y_GHOST3, 3
      JMP ENDMOVE_GHOST3
   ;}
   
   ENDMOVE_GHOST3:
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;} 
MOVE_GHOST3 ENDP


;---------------------------------------------------------------------------------------------------
; DRAWS THE PORTALS FROM WHICH GHOSTS COME FROM
;---------------------------------------------------------------------------------------------------
DRAW_PORTALS PROC NEAR 
;{

   ;{DRAW GHOST PORTAL
   CMP EXISTS_GHOST1, 0
   JE NOGHOST1
   LEA SI, PORTAL
   DRAW_OBJECT PORTAL_SIZE, SI, STARTPOS_X_PORTAL1, STARTPOS_Y_PORTAL1 
   ;}

   NOGHOST1:
   ;{DRAW GHOST PORTAL
   CMP EXISTS_GHOST2, 0
   JE NOGHOST2
   LEA SI, PORTAL
   DRAW_OBJECT PORTAL_SIZE, SI, STARTPOS_X_PORTAL2, STARTPOS_Y_PORTAL2 
   ;}
   NOGHOST2:
   ;{DRAW GHOST PORTAL
   CMP EXISTS_GHOST3, 0
   JE NOGHOST3
   LEA SI, PORTAL
   DRAW_OBJECT PORTAL_SIZE, SI, STARTPOS_X_PORTAL3, STARTPOS_Y_PORTAL3 
   ;}
   NOGHOST3:
   RETN
;}
DRAW_PORTALS ENDP


;------------------------------------------------------------------------------------------
 ; _             _  _        _        
 ;| |           | || |      | |       
 ;| |__   _   _ | || |  ___ | |_  ___ 
 ;| '_ \ | | | || || | / _ \| __|/ __|
 ;| |_) || |_| || || ||  __/| |_ \__ \
 ;|_.__/  \__,_||_||_| \___| \__||___/
 ;-------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------
; FIRES A BULLET FROM TANK 1 CANON SET ITS MOTION TYPE ONLY CALLED TO INTIALIZE A BULLET ONCE FIRED
;---------------------------------------------------------------------------------------------------
FIRE_BULLET_1 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
   
   ;IF(BULLET_1_STATUS == 1) -> ANOTHER BULLET EXISTS WE CAN'T FIRE 
   CMP BULLET_1_STATUS,1
      JE RETN_FIRE_BUL_1   
   ;ELSE DRAW A BULLET AT START POSITION
      MOV BULLET_1_STATUS, 1 ;TO FIRE A BULLET
      ;INITAILIZE WITH BULLET START POSTION
      MOV BX , BULLET_1_START_POSITION_X
      MOV BULLET_1_POSITION_X, BX
      MOV BX, BULLET_1_START_POSITION_Y
      MOV BULLET_1_POSITION_Y, BX
      MOV BX, ORIENTATION_PLAYER1 ;INTIALIZED THE SAME AS THE TANK ORIENTAION
      MOV BULLET_1_MOTION_TYPE, BX
      CALL DRAW_BULLET_1    
   
   RETN_FIRE_BUL_1:
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;}
FIRE_BULLET_1 ENDP

;------------------------------------------------------------------------------
; DRAWS A BULLET 1 AT BULLET_POSTION_1 X , Y IF THE BULLET EXISTS (STATUS == 1)
;------------------------------------------------------------------------------
DRAW_BULLET_1 PROC NEAR
;{   
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
   ;IF(BULLET STATUS = 0) -> WE WILL NOT DRAW IT
   CMP BULLET_1_STATUS, 1
   JNE RETN_DRW_BUL_11   
   ;CHECK THE BULLET IS WITHIN BOUNDARIES
   WITHIN_BOUNDARIES BULLET_1_POSITION_X, BULLET_1_POSITION_Y, BULLETSIZE , BULLET_1_STATUS ;RETNURNS IN BULLETSTATUS 0 IF NOT WITHIN
   ;IF(IT IS NOT WITHIN BOUNDARIES DONNOT DRAW)
      CMP BULLET_1_STATUS, 1
      RETN_DRW_BUL_11:      ;USELESS LABEL FOR INTERMEDIATE JUMP
      JNE RETN_DRW_BUL_1
      MOV BX , BULLETSIZE
      MOV SI, OFFSET Bullet_1_Model
      DRAW_OBJECT BULLETSIZE , SI , BULLET_1_POSITION_X, BULLET_1_POSITION_Y
   RETN_DRW_BUL_1:
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;}
DRAW_BULLET_1 ENDP
;------------------------------------------------------------------------------
; MOVES BULLET 1 IF IT EXISTS ACCORDING TO ITS TYPE OF MOTION
; NOTE BULLET SPEED IS CURRENTLY HARDCODED , INCREASING IT CAN BE DONE FROM THIS PROC NEAREDURE 
;------------------------------------------------------------------------------
MOVE_BULLET_1 PROC NEAR 
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
   ;IF(BULLETSTATUS == 0) -> BULLET DOESNT EXIST
   CMP BULLET_1_STATUS, 0
   JE RETN_MOV_BUL_1
   ;ELSE IF THE BULLET EXISTS IT WILL BE MOVED ACCORDING TO ITS MOTIONTYPE(0:UPWARDS, 1:UPRIGHT, 2:RIGHT, 3:DOWNRIGHT, 4:DOWN)
   ;CHECK THAT IT WILL NOT GET OUT OF BOUNDARIES
   MOV AX ,BULLET_1_SPEED                
   ;{
      CMP BULLET_1_MOTION_TYPE,0
      JNE UPRIGHTB
      SUB BULLET_1_POSITION_Y, AX         ;MOVE WITH SPEED 
      JMP RETN_MOV_BUL_1
   ;}
   UPRIGHTB:
   ;{
      CMP BULLET_1_MOTION_TYPE,1
      JNE RIGHTB
      CMP BULLET_1_SPEED_POWER_NUM,1
      JA UP_RIGHT_SPEED
      SUB AX,4
      JMP UP_RIGHT_MOVEMENT
   UP_RIGHT_SPEED: 
      SUB AX,8                            ;UP RIGHT SPEED =NORMAL SPEED - 8      (YOU CAN CHANGE IT)
   UP_RIGHT_MOVEMENT:   
      ADD BULLET_1_POSITION_X,AX
      SUB BULLET_1_POSITION_Y,AX
      MOV AX,BULLET_1_SPEED               ;RESET AX=SPEED OF BULLET 
      JMP RETN_MOV_BUL_1
   ;}
   RIGHTB:
   ;{
      CMP BULLET_1_MOTION_TYPE,2
      JNE DOWNRIGHTB
      ADD BULLET_1_POSITION_X, AX
      JMP RETN_MOV_BUL_1 
   ;}
   DOWNRIGHTB:
   ;{
      CMP BULLET_1_MOTION_TYPE,3
      JNE DOWNB
      CMP BULLET_1_SPEED_POWER_NUM,1
      JA DOWN_RIGHT_SPEED
      SUB AX,4
      JMP DOWN_RIGHT_MOVEMENT
   DOWN_RIGHT_SPEED:
      SUB AX,8                           ;DOWN RIGHT SPEED =NORMAL SPEED - 8      (YOU CAN CHANGE IT)
   DOWN_RIGHT_MOVEMENT:  
      ADD BULLET_1_POSITION_Y, AX
      ADD BULLET_1_POSITION_X, AX
      MOV AX,BULLET_1_SPEED
      JMP RETN_MOV_BUL_1
   ;}
   DOWNB:
   ;{
      ADD BULLET_1_POSITION_Y, AX
   ;}

   RETN_MOV_BUL_1:
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;}  
MOVE_BULLET_1 ENDP

;---------------------------------------------------------------------------------------------------
; FIRES A BULLET FROM TANK 2 CANON SET ITS MOTION TYPE ONLY CALLED TO INTIALIZE A BULLET ONCE FIRED
;---------------------------------------------------------------------------------------------------
FIRE_BULLET2 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
   
   ;IF(BULLET_2_STATUS == 1) -> ANOTHER BULLET EXISTS WE CAN'T FIRE 
   CMP BULLET_2_STATUS,1
      JE RETN_FIRE_BUL_2   
   ;ELSE DRAW A BULLET AT START POSITION
      MOV BULLET_2_STATUS, 1 ;TO FIRE A BULLET
      ;INITAILIZE WITH BULLET START POSTION
      MOV BX , BULLET_2_START_POSITION_X
      MOV BULLET_2_POSITION_X, BX
      MOV BX, BULLET_2_START_POSITION_Y
      MOV BULLET_2_POSITION_Y, BX
      MOV BX, ORIENTATION_PLAYER2 ;INTIALIZED THE SAME AS THE TANK ORIENTAION
      MOV BULLET_2_MOTION_TYPE, BX
      CALL DRAW_BULLET_2    
   
   RETN_FIRE_BUL_2:
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;}
FIRE_BULLET2 ENDP
;------------------------------------------------------------------------------
; DRAWS BULLET 2 AT BULLET_POSTION_1 X , Y IF THE BULLET EXISTS (STATUS == 1)
;------------------------------------------------------------------------------
DRAW_BULLET_2 PROC NEAR
;{   
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
   ;IF(BULLET STATUS = 0) -> WE WILL NOT DRAW IT
   CMP BULLET_2_STATUS, 1
   JNE RETN_DRW_BUL_22   
   ;CHECK THE BULLET IS WITHIN BOUNDARIES
   WITHIN_BOUNDARIES BULLET_2_POSITION_X, BULLET_2_POSITION_Y, BULLETSIZE , BULLET_2_STATUS ;RETNURNS IN BULLETSTATUS 0 IF NOT WITHIN
   ;IF(IT IS NOT WITHIN BOUNDARIES DONNOT DRAW)
      CMP BULLET_2_STATUS, 1
      RETN_DRW_BUL_22:      ;USELESS LABEL FOR INTERMEDIATE JUMP
      JNE RETN_DRW_BUL_2
      MOV SI, OFFSET Bullet_2_Model
      DRAW_OBJECT BULLETSIZE , SI , BULLET_2_POSITION_X, BULLET_2_POSITION_Y
   RETN_DRW_BUL_2:
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;}
DRAW_BULLET_2 ENDP

;-----------------------------------------------------------------------------------------
; MOVES BULLET 2 IF IT EXISTS ACCORDING TO ITS TYPE OF MOTION
; NOTE BULLET SPEED IS CURRENTLY HARDCODED , INCREASING IT CAN BE DONE FROM THIS PROC NEAREDURE 
;-----------------------------------------------------------------------------------------
MOVE_BULLET_2 PROC NEAR 
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
   ;IF(BULLETSTATUS == 0) -> BULLET DOESNT EXIST
   CMP BULLET_2_STATUS, 0
   JE RETN_MOV_BUL_2
   ;ELSE IF THE BULLET EXISTS IT WILL BE MOVED ACCORDING TO ITS MOTIONTYPE(0:UPWARDS, 1:UPLEFT, 2:LEFT, 3:DOWNLEFT, 4:DOWN)
   ;CHECK THAT IT WILL NOT GET OUT OF BOUNDARIES
   MOV AX,BULLET_2_SPEED
   ;{
      CMP BULLET_2_MOTION_TYPE,0
      JNE UPLEFTB
      SUB BULLET_2_POSITION_Y, AX
      JMP RETN_MOV_BUL_2
   ;}
   UPLEFTB:
   ;{
      CMP BULLET_2_MOTION_TYPE,1
      JNE LEFTB
      CMP BULLET_2_SPEED_POWER_NUM,1
      JA UP_LEFT
      SUB AX,5
      JMP UP_LEFT_MOVEMENT
   UP_LEFT:   
      SUB AX,8
   UP_LEFT_MOVEMENT:   
      SUB BULLET_2_POSITION_X,AX
      SUB BULLET_2_POSITION_Y,AX
      MOV AX,BULLET_2_SPEED
      JMP RETN_MOV_BUL_2
   ;}
   LEFTB:
   ;{
      CMP BULLET_2_MOTION_TYPE,2
      JNE DOWNLEFTB
      SUB BULLET_2_POSITION_X, AX
      
      JMP RETN_MOV_BUL_2 
  ;}
   DOWNLEFTB:
   ;{
      CMP BULLET_2_MOTION_TYPE,3
      JNE DOWNB2
      CMP BULLET_2_SPEED_POWER_NUM,1
      JA DOWN_LEFT
   SUB AX,5
      JMP DOWN_LEFT_MOVEMENT
   DOWN_LEFT:   
      SUB AX,8
   DOWN_LEFT_MOVEMENT:
      ADD BULLET_2_POSITION_Y, AX
      SUB BULLET_2_POSITION_X, AX
      MOV AX,BULLET_2_SPEED
      JMP RETN_MOV_BUL_2
   ;}
   DOWNB2:
   ;{
      ADD BULLET_2_POSITION_Y, AX
   ;}

   RETN_MOV_BUL_2:
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;}  
MOVE_BULLET_2 ENDP
 
;-----------------------------------------------------------------------------------------
;Detects if bullet 1 hits tank 2 
;-----------------------------------------------------------------------------------------
CHECK_HIT_BUL1_TANK2 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
      DETECT_COLLISION STARTPOS_X_PLAYER2, STARTPOS_Y_PLAYER2, TANKSIZE, BULLET_1_POSITION_X, BULLET_1_POSITION_Y, BULLETSIZE, BULLET_1_STATUS
      ;IF(BULLET1 STATUS == 0) -> THEN THERE IS A COLLISION 
      ;BULLET1 SHOULD BE REMOVED WHILE TANK2 SHOULD LOSE HP ACCORDING TO BULLET DAMAGE
      ;{
         CMP BULLET_1_STATUS, 0
         JNE NOHIT1
         ;MAY BE SPLIT IN ANOTHER PROC NEAREDURE JUSTFOR TESTING FOR NOW
         ;SUBTRACT THE DAMAGE FROM TANK2 
         MOV AX, TANK_DMG_1         
         ADD PLAYER1_SCORE, AX
         SUB TANK_HP_2, AX            ;OTHERWISE HIS HP WILL DECREASE BY THE OTHER TANK DAMAGE  
      ;}
   NOHIT1:   
   POP DX
   POP CX
   POP BX
   POP AX
   RETN
;}   
CHECK_HIT_BUL1_TANK2 ENDP

;-----------------------------------------------------------------------------------------
;Detects if bullet 1 hits Ghost1 
;-----------------------------------------------------------------------------------------
CHECK_HIT_BUL1_GHOST1 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX

      ;(BULLET_1_STATUS IS 0 IF IT COLLIDES 1 OTHERWISE)
      DETECT_COLLISION BULLET_1_POSITION_X, BULLET_1_POSITION_Y, BULLETSIZE, STARTPOS_X_GHOST1, STARTPOS_Y_GHOST1, GHOSTSIZE, BULLET_1_STATUS     
      CMP BULLET_1_STATUS, 0
      JNE GHOST1_LIVES
      CMP EXISTS_GHOST1, 1
      JNE GHOST1_LIVES
      INC PLAYER1_SCORE
      ;POWER-UPS
      ;( 
      CMP POWERUP_GHOST1,0         ;IF POWERUPS=0 IT WILL INCREASE THE HP BY 1 UNLESS HE HAS HP=10
      JZ HP_LIMIT1
      JNZ SPEED_INCREASE1
      ;)
      HP_LIMIT1:
      ;(
      CMP TANK_HP_1,10                     
      JZ T1_KILL_G1                ;IF HP=10 KILL THE GHOST WITHOUT INCREASING HP
      ADD TANK_HP_1,1
      JMP T1_KILL_G1
      ;)

      SPEED_INCREASE1:
      ;(
      CMP POWERUP_GHOST1,1         ;IF POWERUPS=1 THE SPEED WILL INCREASE BUT IT HAS LIMIT (AT MOST 3 TIMES)
      JZ SPEED_LIMIT1
      JNZ INCREASE_DAMAGE1
      ;)
      INCREASE_DAMAGE1:
      ;(
          MOV TANK_DMG_1,2        ;IF POWERUPS=2  THE TANK DAMAGE WILL BE 2 
          JMP T1_KILL_G1
      ;)
      SPEED_LIMIT1:
      ;(
         CMP BULLET_1_SPEED_POWER_NUM,3          ;IF NUMBER OF SPEED POWERUPS =3 KILL THE GHOST ONLY
         JNL T1_KILL_G1
         MOV AX,BULLET_SPEED_POWERUPS
         ADD BULLET_1_SPEED,AX
         INC BULLET_1_SPEED_POWER_NUM
      ;)
    T1_KILL_G1:  
     ;(      
      ;GHOST 1 SHOULD DIE, WE MAY CHECK FOR POWER-UPS HERE
      MOV EXISTS_GHOST1, 0
      ;THROW GHOST1 OUT OF BOUNDARIES TO AVOID BEING HIT WHILE TRANSPARENT
      SUB STARTPOS_Y_GHOST1, 600
      ;)
      
   GHOST1_LIVES:   
   POP DX
   POP CX
   POP BX
   POP AX
   RETN
;}   
CHECK_HIT_BUL1_GHOST1 ENDP

;-----------------------------------------------------------------------------------------
;Detects if bullet 1 hits Ghost2 
;-----------------------------------------------------------------------------------------
CHECK_HIT_BUL1_GHOST2 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
         ;(BULLET_1_STATUS IS 0 IF IT COLLIDES 1 OTHERWISE)
      DETECT_COLLISION BULLET_1_POSITION_X, BULLET_1_POSITION_Y, BULLETSIZE, STARTPOS_X_GHOST2, STARTPOS_Y_GHOST2, GHOSTSIZE, BULLET_1_STATUS     
      CMP BULLET_1_STATUS, 0
      JNE GHOST2_LIVES
      CMP EXISTS_GHOST2,1
      JNE GHOST2_LIVES
      INC PLAYER1_SCORE
      ;POWER-UPS
      ;( 
      CMP POWERUP_GHOST2,0
      JZ HP_LIMIT2
      JNZ SPEED_INCREASE2
      ;)
      HP_LIMIT2:
      ;(
      CMP TANK_HP_1,10
      JZ T1_KILL_G2
      ADD TANK_HP_1,1
      JMP T1_KILL_G2
      ;)

      SPEED_INCREASE2:
      ;(
      CMP POWERUP_GHOST2,1
      JZ SPEED_LIMIT2
      JNZ INCREASE_DAMAGE2
      ;)
      INCREASE_DAMAGE2:
      ;(
           
          MOV TANK_DMG_1,2
          JMP T1_KILL_G2
      ;)
      SPEED_LIMIT2:
      ;( 
         CMP BULLET_1_SPEED_POWER_NUM,3
         JNL T1_KILL_G2
         MOV AX,BULLET_SPEED_POWERUPS
         ADD BULLET_1_SPEED,AX
         INC BULLET_1_SPEED_POWER_NUM
      ;)
    T1_KILL_G2:  
      ;(
      ;GHOST 2 SHOULD DIE, WE MAY CHECK FOR POWER-UPS HERE
      MOV EXISTS_GHOST2, 0
      ;THROW GHOST2 OUT OF BOUNDARIES TO AVOID BEING HIT WHILE TRANSPARENT
      SUB STARTPOS_Y_GHOST2, 600
      ;)
   GHOST2_LIVES:   
   POP DX
   POP CX
   POP BX
   POP AX
   RETN
;}   
CHECK_HIT_BUL1_GHOST2 ENDP

;-----------------------------------------------------------------------------------------
;Detects if bullet 1 hits Ghost3 
;-----------------------------------------------------------------------------------------
CHECK_HIT_BUL1_GHOST3 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX

      ;(BULLET_1_STATUS IS 0 IF IT COLLIDES 1 OTHERWISE)
      DETECT_COLLISION BULLET_1_POSITION_X, BULLET_1_POSITION_Y, BULLETSIZE, STARTPOS_X_GHOST3, STARTPOS_Y_GHOST3, GHOSTSIZE, BULLET_1_STATUS     
      CMP BULLET_1_STATUS, 0
      JNE GHOST3_LIVES
      CMP EXISTS_GHOST3,1
      JNE GHOST3_LIVES
      INC PLAYER1_SCORE
      ;POWER-UPS
      ;( 
      CMP POWERUP_GHOST3,0
      JZ HP_LIMIT3
      JNZ SPEED_INCREASE3
      ;)
      HP_LIMIT3:
      ;(
      CMP TANK_HP_1,10
      JZ T1_KILL_G3
      ADD TANK_HP_1,1
      JMP T1_KILL_G3
      ;)

      SPEED_INCREASE3:
      ;(
      CMP POWERUP_GHOST3,1
      JZ SPEED_LIMIT3
      JNZ INCREASE_DAMAGE3
      ;)
      INCREASE_DAMAGE3:
      ;(
          
          MOV TANK_DMG_1,2
          JMP T1_KILL_G3
      ;)
      SPEED_LIMIT3:
      ;(
         CMP BULLET_1_SPEED_POWER_NUM,3
         JNL T1_KILL_G3
         MOV AX,BULLET_SPEED_POWERUPS
         ADD BULLET_1_SPEED,AX
         INC BULLET_1_SPEED_POWER_NUM
      ;)
    T1_KILL_G3:  
      ;GHOST 3 SHOULD DIE, WE MAY CHECK FOR POWER-UPS HERE
      MOV EXISTS_GHOST3, 0
      ;THROW GHOST3 OUT OF BOUNDARIES TO AVOID BEING HIT WHILE TRANSPARENT
      SUB STARTPOS_Y_GHOST3, 600
   GHOST3_LIVES:   
   POP DX
   POP CX
   POP BX
   POP AX
   RETN
;}   
CHECK_HIT_BUL1_GHOST3 ENDP

;-----------------------------------------------------------------------------------------
;Detects if bullet 2 hits tank 1 
;-----------------------------------------------------------------------------------------
CHECK_HIT_BUL2_TANK1 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
      DETECT_COLLISION STARTPOS_X_PLAYER1, STARTPOS_Y_PLAYER1, TANKSIZE, BULLET_2_POSITION_X, BULLET_2_POSITION_Y, BULLETSIZE, BULLET_2_STATUS
      ;IF(BULLET1 STATUS == 0) -> THEN THERE IS A COLLISION 
      ;BULLET1 SHOULD BE REMOVED WHILE TANK2 SHOULD LOSE HP ACCORDING TO BULLET DAMAGE
      ;{
         CMP BULLET_2_STATUS, 0
         JNE NOHIT2
         ;MAY BE SPLIT IN ANOTHER PROC NEAREDURE JUSTFOR TESTING FOR NOW
         ;SUBTRACT THE DAMAGE FROM TANK2
         MOV AX, TANK_DMG_2        ;IF HP<= THE OTHER TANK DAMAGE THIS PLAYER WILL LOSE
         ADD PLAYER2_SCORE, AX
         SUB TANK_HP_1, AX         ;OTHERWISE HIS HP WILL DECREASE BY THE OTHER TANK DAMAGE
      ;}
   NOHIT2:   
   POP DX
   POP CX
   POP BX
   POP AX
   RETN
;}   
CHECK_HIT_BUL2_TANK1 ENDP

;-----------------------------------------------------------------------------------------
;Detects if bullet 2 hits Ghost1 
;-----------------------------------------------------------------------------------------
CHECK_HIT_BUL2_GHOST1 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
      ;(BULLET_1_STATUS IS 0 IF IT COLLIDES 1 OTHERWISE)
      DETECT_COLLISION BULLET_2_POSITION_X, BULLET_2_POSITION_Y, BULLETSIZE, STARTPOS_X_GHOST1, STARTPOS_Y_GHOST1, GHOSTSIZE, BULLET_2_STATUS     
      CMP BULLET_2_STATUS, 0
      JNE GHOST1_LIVES2
      CMP EXISTS_GHOST1,1
      JNE GHOST1_LIVES2
      INC PLAYER2_SCORE
      ;POWER-UPS
      ;( 
      CMP POWERUP_GHOST1,0
      JZ HP2_LIMIT1
      JNZ SPEED2_INCREASE1
      ;)
      HP2_LIMIT1:
      ;(
      CMP TANK_HP_2,10
      JZ T2_KILL_G1
      ADD TANK_HP_2,1
      JMP T2_KILL_G1
      ;)

      SPEED2_INCREASE1:
      ;(
      CMP POWERUP_GHOST1,1
      JZ SPEED2_LIMIT1
      JNZ INCREASE2_DAMAGE1
      ;)
      INCREASE2_DAMAGE1:
      ;(
           
          MOV TANK_DMG_2,2
          JMP T2_KILL_G1
      ;)
      SPEED2_LIMIT1:
      ;(
         CMP BULLET_2_SPEED_POWER_NUM,3
         JNL T2_KILL_G1
         MOV AX,BULLET_SPEED_POWERUPS
         ADD BULLET_2_SPEED,AX
         INC BULLET_2_SPEED_POWER_NUM
      ;)
      ;GHOST 1 SHOULD DIE, WE MAY CHECK FOR POWER-UPS HERE
      T2_KILL_G1:
      ;(
      MOV EXISTS_GHOST1, 0
      ;THROW GHOST1 OUT OF BOUNDARIES TO AVOID BEING HIT WHILE TRANSPARENT
      SUB STARTPOS_Y_GHOST1, 600
      ;)
   GHOST1_LIVES2:   
   POP DX
   POP CX
   POP BX
   POP AX
   RETN
;}   
CHECK_HIT_BUL2_GHOST1 ENDP

;-----------------------------------------------------------------------------------------
;Detects if bullet 2 hits Ghost2 
;-----------------------------------------------------------------------------------------
CHECK_HIT_BUL2_GHOST2 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
      ;(BULLET_1_STATUS IS 0 IF IT COLLIDES 1 OTHERWISE)
      DETECT_COLLISION BULLET_2_POSITION_X, BULLET_2_POSITION_Y, BULLETSIZE, STARTPOS_X_GHOST2, STARTPOS_Y_GHOST2, GHOSTSIZE, BULLET_2_STATUS     
      CMP BULLET_2_STATUS, 0
      JNE GHOST2_LIVES2
      CMP EXISTS_GHOST2,1
      JNE GHOST2_LIVES2
      INC PLAYER2_SCORE
       ;POWER-UPS
      ;( 
      CMP POWERUP_GHOST2,0
      JZ HP2_LIMIT2
      JNZ SPEED2_INCREASE2
      ;)
      HP2_LIMIT2:
      ;(
      CMP TANK_HP_2,10
      JZ T2_KILL_G2
      ADD TANK_HP_2,1
      JMP T2_KILL_G2
      ;)

      SPEED2_INCREASE2:
      ;(
      CMP POWERUP_GHOST2,1
      JZ SPEED2_LIMIT2
      JNZ INCREASE2_DAMAGE2
      ;)
      INCREASE2_DAMAGE2:
      ;(
         
         MOV TANK_DMG_2,2
         JMP T2_KILL_G2
      ;)
      SPEED2_LIMIT2:
      ;(
         CMP BULLET_2_SPEED_POWER_NUM,3
         JNL T2_KILL_G2
         MOV AX,BULLET_SPEED_POWERUPS
         ADD BULLET_2_SPEED,AX
         INC BULLET_2_SPEED_POWER_NUM
      ;)
      ;GHOST 2 SHOULD DIE, WE MAY CHECK FOR POWER-UPS HERE
      T2_KILL_G2:
      
      MOV EXISTS_GHOST2, 0
      ;THROW GHOST2 OUT OF BOUNDARIES TO AVOID BEING HIT WHILE TRANSPARENT
      SUB STARTPOS_Y_GHOST2, 600
   GHOST2_LIVES2:   
   POP DX
   POP CX
   POP BX
   POP AX
   RETN
;}   
CHECK_HIT_BUL2_GHOST2 ENDP

;-----------------------------------------------------------------------------------------
;Detects if bullet 2 hits Ghost3 
;-----------------------------------------------------------------------------------------
CHECK_HIT_BUL2_GHOST3 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
      ;(BULLET_1_STATUS IS 0 IF IT COLLIDES 1 OTHERWISE)
      DETECT_COLLISION BULLET_2_POSITION_X, BULLET_2_POSITION_Y, BULLETSIZE, STARTPOS_X_GHOST3, STARTPOS_Y_GHOST3, GHOSTSIZE, BULLET_2_STATUS     
      CMP BULLET_2_STATUS, 0
      JNE GHOST3_LIVES2
      CMP EXISTS_GHOST3,1
      JNE GHOST3_LIVES2
      INC PLAYER2_SCORE
      ;POWER-UPS
      ;( 
      CMP POWERUP_GHOST3,0
      JZ HP2_LIMIT3
      JNZ SPEED2_INCREASE3
      ;)
      HP2_LIMIT3:
      ;(
      CMP TANK_HP_2,10
      JZ T2_KILL_G3
      ADD TANK_HP_2,1
      JMP T2_KILL_G3
      ;)

      SPEED2_INCREASE3:
      ;(
      CMP POWERUP_GHOST3,1
      JZ SPEED2_LIMIT3
      JNZ INCREASE2_DAMAGE3
      ;)
      INCREASE2_DAMAGE3:
      ;(
         
          MOV TANK_DMG_2,2
          JMP T2_KILL_G3
      ;)
      SPEED2_LIMIT3:
      ;(
         CMP BULLET_2_SPEED_POWER_NUM,3
         JNL T2_KILL_G3
         MOV AX,BULLET_SPEED_POWERUPS
         ADD BULLET_2_SPEED,AX
         INC BULLET_2_SPEED_POWER_NUM
      ;)
      ;GHOST 3 SHOULD DIE, WE MAY CHECK FOR POWER-UPS HERE
      T2_KILL_G3:
      MOV EXISTS_GHOST3, 0
      ;THROW GHOST1 OUT OF BOUNDARIES TO AVOID BEING HIT WHILE TRANSPARENT
      SUB STARTPOS_Y_GHOST3, 600
   GHOST3_LIVES2:   
   POP DX
   POP CX
   POP BX
   POP AX
   RETN
;}   
CHECK_HIT_BUL2_GHOST3 ENDP
;-----------------------------------------------------------------------------------------
;Detects The collision of The two bullets 
;-----------------------------------------------------------------------------------------
BULLETS_HIT PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
      ;DETECT THE COLLISION BETWEEN BOTH BULLETS
      DETECT_COLLISION BULLET_1_POSITION_X, BULLET_1_POSITION_Y, BULLETSIZE, BULLET_2_POSITION_X,BULLET_2_POSITION_Y,BULLETSIZE, BULLET_1_STATUS
      CMP BULLET_1_STATUS, 0
      JNE NOT_HITTING
      ;MAKE THE OTHER BULLET DISAPPEAR ALSO
      MOV BULLET_2_STATUS, 0
   NOT_HITTING:
   POP DX
   POP CX
   POP BX
   POP AX
   RETN
;}
BULLETS_HIT ENDP
;---------------------------------------------------------------------------------------
;   _____  _    _   ____    _____  _______            _______         _   _  _  __
;  / ____|| |  | | / __ \  / ____||__   __|   ___    |__   __| /\    | \ | || |/ /
; | |  __ | |__| || |  | || (___     | |     ( _ )      | |   /  \   |  \| || ' / 
; | | |_ ||  __  || |  | | \___ \    | |     / _ \/\    | |  / /\ \  | . ` ||  <  
; | |__| || |  | || |__| | ____) |   | |    | (_>  <    | | / ____ \ | |\  || . \ 
;  \_____||_|  |_| \____/ |_____/    |_|     \___/\/    |_|/_/    \_\|_| \_||_|\_\
;---------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------
;CHECK IF GHOST1 HITS TANK 1
;---------------------------------------------------------------------------------------
CHECK_HIT_GHOST1_TANK1 PROC NEAR
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
      DETECT_COLLISION STARTPOS_X_PLAYER1, STARTPOS_Y_PLAYER1, TANKSIZE, STARTPOS_X_GHOST1, STARTPOS_Y_GHOST1, GHOSTSIZE, EXISTS_GHOST1
      ;{IF GHOST1 COLLIDED -> EXISTS = 0
         CMP EXISTS_GHOST1,0
         JNE TANK1_SAFE1
      ;MOVE GHOST1 OUT OF BOUNDARIES TO AVOID COLLIDING WITH BULLETS WHILE BEING TRANSPARENT
         SUB STARTPOS_Y_GHOST1, 600   
      ;REDUCE THE TANK HP, WILL BE SPLIT IN A DIFFERENT PROC NEAR
         SUB TANK_HP_1,1
      ;}   
   TANK1_SAFE1:   
   POP DX
   POP BX
   POP CX
   POP DX
   RETN
CHECK_HIT_GHOST1_TANK1 ENDP

;---------------------------------------------------------------------------------------
;CHECK IF GHOST2 HITS TANK 1
;---------------------------------------------------------------------------------------
CHECK_HIT_GHOST2_TANK1 PROC NEAR
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
      DETECT_COLLISION STARTPOS_X_PLAYER1, STARTPOS_Y_PLAYER1, TANKSIZE, STARTPOS_X_GHOST2, STARTPOS_Y_GHOST2, GHOSTSIZE, EXISTS_GHOST2
      ;{IF GHOST1 COLLIDED -> EXISTS = 0
         CMP EXISTS_GHOST2,0
         JNE TANK1_SAFE2
      ;MOVE GHOST1 OUT OF BOUNDARIES TO AVOID COLLIDING WITH BULLETS WHILE BEING TRANSPARENT
         SUB STARTPOS_Y_GHOST2, 600   
      ;REDUCE THE TANK HP, WILL BE SPLIT IN A DIFFERENT PROC NEAR
         SUB TANK_HP_1,1
      ;}   
   TANK1_SAFE2:   
   POP DX
   POP BX
   POP CX
   POP DX
   RETN
CHECK_HIT_GHOST2_TANK1 ENDP

;---------------------------------------------------------------------------------------
;CHECK IF GHOST3 HITS TANK 1
;---------------------------------------------------------------------------------------
CHECK_HIT_GHOST3_TANK1 PROC NEAR
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
      DETECT_COLLISION STARTPOS_X_PLAYER1, STARTPOS_Y_PLAYER1, TANKSIZE, STARTPOS_X_GHOST3, STARTPOS_Y_GHOST3, GHOSTSIZE, EXISTS_GHOST3
      ;{IF GHOST1 COLLIDED -> EXISTS = 0
         CMP EXISTS_GHOST3,0
         JNE TANK1_SAFE3
      ;MOVE GHOST1 OUT OF BOUNDARIES TO AVOID COLLIDING WITH BULLETS WHILE BEING TRANSPARENT
         SUB STARTPOS_Y_GHOST3, 600   
      ;REDUCE THE TANK HP, WILL BE SPLIT IN A DIFFERENT PROC NEAR
         SUB TANK_HP_1,1
        
      ;}   
   TANK1_SAFE3:   
   POP DX
   POP BX
   POP CX
   POP DX
   RETN
CHECK_HIT_GHOST3_TANK1 ENDP

;---------------------------------------------------------------------------------------
;CHECK IF GHOST1 HITS TANK 2
;---------------------------------------------------------------------------------------
CHECK_HIT_GHOST1_TANK2 PROC NEAR
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
      DETECT_COLLISION STARTPOS_X_PLAYER2, STARTPOS_Y_PLAYER2, TANKSIZE, STARTPOS_X_GHOST1, STARTPOS_Y_GHOST1, GHOSTSIZE, EXISTS_GHOST1
      ;{IF GHOST1 COLLIDED -> EXISTS = 0
         CMP EXISTS_GHOST1,0
         JNE TANK2_SAFE1
      ;MOVE GHOST1 OUT OF BOUNDARIES TO AVOID COLLIDING WITH BULLETS WHILE BEING TRANSPARENT
         SUB STARTPOS_Y_GHOST1, 600   
      ;REDUCE THE TANK HP, WILL BE SPLIT IN A DIFFERENT PROC NEAR
        SUB TANK_HP_2,1

      ;}   
   TANK2_SAFE1:   
   POP DX
   POP BX
   POP CX
   POP DX
   RETN
CHECK_HIT_GHOST1_TANK2 ENDP

;---------------------------------------------------------------------------------------
;CHECK IF GHOST2 HITS TANK 2
;---------------------------------------------------------------------------------------
CHECK_HIT_GHOST2_TANK2 PROC NEAR
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
      DETECT_COLLISION STARTPOS_X_PLAYER2, STARTPOS_Y_PLAYER2, TANKSIZE, STARTPOS_X_GHOST2, STARTPOS_Y_GHOST2, GHOSTSIZE, EXISTS_GHOST2
      ;{IF GHOST1 COLLIDED -> EXISTS = 0
         CMP EXISTS_GHOST2,0
         JNE TANK2_SAFE2
      ;MOVE GHOST1 OUT OF BOUNDARIES TO AVOID COLLIDING WITH BULLETS WHILE BEING TRANSPARENT
         SUB STARTPOS_Y_GHOST2, 600   
      ;REDUCE THE TANK HP, WILL BE SPLIT IN A DIFFERENT PROC NEAR
        SUB TANK_HP_2,1
        
      ;}   
   TANK2_SAFE2:   
   POP DX
   POP BX
   POP CX
   POP DX
   RETN
CHECK_HIT_GHOST2_TANK2 ENDP

;---------------------------------------------------------------------------------------
;CHECK IF GHOST3 HITS TANK 2
;---------------------------------------------------------------------------------------
CHECK_HIT_GHOST3_TANK2 PROC NEAR
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
      DETECT_COLLISION STARTPOS_X_PLAYER2, STARTPOS_Y_PLAYER2, TANKSIZE, STARTPOS_X_GHOST3, STARTPOS_Y_GHOST3, GHOSTSIZE, EXISTS_GHOST3
      ;{IF GHOST1 COLLIDED -> EXISTS = 0
         CMP EXISTS_GHOST3,0
         JNE TANK2_SAFE3
      ;MOVE GHOST1 OUT OF BOUNDARIES TO AVOID COLLIDING WITH BULLETS WHILE BEING TRANSPARENT
         SUB STARTPOS_Y_GHOST3, 600   
      ;REDUCE THE TANK HP, WILL BE SPLIT IN A DIFFERENT PROC NEAR
         SUB TANK_HP_2,1
         
      ;}   
   TANK2_SAFE3:   
   POP DX
   POP BX
   POP CX
   POP DX
   RETN
CHECK_HIT_GHOST3_TANK2 ENDP
;-----------------------------------------------------
;  _    _  ______            _      _______  _    _    
; | |  | ||  ____|    /\    | |    |__   __|| |  | | 
; | |__| || |__      /  \   | |       | |   | |__| |  
; |  __  ||  __|    / /\ \  | |       | |   |  __  |  
; | |  | || |____  / ____ \ | |____   | |   | |  | |  
; |_|  |_||______|/_/    \_\|______|  |_|   |_|  |_|  
;----------------------------------------------------
DRAW_HEALTH_BAR_1 PROC NEAR
;{   
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
  
   MOV CX,TANK_HP_1                   
   MOV HEARTS_1_START_POSITION_X,5

RED_PLAYER1:                                      ;FOR PLAYER1 DRAW THE RED HEARTS FIRST
   ;(
	MOV SI, OFFSET RED_HEART
	DRAW_OBJECT HEARTSIZE , SI ,HEARTS_1_START_POSITION_X, HEARTS_1_START_POSITION_Y
   ADD HEARTS_1_START_POSITION_X,20               ;ADD 20 -HEART WIDTH- TO THE X POSITION
   LOOP RED_PLAYER1
   ;)

   MOV CX,10
   SUB CX,TANK_HP_1
   JZ RETNURN_HEALTH1                             ;IF HP=10 NO WHITE HEARTS SO RETNURN 
	 
WHITE_PLAYER1:                                   ;DRAW WHITE HEARTS IF IT EXISTS
   ;(
	MOV SI, OFFSET WHITE_HEART
	DRAW_OBJECT HEARTSIZE , SI ,HEARTS_1_START_POSITION_X, HEARTS_1_START_POSITION_Y
   ADD HEARTS_1_START_POSITION_X,20
   LOOP WHITE_PLAYER1
   ;)
 
 RETNURN_HEALTH1:
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;}
DRAW_HEALTH_BAR_1 ENDP
;-----------------------------------------------
;DRAW THE HEALTH BAR FOR PLAYER 2
;-----------------------------------------------
DRAW_HEALTH_BAR_2 PROC NEAR
;{   
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
  
   MOV HEARTS_2_START_POSITION_X,430
   MOV CX,10
    SUB CX,TANK_HP_2
    JZ DRAW_RED

WHITE_PLAYER2:                          ;FOR PLAYER2 DRAW THE WHITE HEARTS FIRST
;(
	MOV SI, OFFSET WHITE_HEART
	DRAW_OBJECT HEARTSIZE , SI ,HEARTS_2_START_POSITION_X, HEARTS_2_START_POSITION_Y
   ADD HEARTS_2_START_POSITION_X,20
   LOOP WHITE_PLAYER2 
 ;)

DRAW_RED:
;(
   MOV CX,TANK_HP_2
   RED_PLAYER2:
      ;(
      MOV SI, OFFSET RED_HEART
      DRAW_OBJECT HEARTSIZE , SI ,HEARTS_2_START_POSITION_X, HEARTS_2_START_POSITION_Y
      ADD HEARTS_2_START_POSITION_X,20
      DEC CX
      JNZ RED_PLAYER2  
      ;)
   JZ RETNURN_DATA2
;)
 RETNURN_DATA2:
   POP DX
   POP CX
   POP BX
   POP AX 
   RETN
;}
DRAW_HEALTH_BAR_2 ENDP

;--------------------------------------------
; DRAWS THE POWER-UP BAR OF PLAYER 1 
;--------------------------------------------
DRW_PRUP_BAR_1 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
   ;RE- INITIALIZE THE START POSITON OF THE PWR-UP BAR
   MOV PWRUP_BAR_1_START_POSITION_X, 5
   ;GET THE NUMBER OF TIMES THE PLAYER RECIEVED A BULLET SPEED UP
   MOV CX, BULLET_1_SPEED_POWER_NUM
   CMP CX, 0
   JE NO_SPD_PWRUP_1
   MOV SI , OFFSET SPD_PRUP_1
   ;LOOP TO DRAW THE SPEED POWER UP ICON A NUMBER OF TIMES EQUAL TO THE NUMBER THE PLAYER RECIEVED THE POWER-UP
   SPD_PRUP_LOOP_1:
   ;{
      DRAW_OBJECT PRUP_ICON_SIZE, SI, PWRUP_BAR_1_START_POSITION_X, PWRUP_BAR_1_START_POSITION_Y
      ADD PWRUP_BAR_1_START_POSITION_X, 20
      MOV SI, OFFSET SPD_PRUP_1
   ;}
   LOOP SPD_PRUP_LOOP_1
   NO_SPD_PWRUP_1:

   ;CHECK IF THE PLAYER HAS A DAMAGE POWER-UP
   CMP TANK_DMG_1, 2
   JNE NO_DMG_PWRUP_1
   ;{
      ;DRAW THE DAMAGE POWER-UP ICON
      MOV SI, OFFSET DMG_PRUP_1
      DRAW_OBJECT PRUP_ICON_SIZE, SI, PWRUP_BAR_1_START_POSITION_X, PWRUP_BAR_1_START_POSITION_Y
   ;}   
   NO_DMG_PWRUP_1:
   POP DX
   POP CX
   POP BX
   POP AX
   RETN
;}
DRW_PRUP_BAR_1 ENDP

;--------------------------------------------
; DRAWS THE POWER-UP BAR OF PLAYER 2 
;--------------------------------------------
DRW_PRUP_BAR_2 PROC NEAR
;{
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX
   ;RE- INITIALIZE THE START POSITON OF THE PWR-UP BAR
   MOV PWRUP_BAR_2_START_POSITION_X, 430
   ;GET THE NUMBER OF TIMES THE PLAYER RECIEVED A BULLET SPEED UP
   MOV CX, BULLET_2_SPEED_POWER_NUM
   CMP CX, 0
   JE NO_SPD_PWRUP_2
   MOV SI , OFFSET SPD_PRUP_2
   ;LOOP TO DRAW THE SPEED POWER UP ICON A NUMBER OF TIMES EQUAL TO THE NUMBER THE PLAYER RECIEVED THE POWER-UP
   SPD_PRUP_LOOP_2:
   ;{
      DRAW_OBJECT PRUP_ICON_SIZE, SI, PWRUP_BAR_2_START_POSITION_X, PWRUP_BAR_2_START_POSITION_Y
      ADD PWRUP_BAR_2_START_POSITION_X, 20
      MOV SI, OFFSET SPD_PRUP_2
   ;}
   LOOP SPD_PRUP_LOOP_2
   NO_SPD_PWRUP_2:

   ;CHECK IF THE PLAYER HAS A DAMAGE POWER-UP
   CMP TANK_DMG_2, 2
   JNE NO_DMG_PWRUP_2
   ;{
      ;DRAW THE DAMAGE POWER-UP ICON
      MOV SI, OFFSET DMG_PRUP_2
      DRAW_OBJECT PRUP_ICON_SIZE, SI, PWRUP_BAR_2_START_POSITION_X, PWRUP_BAR_2_START_POSITION_Y
   ;}   
   NO_DMG_PWRUP_2:
   POP DX
   POP CX
   POP BX
   POP AX
   RETN
;}
DRW_PRUP_BAR_2 ENDP

;---------------------------
; LOSER 
;---------------------------
PLAYER_LOST PROC NEAR 

 MOV    AX, 4F02H     ; THIS TO HANDLE FLICKERING WE REOPEN THE VIDEO MODE EVERYTIME 
 MOV    BX, 100H
 INT    10H

YWN 40,40,150,220,04                ;DRAW YOU WON WITH RED COLOR  
CMP WINNER,1 
JNZ PLAYER2_WON
;(               
   ADD PLAYER1_SCORE, 100
   MOV SI,OFFSET BITMAP_UP_PLAYER1
   DRAW_OBJECT TANKSIZE ,SI,280,100    ;DRAW TANK 1 IF PLAYER 1 IS THE WINNER
    JMP PRESS_TO_MENU
;)
PLAYER2_WON:
;(
   ADD PLAYER2_SCORE, 100
   YWN 40,40,150,220,01              ;DRAW YOU WON WITH BLUE COLOR -OVEERWRITE THE RED ONE- 
   MOV SI,OFFSET BITMAP_UP_PLAYER2
   DRAW_OBJECT TANKSIZE ,SI,280,100 
;)
 PRESS_TO_MENU: 

      CALL SOUND 
      DISPLAY_RESULT 
      CALL CLEARKEYBOARDBUFFER
      RETN
    
PLAYER_LOST ENDP
;--------------------------------------------------------------------------------------
;   _____  _   _  _______  ______  _____    ______            _____  ______
;  |_   _|| \ | ||__   __||  ____||  __ \  |  ____|   /\     / ____||  ____|
;    | |  |  \| |   | |   | |__   | |__) | | |__     /  \    | |     | |__ 
;    | |  | . ` |   | |   |  __|  |  _  /  |  __|   / /\ \   | |     |  __|
;   _| |_ | |\  |   | |   | |____ | | \ \  | |     / ____ \  | |____ | |____ 
;  |_____||_| \_|   |_|   |______||_|  \_\ |_|    /_/    \_\  \_____||______|
;------------------------------------------------------------------------------------
  MAIN_MENU PROC NEAR
   ;{ OPEN VIDEO MODE
         MOV    AX, 4F02H 
         MOV    BX, 105H      
         INT    10H   
   ;}

   
   ;{DRAWWING THE INTERFACE
         MENU
         GHOSTWORD
         BUSTERWORD
   ;}

   ;{DRAWING THE LOGO
         MOV SI , OFFSET LOGO
         DRAW_OBJECT LOGOSIZE, SI, LOGO_X, LOGO_Y
   ;}

   

   MENUEE:
   ;{ IF(USER PRESS ANY KEY)
         MOV    AH, 1
         INT    16H
         JZ    MENUEE
   ;}

   ;{TAKE INPUT AND CLEAR KEYBOARD BUFFER
         MOV     AH, 0
         INT     16H 
         CALL    CLEARKEYBOARDBUFFER  
   ;}
   
   ;{ IF(USER PRESS ECS)
         CMP     AL,1BH
         JNZ     F1LABEL
            ;{ THIS TO HANDLE FLICKERING
                  MOV    AX, 4F02H 
                  MOV    BX, 100H
                  INT    10H
            ;}
         MOV    AH,4CH
         INT    21H
   ;}

   F1LABEL:
   ;{ IF(USER PRESS F1)
   ;     CMP    AH,3BH
         JMP    F2LABEL
   ;}
   F2LABEL:
   ;{ IF(USER PRESS F2)
         CMP    AH,3CH
         JNZ    MENUEE
         
   ;}
   CALL RESET_DATA
   CALL GAME_LOOP
   RETN
   MAIN_MENU ENDP
    ;-----------------------------------------------------------
   ;Reset data 
   ;------------------------------------------
   RESET_DATA PROC NEAR
;{
    
      MOV UPPERBOUND_Y, 55
      MOV LOWERBOUND_Y, 360

      MOV STARTPOS_X_PLAYER1,50
      MOV STARTPOS_Y_PLAYER1,150
      MOV TANK_HP_1,10
      MOV TANK_SPEED_1,3
      MOV TANK_DMG_1,1
      MOV ORIENTATION_PLAYER1,2

      MOV STARTPOS_X_PLAYER2,550
      MOV STARTPOS_Y_PLAYER2 ,150
      MOV TANK_HP_2 ,10
      MOV TANK_SPEED_2,3
      MOV TANK_DMG_2 ,1                              
      MOV ORIENTATION_PLAYER2,2 
      MOV BULLET_1_STATUS,0
      MOV BULLET_2_STATUS,0

      MOV BULLET_1_SPEED ,10 
      MOV BULLET_1_SPEED_POWER_NUM , 0
      MOV BULLET_2_SPEED , 10 
      MOV BULLET_2_SPEED_POWER_NUM , 0 

      MOV EXISTS_GHOST1, 0
      MOV EXISTS_GHOST2, 0
      MOV EXISTS_GHOST3, 0

      MOV PLAYER1_SCORE,0
      MOV PLAYER2_SCORE,0

      MOV TIME , 120    
   
      ;{PUT INITIAL VAULE FOR THE SEED
      MOV   AH, 0
      INT   1AH
      MOV   RANDSEED, DX    ; SEED WITH THE SYSTEM TIME
      ;}

      MOV    AH, 2CH  ;GET SYSTEM TIME
      INT    21H
      MOV    PREV_SYS_SECOND, DH  ;STORE THE CURRENT SECOND OF THE SYSTEM      
      
      RETN
;}
   RESET_DATA ENDP
;------------------------------


  
END MAIN 




