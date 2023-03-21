*----------------------------------------------------------------------------------------------
* Title:        DINORE Color Label
* Written by:   GameHackFan
* Date:         
* Description:  It has routines that handle printing the selected color in the screen.
*----------------------------------------------------------------------------------------------

; ORG         $180400

                                        ; Block that prints the color label in the title screen.
  CLR.W       D0                        ; Clears D0.
  MOVE.W      #$8638, D0                ; Stores 8638 inside D0, P1 memory region.
  SUB.W       A4, D0                    ; Subtracts A4 from D0, current player address.
  LSR.W       #2, D0                    ; Shifts right D0 bits by 2, P1 - 0, P2 - bit 1 is 1, P3 - bit 2 is 1.
  AND.W       #3, D0                    ; D0 and 3, P1 is 0, P2 is 1, P3 is 2.
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it, the color is 2 bytes.
  ADD.W       #$7F00, D0                ; Adds 7F00 to D0, offset of the selected color region.
  MOVE.W      (A5, D0.W), D0            ; Stores (A5 + D0.W) inside D0, the selected color.
  ADD.W       #$125, D0                 ; Adds 125 to D0, digit 1 sprite.
  MOVE.W      D0, ($678, A0)            ; Stores D0 inside ($678 + A0), the color label screen region.
  MOVE.W      #$1E, ($67A, A0)          ; Stores 1E inside ($67A + A0), the pallete id of the digit.
  RTS                                   ; Returns back to the caller of this routine



; ORG         $180440

                                        ; Block that prints the color label in the middle of the game.
  CLR.W       D0                        ; Clears D0.
  MOVE.W      #$B274, D0                ; Stores B274 inside D0, P1 memory region.
  SUB.W       A6, D0                    ; Subtracts A6 from D0, current player address.
  LSR.W       #7, D0                    ; Shifts right D0 bits by 7, P1 - 0, P2 - bit 1 is 1, P3 - bit 2 is 1.
  AND.W       #3, D0                    ; D0 and 3, P1 is 0, P2 is 1, P3 is 2.
  MOVE.W      D0, D1                    ; Stores D0 inside D1.
  MULU.W      #$800, D1                 ; Multiplies D1 by 800, label screen region shift.
  SUB.W       #$95C, D1                 ; SUbtracts 95C from D1, shift for P1.
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it, the color is 2 bytes.
  ADD.W       #$7F00, D0                ; Adds 7F00 to D0, offset of the color selected region.
  MOVE.W      (A5, D0.W), D0            ; Stores (A5 + D0.W) inside D0, the selected color.
  ADD.W       #$125, D0                 ; Adds 125 to D0, digit 1 sprite.
  MOVE.W      D0, (A2, D1.W)            ; Stores D0 inside (A2 + D1.W), the color label screen region.
  MOVE.W      #$1E, ($2, A2, D1.W)      ; Stores D0 inside ($2 + A2 + D1.W), the pallete ID.
  RTS                                   ; Returns back to the caller of this routine.



; This module provides routines that display 
; a label that represents the current selected 
; color by the player.
; 
; 180400:   Prints the Color Label (Select Screen)
; 180440:   Prints the Color Label (Mid Game)