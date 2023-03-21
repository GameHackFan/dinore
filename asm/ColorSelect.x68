*----------------------------------------------------------------------------------------------
* Title:        DINORE Color Select
* Written by:   GameHackFan
* Date:         
* Description:  It has routines that handle changing the selected color.
*----------------------------------------------------------------------------------------------

; ORG         $180300

                                        ; Block that calculates the player id.
  CLR.W       D0                        ; Clears D0.
  MOVE.W      #$8638, D0                ; Stores 8638 inside D0, P1 memory region.
  SUB.W       A4, D0                    ; Subtracts A4 from D0, current player address.
  LSR.W       #2, D0                    ; Shifts right D0 bits by 2, P1 - 0, P2 - bit 1 is 1, P3 - bit 2 is 1.
  AND.W       #3, D0                    ; D0 and 3, P1 is 0, P2 is 1, P3 is 2.

                                        ; Block of code that checks if up or down KeyDown is triggered.
  MOVE.W      #$C, D1                   ; Stores C inside D1, 8 is up and 4 is down, C is both.
  AND.B       ($16, A5, D0.W), D1       ; D1 and ($16 + A5 + D0.W), player KeyPress.
  TST.B       D1                        ; Compare 0 to D1.
  BEQ         $180344                   ; If it is 0, button isn't down, go to RTS.
  AND.B       ($1B, A5, D0.W), D1       ; D1 and ($1B + A5 + D0.W), player KeyDown/KeyUp.
  TST.B       D1                        ; Compare 0 to D1.
  BNE         $180344                   ; If it is not 0, button is being hold, go to RTS.

                                        ; Block that changes the selected color.
  MOVE.W      #$C, D1                   ; Stores C inside D1, 8 is up and 4 is down, C is both.
  AND.B       ($16, A5, D0.W), D1       ; D1 and ($16 + A5 + D0.W), player KeyPress.
  LSR.W       #2, D1                    ; Shifts right D1 bits by 2, 8 is now 2, 4 is now 1.
  OR.W        #1, D1                    ; D1 or 1, 2 is now 3, 1 is still 1.
  SUB.W       #2, D1                    ; Subtracts D1 by 2, if 3 then -1, if 1 then 1.
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it.
  ADD.W       #$7F00, D0                ; Adds 7F00 to D0, offset of the color selected region.
  ADD.W       (A5, D0.W), D1            ; Stores (A5 + D0.W) inside D1, the color selected.
  AND.W       #7, D1                    ; D1 and 7, because there are only 8 colors.
  MOVE.W      D1, (A5, D0.W)            ; Stores D1 inside (A5 + D0.W), the color selected.
  RTS                                   ; Returns back to the caller of this routine;



; ORG         $180360

                                        ; Block that calculates the player id.
  CLR.W       D0                        ; Clears D0.
  MOVE.W      #$B274, D0                ; Stores B274 inside D0, P1 memory region.
  SUB.W       A6, D0                    ; Subtracts A6 from D0, current player address.
  LSR.W       #7, D0                    ; Shifts right D0 bits by 7, P1 - 0, P2 - bit 1 is 1, P3 - bit 2 is 1.
  AND.W       #3, D0                    ; D0 and 3, P1 is 0, P2 is 1, P3 is 2.

                                        ; Block of code that checks if up or down KeyDown is triggered.
  MOVE.W      #$C, D1                   ; Stores C inside D1, 8 is up and 4 is down, C is both.
  AND.B       ($16, A5, D0.W), D1       ; D1 and ($16 + A5 + D0.W), player KeyPress.
  TST.B       D1                        ; Compare 0 to D1.
  BEQ         $1803A4                   ; If it is 0, button isn't down, go to RTS.
  AND.B       ($1B, A5, D0.W), D1       ; D1 and ($1B + A5 + D0.W), player KeyDown/KeyUp.
  TST.B       D1                        ; Compare 0 to D1.
  BNE         $1803A4                   ; If it is not 0, button is being hold, go to RTS.

                                        ; Block that changes the selected color.
  MOVE.W      #$C, D1                   ; Stores C inside D1, 8 is up and 4 is down, C is both.
  AND.B       ($16, A5, D0.W), D1       ; D1 and ($16 + A5 + D0.W), player KeyPress.
  LSR.W       #2, D1                    ; Shifts right D1 bits by 2, 8 is now 2, 4 is now 1.
  OR.W        #1, D1                    ; D1 or 1, 2 is now 3, 1 is still 1.
  SUB.W       #2, D1                    ; Subtracts D1 by 2, if 3 then -1, if 1 then 1.
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it.
  ADD.W       #$7F00, D0                ; Adds 7F00 to D0, offset of the color selected region.
  ADD.W       (A5, D0.W), D1            ; Stores (A5 + D0.W) inside D1, the color selected.
  AND.W       #7, D1                    ; D1 and 7, because there are only 8 colors.
  MOVE.W      D1, (A5, D0.W)            ; Stores D1 inside (A5 + D0.W), the color selected.
  RTS                                   ; Returns back to the caller of this routine;



; ORG         $1803C0

                                        ; Block of code saves the player color from D1.
  CLR.W       D0                        ; Clears D0.
  AND.W       #$7, D1                   ; D1 and 7, colors go from 0 to 7.
  MOVE.B      ($2, A6), D0              ; Stores ($2 + A6) inside D0, the current player ID.
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it because the color is 2 bytes.
  ADD.W       #$7F00, D0                ; Adds 7F00 to D0, the color selected offset.
  MOVE.W      D1, (A5, D0.W)            ; Stores D1 inside (A5 + D0.W), the player color ID fixed.
  RTS                                   ; Returns back to the routine that called this code.



; This module provides routines that handle the color select.
; 
; 180300:   Handles Color Select (Select Screen).
; 180360:   Handles Color Select (Mid Game).
; 1803C0:   Saves Color From D1.