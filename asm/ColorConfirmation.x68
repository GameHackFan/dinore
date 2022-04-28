*----------------------------------------------------------------------------------------------
* Title:        CADE Color Confirmation
* Written by:   GameHackFan
* Date:         
* Description:  It ensures players can't pick the same color.
*----------------------------------------------------------------------------------------------

; Unused, this code might also be broken.

  JMP         $180500.L                 ; Code to jump to the new code that handles the custom pallete ID (replace B204).

; ORG         $180500

                                        ; Block of code that makes all 3 color fix calls.
  MOVE.W      #$638, D0                 ; Stores #$638 inside D0, player 1 memory offset.
  BSR         $180518                   ; Calls color conflict fix routine.
  MOVE.W      #$644, D0                 ; Stores #$644 inside D0, player 2 memory offset.
  BSR         $180518                   ; Calls color conflict fix routine.
  MOVE.W      #$650, D0                 ; Stores #$650 inside D0, player 3 memory offset.
  BSR         $180518                   ; Calls color conflict fix routine.
  JMP         $B20A                     ; Jumps back to where it stopped in the original code.

                                        ; Block of code that fix current player color conflict.
  MOVE.W      A4, D1                    ; Stores A4 inside D1, current player address.
  SUB.W       #$8000, D1                ; Subtracts 8000 from D1.
  CMP.W       D0, D1                    ; Compares D0 and D1, if both player are the same.
  BEQ         $180562                   ; If they are the same, go to the last line.
  CMP.B       #4, ($1, A5, D0.W)        ; Compares 4 and ($1 + A5 + D0.W), the other player character confirmed flag.
  BNE         $180562                   ; If it is not 4, go to the last line.
  MOVE.W      ($2, A5, D0.W), D1        ; Stores ($2 + A5 + D0.W) inside D1, the other player character.
  CMP.W       ($2, A4), D1              ; Compares ($2 + A4) and D1, both players character.
  BNE         $180562                   ; If they are not equal, go to the last line.
  CLR.W       D1                        ; Clears D1
  MOVE.B      (A4), D1                  ; Stores (A4) to D1, the current player id.
  ADD.B       D1, D1                    ; Adds D1 to D1, doubles it because the color is 2 bytes.
  ADD.W       #$7F00, D1                ; Adds 7F00 to D1, the color selected offset.
  MOVE.W      (A5, D1.W), D3            ; Stores (A5 + D1.W) inside D3, current player color id.
  MOVE.B      (A5, D0.W), D0            ; Stores (A5 + D0.W) inside D0, the other player id.
  AND.W       #$FF, D0                  ; D0 and FF, ensures it is 1 byte only.
  ADD.B       D0, D0                    ; Adds D0 to D0, doubles it because the color is 2 bytes.
  ADD.W       #$7F00, D0                ; Adds 7F00 to D0, the color selected offset.
  MOVE.W      (A5, D0.W), D0            ; Stores (A5 + D0.W) inside D0, other player color id.
  CMP.W       D3, D0                    ; Compares D3 and D0, the color of both players.
  BNE         $180562                   ; If they are not equal, go to the last line.
  ADDQ.W      #1, D3                    ; Adds 1 to D3, to make sure it is not equal the other color.
  AND.W       #7, D3                    ; D3 and 7, ensures it is a valid color.
  MOVE.W      D3, (A5, D1.W)            ; Stores D3 inside (A5 + D1.W), the player color id fixed.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $180580

                                        ; Block of code that makes all 6 color fix calls.
  MOVE.W      #$3274, D0                ; Stores 3274 inside D0, player 1 memory offset.
  BSR         $1805A6                   ; Calls color conflict fix routine.
  MOVE.W      #$33F4, D0                ; Stores 33F4 inside D0, player 2 memory offset.
  BSR         $1805A6                   ; Calls color conflict fix routine.
  MOVE.W      #$3574, D0                ; Stores 3574 inside D0, player 3 memory offset.
  BSR         $1805A6                   ; Calls color conflict fix routine.
  MOVE.W      #$3274, D0                ; Stores 3274 inside D0, player 1 memory offset.
  BSR         $1805A6                   ; Calls color conflict fix routine.
  MOVE.W      #$33F4, D0                ; Stores 33F4 inside D0, player 2 memory offset.
  BSR         $1805A6                   ; Calls color conflict fix routine.
  MOVE.W      #$3574, D0                ; Stores 3574 inside D0, player 3 memory offset.
  BSR         $1805A6                   ; Calls color conflict fix routine.
  RTS                                   ; Returns back to the routine that called this code.

                                        ; Block of code that fix current player color conflict.
  MOVE.W      A6, D1                    ; Stores A6 inside D1, current player address.
  SUB.W       #$8000, D1                ; Subtracts 8000 from D1.
  CMP.W       D0, D1                    ; Compares D0 and D1, if both player are the same.
  BEQ         $1805EE                   ; If they are the same, go to the last line.
  TST.B       (A5, D0.W)                ; Compares 0 and (A5 + D0.W), the other player active flag.
  BEQ         $1805EE                   ; If it is 0, go to the last line.
  MOVE.B      ($3, A5, D0.W), D1        ; Stores ($3 + A5 + D0.W) inside D1, the other player character.
  CMP.B       ($3, A6), D1              ; Compares ($3 + A6) and D1, both players character.
  BNE         $1805EE                   ; If they are not equal, go to the last line.
  MOVE.W      ($17C, A6), D1            ; Stores ($17C + A6) inside D1, the current player id.
  ADD.W       D1, D1                    ; Adds D1 to D1, doubles it because the color is 2 bytes.
  ADD.W       #$7F00, D1                ; Adds 7F00 to D1, the color selected offset.
  MOVE.W      (A5, D1.W), D6            ; Stores (A5 + D1.W) inside D6, current player color id.
  ADD.W       #$17C, D0                 ; Adds 17C to D0, the player id offset.
  MOVE.W      (A5, D0.W), D0            ; Stores (A5 + D0.W) inside D0, the other player id.
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it because the color is 2 bytes.
  ADD.W       #$7F00, D0                ; Adds 7F00 to D0, the color selected offset.
  MOVE.W      (A5, D0.W), D0            ; Stores (A5 + D0.W) inside D0, the other player color id.
  CMP.W       D6, D0                    ; Compares D6 and D0, the color of both players.
  BNE         $1805EE                   ; If they are not equal, go to the last line.
  ADDQ.W      #1, D6                    ; Adds 1 to D6, to make sure it is not equal the other color.
  AND.W       #7, D6                    ; D6 and 7, ensures it is a valid color.
  MOVE.W      D6, (A5, D1.W)            ; Stores D6 inside (A5 + D1.W), the player color id fixed.
  RTS                                   ; Returns back to the routine that called this code.



; This module provides routines that solves  
; color conflicts that might happen if 2 or 3
; players select the same color. It will change 
; to the next color in case of color conflict.