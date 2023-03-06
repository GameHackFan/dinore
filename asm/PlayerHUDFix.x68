*----------------------------------------------------------------------------------------------
* Title:        DINORE Player HUD Fix
* Written by:   GameHackFan
* Date:         
* Description:  This module fixes the bugs in the HUD caused
*               by the new features.
*----------------------------------------------------------------------------------------------

; ORG         $180900

                                        ; Block of code that prints part of the HUD.
  TST.B       ($786, A5)                ; Compares 0 and ($786 + A5), the stage area ID.
  BEQ         $180936                   ; If it is 0, don't fix the HUD, not necessary.
  MOVE.L      D5, D6                    ; Stores D5 inside D6, D5 will be replaced.
  JSR         $1631A                    ; Calls the routine that loads the HUD address.
  JSR         $16396                    ; Calls the routine that prints the HUD character image.
  ADDQ.W      #$4, A0                   ; Adds 4 to A0, to go to the character name screen region.
  JSR         $163F4                    ; Calls the routine that prints the HUD character name.
  MOVE.L      D6, D5                    ; Stores D6 inside D5, restore D5 value.

                                        ; Block of code that fixes the player HUD.
  MOVE.B      ($3, A6), D0              ; Stores ($3 + A6) inside D0, the player character ID.
  ADDQ.B      #$1, D0                   ; Adds 1 to D0, Jack 1, Mustapha 2, Hannah 3, Mess 4.
  AND.W       #$2, D0                   ; D0 and 2, Jack 0, Mustapha 2, Hannah 2, Mess 0.
  TST.B       D0                        ; Compares 0 and D0, only Jack and Mess bugs the HUD.
  BNE         $180936                   ; If it is not 0, go to the RTS line.
  MOVE.W      #$20, D0                  ; Stores 20 inside D0, the empty character.
  MOVE.W      D0, (A0)                  ; Stores D0 inside (A0), fix the bugged HUD.
  MOVE.W      D0, ($80, A0)             ; Stores D0 inside ($80 + A0), fix the bugged HUD.
  RTS                                   ; Returns back to the caller of this routine.



; This module has a routine that fixes the player HUD.
; The extra features like the player character randomizer
; might cause bugs in the player HUD, so this fix is needed.
;
; 180900:   Fix Player HUD (Current Player)