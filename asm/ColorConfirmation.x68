*----------------------------------------------------------------------------------------------
* Title:        DINORE Color Confirmation
* Written by:   GameHackFan
* Date:         
* Description:  It ensures players can't pick the same color.
*----------------------------------------------------------------------------------------------

; ORG         $180500

                                        ; Block of code that fixes the color conflict.
  CLR.W       D6                        ; Clears D6, will be used as conflict mask.                                        
  MOVE.W      #$3274, D0                ; Stores 3274 inside D0, player 1 memory offset.
  BSR         $180598                   ; Calls color conflict mask routine.
  MOVE.W      #$33F4, D0                ; Stores 33F4 inside D0, player 2 memory offset.
  BSR         $180598                   ; Calls color conflict mask routine.
  MOVE.W      #$3574, D0                ; Stores 3574 inside D0, player 3 memory offset.
  BSR         $180598                   ; Calls color conflict mask routine.
  BSR         $1805CC                   ; Calls color conflict fix routine.
  RTS                                   ; Returns back to the routine that called this code.

                                        ; Block of code that updates the color conflict mask.
  TST.B       (A5, D0.W)                ; Compares 0 and (A5 + D0.W), the other player active flag.
  BEQ         $1805CA                   ; If it is 0, go to the last line. 
  MOVE.W      A6, D1                    ; Stores A6 inside D1, current player address.
  SUB.W       #$8000, D1                ; Subtracts 8000 from D1.
  CMP.W       D0, D1                    ; Compares D0 and D1, both players address.
  BEQ         $1805CA                   ; If they are the same, go to the last line.
  MOVE.B      ($3, A5, D0.W), D1        ; Stores ($3 + A5 + D0.W) inside D1, the other player character id.
  CMP.B       ($3, A6), D1              ; Compares ($3 + A6) and D1, both players character ID.
  BNE         $1805CA                   ; If they are not equal, go to the last line.
  ADD.W       A5, D0                    ; Adds A5 to D0, current player memory region.
  SUB.W       #$B274, D0                ; Subtracts B274 from D0, P1 memory address.
  LSR.W       #8, D0                    ; Shifts right D0 bits by 8, the pallete ID.
  ADDQ.W      #1, D0                    ; Adds 1 to D0, P1 is 1, P2 is 2, P3 is 4.
  LSR.W       #1, D0                    ; Shifts right D0 bits by 1, 1 is 0, 2 is 1, 4 is 2.
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it because the color is 2 bytes.
  ADD.W       #$7F00, D0                ; Adds 7F00 to D0, the color selected offset.
  MOVE.W      (A5, D0.W), D0            ; Stores (A5 + D0.W) inside D0, the other player color ID.
  BSET        D0, D6                    ; Sets the D0 bit from D6 to 1, the other player color to the conflict mask.
  RTS                                   ; Returns back to the routine that called this code.

                                        ; Block of code that fixes the color conflict
  MOVE.W      ($17C, A6), D0            ; Stores ($17C + A6) inside D0, the current player ID.
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it because the color is 2 bytes.
  ADD.W       #$7F00, D0                ; Adds 7F00 to D0, the color selected offset.
  MOVE.W      (A5, D0.W), D1            ; Stores (A5 + D0.W) inside D1, the player color ID.
  BTST        D1, D6                    ; Test the D1 bit from D6, if the color is in use.
  BEQ         $1805E6                   ; If the bit is 0, color is not in use, ignore the 3 lines below.
  ADDQ.W      #1, D1                    ; Adds 1 to D1, the next color.
  AND.W       #7, D1                    ; D1 and 7, to force a valid color.
  BRA         $1805DA                   ; Jumps back to the BTST line.
  MOVE.W      D1, (A5, D0.W)            ; Stores D1 inside (A5 + D0.W), the player color ID fixed.
  RTS                                   ; Returns back to the routine that called this code.



; This module provides routines that solves 
; color conflicts that might happen if 2 or 3 
; players select the same color. It will change 
; to the next color in case of color conflict.
;
; 180500:   Color Conflict Fix (Current Player)