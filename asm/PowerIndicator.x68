*----------------------------------------------------------------------------------------------
* Title:        DINORE Power Indicator
* Written by:   GameHackFan
* Date:         
* Description:  Prings the player power in his HUD area.
*----------------------------------------------------------------------------------------------

; ORG         $181600

                                        ; Block of code that draws the power indicator in the player HUD.
  MOVE.W      #$00, D0                  ; Stores 00 inside D0, the sprite pallete.
  MOVE.W      D0, (-$486, A0)           ; Stores D0 inside (-$486 + A0), 1st digit pallete ID region.
  MOVE.W      D0, (-$406, A0)           ; Stores D0 inside (-$406 + A0), 2nd digit pallete ID region.
  MOVE.B      ($0C6, A6), D0            ; Stores ($C6, A6) inside D0, player current power.
  LSR.B       #4, D0                    ; Shifts right D0 bits by 4, each digit is 16 bits, 1st digit.
  MOVE.W      D0, (-$488, A0)           ; Stores D0 inside (-$488 + A0), 1st digit sprite region.
  MOVE.B      ($0C6, A6), D0            ; Stores ($C6, A6) inside D0, player current power.
  AND.B       #$F, D0                   ; D0 and F, each digit is 16 bits, 2nd digit.
  MOVE.W      D0, (-$408, A0)           ; Stores D0 inside (-$408 + A0), 2nd digit sprite region.
  RTS                                   ; Returns back to the routine that called this code.



; This module has a routine that draws the 
; current power of the player in his HUD 
; region. This game has a concept of power, 
; the bigger your power, the stronger you 
; will hit.
; 
; 181600: Draws the power indicator (Current Player)