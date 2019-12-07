PUBLIC SOUND

.Model LARGE
DATA1 SEGMENT PARA 'DATA'


Filename DB 'kingsv.wav', 0

Filehandle DW ?

sounddata DB 51529 dup(0)

DATA1 ENDS

.Code
SOUND PROC FAR
    
    ASSUME DS:DATA1
    MOV AX , DATA1
    MOV DS , AX
	
    CALL OpenFile
    CALL ReadData
	
    LEA BX , sounddata ; BL contains index at the current drawn pixel
	
	
; Drawing loop
aLoop:
    mov dx, 22ch
	mov al, 10h
	out dx, al
	
	
	MOV AL,[BX]
	out dx, al
	mov cx, 9433
	delay:
	nop
	loop delay 
	inc BX
    CMP BX , 51529
JNE aloop
    call CloseFile
    
RETF    
SOUND ENDP
   

;------------------------------------------

OpenFile PROC NEAR

    ; Open file

    MOV AH, 3Dh
    MOV AL, 0 ; read only
    LEA DX, Filename
    INT 21h
    
    ; you should check carry flag to make sure it worked correctly
    ; carry = 0 -> successful , file handle -> AX
    ; carry = 1 -> failed , AX -> error code
     
    MOV [Filehandle], AX
    
    RETN

OpenFile ENDP



;-----------------------------------------------


ReadData PROC NEAR

    MOV AH,3Fh
    MOV BX, [Filehandle]
    MOV CX, 51529 ; number of bytes to read
    LEA DX, sounddata
    INT 21h
    RETN
ReadData ENDP 

;------------------------------------------------

CloseFile PROC NEAR
	MOV AH, 3Eh
	MOV BX, [Filehandle]

	INT 21h
	RETN
CloseFile ENDP

    
    
    
    
    end SOUND