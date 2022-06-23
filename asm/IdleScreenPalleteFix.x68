*----------------------------------------------------------------------------------------------
* Title:        DINORE Idle Screen Pallete Fix
* Written by:   GameHackFan
* Date:         
* Description:  Forces default palletes on profile screen, score screen and ending.
*----------------------------------------------------------------------------------------------

; ORG         $180A00

                                        ; Block of code that saves values for safety.
  MOVE.L      D0, ($7FE0, A5)           ; Stores D0 inside ($7FE0 + A5), saves it for safety.
  MOVE.L      D1, ($7FE4, A5)           ; Stores D1 inside ($7FE4 + A5), saves it for safety.
  MOVE.L      A0, ($7FE8, A5)           ; Stores A0 inside ($7FE8 + A5), saves it for safety.
  MOVE.L      A1, ($7FEC, A5)           ; Stores A1 inside ($7FEC + A5), saves it for safety.

                                        ; Block of code that sets Jack's default pallete.
  LEA         $1A0000, A0               ; Stores 1A0000 inside A0, Jack's first pallete address.
  LEA         $9142C0, A1               ; Stores 9142C0 inside A1, Razor's default pallete address.
  BSR         $180A5A                   ; Calls the routine that sets the colors.

                                        ; Block of code that sets Hannah's default pallete.
  LEA         $1A0200, A0               ; Stores 1A0200 inside A0, Hannah's first pallete address.
  LEA         $914060, A1               ; Stores 914060 inside A1, Mess' default pallete address.
  BSR         $180A5A                   ; Calls the routine that sets the colors.

                                        ; Block of code that sets Mustapha's default pallete.
  LEA         $1A0100, A0               ; Stores 1A0100 inside A0, Mustapha's first pallete address.
  LEA         $9142A0, A1               ; Stores 9142A0 inside A1, Blade's default pallete address.
  BSR         $180A5A                   ; Calls the routine that sets the colors.

                                        ; Block of code that sets Mess' default pallete.
  LEA         $1A0300, A0               ; Stores 1A0300 inside A0, Mess' first pallete address.
  LEA         $914300, A1               ; Stores 914300 inside A1, Thug's default pallete address.
  BSR         $180A5A                   ; Calls the routine that sets the colors.

                                        ; Block of code that restores the values.
  MOVE.L      ($7FE0, A5), D0           ; Stores ($7FE0 + A5) inside D0, restore the value.
  MOVE.L      ($7FE4, A5), D1           ; Stores ($7FE4 + A5) inside D1, restore the value.
  MOVE.L      ($7FE8, A5), A0           ; Stores ($7FE8 + A5) inside A0, restore the value.
  MOVE.L      ($7FEC, A5), A1           ; Stores ($7FEC + A5) inside A1, restore the value.
  RTS                                   ; Returns back to the caller of this routine.

                                        ; Block of code that sets the pallete.
  MOVE.W      #$F, D0                   ; Stores F inside D0, the amount of iteration (executes F + 1).
  MOVE.W      (A0)+, D1                 ; Stores (A0) inside D1 and increment A0, the color.
  OR.W        #$F000, D1                ; D1 or F000, adds maximum brightness.
  MOVE.W      D1, (A1)+                 ; Stores D1 inside (A1) and increment A1, sets the color.
  DBRA        D0, $180A5E               ; Loops back to the code that sets the color, 2nd line of this block.
  RTS                                   ; Returns back to the caller of this routine.



; ORG         $180A80

                                        ; Block of code that clears all players active flag.
  CLR.W       ($3274, A5)               ; Clears ($3274 + A5), P1 active flag.
  CLR.W       ($33F4, A5)               ; Clears ($33F4 + A5), P2 active flag.
  CLR.W       ($3574, A5)               ; Clears ($3574 + A5), P3 active flag.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $180AA0.L                 ; Replace 151FE, 8AB9A, 9A828.

; ORG         $180AA0
                                        ; Block of code that fixes the palletes on score screen, 2nd ending scene, profile screen.
  JSR         $892C.L                   ; Code from the original game that was replaced to jump to this code.
  BSR         $180630                   ; Calls the routine clears the inside car color flags.
  BSR         $180660                   ; Calls the routine clears the custom color flags.
  BSR         $180A80                   ; Calls the routine clears all players active flag.
  BSR         $180A00                   ; Calls the routine that sets the default palletes of the main characters.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $180AD0.L                 ; Replace 1E6E2.
  NOP
  NOP

; ORG         $180AD0                   
                                        ; Block of code that fixes the palletes on Ending 1st Scene.
  BSR         $180660                   ; Calls the routine that clears the custom color flags.
  BSR         $180A00                   ; Calls the routine that sets the default palletes of the main characters.
  MOVE.W      ($4E0, A5), A0            ; Code from the original game that was replaced to jump to this code.
  TST.B       ($A6, A0)                 ; Code from the original game that was replaced to jump to this code.
  BEQ         $180AE8                   ; Code from the original game readjusted.
  JMP         $1E6EC                    ; Jumps back to where it stopped in the original code.
  JMP         $1E6F4                    ; Code from the original game readjusted.



; This module fix Jack, Hannah, Mustapha and 
; Mess palletes when the game is in the 
; profile screen, score screen and both 
; ending scenes. The pallete mapper codes 
; changes the way these main palletes work, 
; so this fix is needed.
;
; $180A00:    Set Main Characters Palletes to Default
; $180A80:    Clears All Players Active Flag
; $180AA0:    Set Main Characters Palletes to Default Caller (Score Screen, 2nd Ending Scene, Profile Screen)
; $180AD0:    Set Main Characters Palletes to Default Caller (1st Ending Scene)