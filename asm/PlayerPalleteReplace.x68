*----------------------------------------------------------------------------------------------
* Title:        DINORE Player Pallete Replace
* Written by:   GameHackFan
* Date:         
* Description:  It sets the pallete ID with the color selected by the player.
*               P1 is pallete 03, P2 is pallete 01, P3 is pallete 00.
*----------------------------------------------------------------------------------------------

; ORG         $180800

                                        ; Block that calculates the character pallete offset.
  CLR         D0                        ; Clears D0.
  LEA         $1A0000, A0               ; Stores 1A0000 to A0, Jack first pallete.
  MOVE.B      ($3, A6), D0              ; Stores ($3 + A6) inside D0, the character ID.
  LSL.W       #8, D0                    ; Shifts left D0 bits by 8, 0 is 0, 1 is 100, 2 is 200, 3 is 300.
  ADD.W       D0, A0                    ; Adds D0 to A0, the character pallete offset.

                                        ; Block that calculates the pallete ID offset.
  CLR         D0                        ; Clears D0.
  MOVE.B      ($2, A6), D0              ; Stores ($2 + A6) inside D0, pallete ID.  
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it.
  ADD.W       #$7F00, D0                ; Adds 7F00 to D0, offset of the color selected region.
  MOVE.W      (A5, D0.W), D0            ; Stores (A5 + D0.W) inside D0, the color selected.
  LSL.W       #5, D0                    ; Shifts left D0 bits by 5, 0 is 0, 1 is 20, 2 is 40.
  ADD.W       D0, A0                    ; Adds D0 to A0, the pallete ID offset.

                                        ; Block that calculates the player pallete ID offset.
  CLR         D0                        ; Clears D0.
  LEA         $914000, A3               ; Stores 914000 to A3, first pallete region.
  MOVE.W      (A3), D7                  ; Stores (A3) inside D7. the first color.
  AND.W       #$F000, D7                ; D7 and F000, grabs the current brightness.
  MOVE.B      ($2, A6), D0              ; Stores ($2 + A6) inside D0, the player ID.
  LSL.W       #5, D0                    ; Shifts left D0 bits by 5, 0 is 0, 1 is 20, 2 is 40, 3 is 60, etc.
  ADD.W       D0, A3                    ; Adds D0 to A3, the player pallete ID region offset.

                                        ; Block of code that sets the pallete
  MOVE.W      #$F, D1                   ; Stores F inside D1, the amount of iteration (executes F + 1).
  MOVE.W      (A0)+, D0                 ; Stores (A0) inside D0 and incremente A0, the color.
  OR.W        D7, D0                    ; D0 or D7, adds the current brightness to the color.
  MOVE.W      D0, (A3)+                 ; Stores D0 inside (A3) and increment A3, set the color.
  DBRA        D1, $18083E               ; If D1 is bigger than 0, go back to the 2nd line of this block.
  RTS                                   ; Returns back to the caller of this routine.



; ORG         $180860


                                        ; Block of code that sets P1 pallete.
  BSR         $181A30                   ; Calls the routine that saves some registers values.
  MOVE.W      #$0, D0                   ; Stores 0 inside D0, P1 pallete offset.
  MOVE.W      #$7F00, D6                ; Stores 7F00 inside D6, P1 selected color offset.
  MOVE.W      #$3274, D1                ; Stores 3274 inside D1, P1 memory region.
  BSR         $180894                   ; Calls the routine that replaces P1 pallete.
  
                                        ; Block of code that sets P2 pallete.
  MOVE.W      #$20, D0                  ; Stores 20 inside D0, P2 pallete offset.
  MOVE.W      #$7F02, D6                ; Stores 7F02 inside D6, P2 selected color offset.
  MOVE.W      #$33F4, D1                ; Stores 33F4 inside D1, P2 memory region.
  BSR         $180894                   ; Calls the routine that replaces P2 pallete.

                                        ; Block of code that sets P3 pallete.
  MOVE.W      #$40, D0                  ; Stores 40 inside D0, P3 pallete offset.
  MOVE.W      #$7F04, D6                ; Stores 7F04 inside D6, P3 selected color offset.
  MOVE.W      #$3574, D1                ; Stores 3574 inside D1, P3 memory region.
  BSR         $180894                   ; Calls the routine that replaces P3 pallete.
  BSR         $181A60                   ; Calls the routine that retore some registers values.
  RTS                                   ; Returns back to the caller of this routine.

                                        ; Block of code that sets the player pallete in the pallete region.
  TST.B       (A5, D1.W)                ; Compares 0 and (A5 + D1.W), the player active flag.
  BEQ         $1808CC                   ; If it is 0, player is not active, go to the RTS line.
  LEA         $1A0000, A6               ; Stores 1A0000 to A6, main characters pallete offset.
  MOVE.W      (A5, D6.W), D6            ; Stores (A5 + D6.W) inside D6, player color ID.
  LSL.W       #5, D6                    ; Shifts left D6 bits by 5, 0 is 0, 1 is 20, 2 is 40.
  ADD.W       D6, A6                    ; Adds D6 to A6, the color offset.
  MOVE.W      ($2, A5, D1.W), D1        ; Stores (2 + A5 + D1.W) inside D1, player character ID.
  LSL.W       #8, D1                    ; Shifts right D1 bits by 8, 0 is 0, 1 is 100, 2 is 200, 3 is 300.
  ADD.W       D1, A6                    ; Adds D1 to A6, the character offset.
  LEA         $914000, A1               ; Stores 914000 inside A1, pallete region.
  MOVE.W      (A1), D6                  ; Stores (A1) inside D6, the first color.
  AND.W       #$F000, D6                ; D6 and F000, grabs the current brightness.
  ADD.W       D0, A1                    ; Adds D0 to A1, the player pallete offset.
  MOVE.W      #$F, D1                   ; Stores F inside D1, the amount of iteration (executes F + 1).
  MOVE.W      (A6)+, D0                 ; Stores (A6) inside D0 and incremente A6, the color.
  OR.W        D6, D0                    ; D6 or D0, adds the current brightness to the color.
  MOVE.W      D0, (A1)+                 ; Stores D0 inside (A1) and increment A1, sets the color.
  DBRA        D1, $1808C2               ; If D1 is bigger than 0, go back 3 lines above.
  RTS                                   ; Returns back to the caller of this routine. 



; This module provides routines that handle replacing the 
; colors of the palletes that will be used by the players
; with the colors of the pallete they selected.
; 
; $180800:    Replace Pallete (Current Player)
; $180860:    Replace Pallete (All Players)