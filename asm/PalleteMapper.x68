*----------------------------------------------------------------------------------------------
* Title:        CADE Pallete Mapper
* Written by:   GameHackFan
* Date:         
* Description:  Forces Jack, Hannah, Mustapha and Mess to use
*               the player ID as their pallete ID.
*               Forces other sprites that uses pallete 0, 1, 2, 3
*               to use the palletes 16, 3, 15, 18 instead.
*----------------------------------------------------------------------------------------------

; ORG         $180900

                                        ; Block that saves the custom pallete ID. 
  SWAP        D6                        ; Invert D6 higher and lower bits, lower bits are used in a loop.
  TST.W       ($7F10, A5)               ; Compares 0 and ($7F10 + A5), inside car flag.
  BNE         $180920                   ; If it is not 0, go to the last block of code.

  CMP.W       #$EDCB, ($17E, A0)        ; Compares EDCB and ($17E + A0), custom pallete flag.
  BNE         $180918                   ; If it is not EDCB, go to the last 3 lines.
  MOVE.W      ($17C, A0), D6            ; Stores ($17C + A0) inside D6, the pallete ID.
  SWAP        D6                        ; Invert D6 higher and lower bits, lower bits are used in a loop.
  RTS                                   ; Returns back to the routine that called this code.
  MOVE.W      #$FF, D6                  ; Stores FF inside D6, invalid custom pallete ID.
  SWAP        D6                        ; Invert D6 higher and lower bits, lower bits are used in a loop.
  RTS                                   ; Returns back to the routine that called this code.

  CMP.W       #$EDCB, ($FE, A0)         ; Compares EDCB and ($FE + A0), custom pallete flag.
  BNE         $180930                   ; If it is not EDCB, go to the last 3 lines.
  MOVE.W      ($FC, A0), D6             ; Stores ($FC + A0) inside D6, the pallete ID.
  SWAP        D6                        ; Invert D6 higher and lower bits, lower bits are used in a loop.
  RTS                                   ; Returns back to the routine that called this code.
  MOVE.W      #$FF, D6                  ; Stores FF inside D6, invalid custom pallete ID.
  SWAP        D6                        ; Invert D6 higher and lower bits, lower bits are used in a loop.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $180950.L                 ; Code to jump to the new code that forces sets the correct palletes to the sprites (replace 1433E, 14390, 14436, 14488, 1450A, 145C6, 146CA, 14786, 14C2E, 14C90).

; ORG         $180950

                                        ; Block of code that checks if the sprite needs to change its pallete.
  SWAP        D2                        ; Invert D2 higher and lower bits, lower bits is the sprite.
  MOVE.W      D3, D2                    ; Stores D3 inside D2, tiles and pallete.
  AND.W       #$1F, D2                  ; D2 and 1F, last pallete before looping back.
  CMP.W       #$3, D2                   ; Compares 3 and D2, 3 is Mess, the highest custom pallete.
  BHI         $180972                   ; If it is bigger than 3, go to the last block of code.

                                        ; Block that sets the custom pallete to the sprite.
  AND.W       #$FFF0, D3                ; D3 and FFF0, to clean the relevant part of the pallete ID.
  SWAP        D6                        ; Invert D6 higher and lower bits, lower bits are used in a loop.
  TST.B       D6                        ; Compares 0 and D6, the custom pallete ID.
  BLT         $18096C                   ; If it is bigger than 3, go to the last 2 lines.
  ADD.B       D6, D3                    ; Adds D6 to D3, the custom pallete ID to the pallete ID.
  BRA         $180970                   ; Jumps to the last line of this block.
  ADD.B       ($12, PC, D2.W), D3       ; Adds ($18 + PC + D2.W) to D3, the new pallete id.
  SWAP        D6                        ; Invert D6 higher and lower bits, lower bits are used in a loop.

                                        ; Block of code that executes the code replaced and goes back.
  CLR.W       D2                        ; Clears D2.
  SWAP        D2                        ; Invert D2 higher and lower bits.
  MOVEM.W     D0-D3, (A4)               ; Code from the original game that was replaced to jump to this code.
  ADDQ.L      #8, A4                    ; Code from the original game that was replaced to jump to this code.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $1809A0.L                 ; Code to jump to the new code that sets the custom pallete ID (replace 14054).

; ORG         $1809A0

                                        ; Block of code that executes the code replaced, the new code and go back.
  MOVE.L      -(A6), D0                 ; Code from the original game that was replaced to jump to this code.
  MOVE.W      D0, A0                    ; Code from the original game that was replaced to jump to this code.
  MOVE.W      D7, -(A7)                 ; Code from the original game that was replaced to jump to this code.
  BSR         $180900                   ; Calls the block that calculates the pallete id.
  JMP         $1405A                    ; Jumps back to where it stopped in the original code.



  JMP         $1809C0.L                 ; Code to jump to the new code that sets the custom pallete ID (replace 14122).

; ORG         $1809C0

                                        ; Block of code that executes the code replaced, the new code and go back.
  MOVE.W      (A7)+, A0                 ; Code from the original game that was replaced to jump to this code.
  BSR         $180900                   ; Calls the block that calculates the pallete id.
  JMP         $14230                    ; Code from the original game readjusted.



; This module provides routines that handle 
; the pallete that the sprite should use. The 
; palletes 0, 1 and 2 are being used by P1, P2
; and P3, the sprites that uses the palletes 0, 
; 1, 2 and 3 are now being forced to use the 
; palletes 16, 3, 15 and 18. This module also 
; executes several routines to ensure these 
; pallete changes work as intended.