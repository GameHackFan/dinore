*----------------------------------------------------------------------------------------------
* Title:        DINORE Idle Screen Pallete Fix
* Written by:   GameHackFan
* Date:         
* Description:  Forces default palletes on profile screen, score screen and ending.
*----------------------------------------------------------------------------------------------

; ORG         $180A00

                                        ; Block of code that saves values for safety.
  BSR         $181A30                   ; Calls the routine that saves some registers values.

                                        ; Block of code that sets Jack's default pallete.
  LEA         $1A0000, A0               ; Stores 1A0000 inside A0, Jack's first pallete address.
  LEA         $914000, A1               ; Stores 914000 inside A1, Jack's default pallete address.
  BSR         $180A42                   ; Calls the routine that sets the colors.

                                        ; Block of code that sets Hannah's default pallete.
  LEA         $1A0200, A0               ; Stores 1A0200 inside A0, Hannah's first pallete address.
  LEA         $914020, A1               ; Stores 914020 inside A1, Hannah's default pallete address.
  BSR         $180A42                   ; Calls the routine that sets the colors.

                                        ; Block of code that sets Mustapha's default pallete.
  LEA         $1A0100, A0               ; Stores 1A0100 inside A0, Mustapha's first pallete address.
  LEA         $914040, A1               ; Stores 914040 inside A1, Mustapha's default pallete address.
  BSR         $180A42                   ; Calls the routine that sets the colors.

                                        ; Block of code that sets Mess' default pallete.
  LEA         $1A0300, A0               ; Stores 1A0300 inside A0, Mess' first pallete address.
  LEA         $914060, A1               ; Stores 914060 inside A1, Mess' default pallete address.
  BSR         $180A42                   ; Calls the routine that sets the colors.

                                        ; Block of code that restores the values.
  BSR         $181A60                   ; Calls the routine that retore some registers values.
  RTS                                   ; Returns back to the caller of this routine.

                                        ; Block of code that sets the pallete.
  MOVE.W      #$F, D0                   ; Stores F inside D0, the amount of iteration (executes F + 1).
  MOVE.W      (A0)+, D1                 ; Stores (A0) inside D1 and increment A0, the color.
  OR.W        #$F000, D1                ; D1 or F000, adds maximum brightness.
  MOVE.W      D1, (A1)+                 ; Stores D1 inside (A1) and increment A1, sets the color.
  DBRA        D0, $180A46               ; Loops back to the code that sets the color, 2nd line of this block.
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
  BSR         $1805B0                   ; Calls the routine clears the custom color flags.
  BSR         $180A80                   ; Calls the routine clears all players active flag.
  BSR         $180A00                   ; Calls the routine that sets the default palletes of the main characters.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $180AD0.L                 ; Replace 1E6E2.
  NOP
  NOP

; ORG         $180AD0                   
                                        ; Block of code that fixes the palletes on Ending 1st Scene.
  BSR         $1805B0                   ; Calls the routine that clears the custom color flags.
  BSR         $180A00                   ; Calls the routine that sets the default palletes of the main characters.
  MOVE.W      ($4E0, A5), A0            ; Code from the original game that was replaced to jump to this code.
  TST.B       ($A6, A0)                 ; Code from the original game that was replaced to jump to this code.
  BEQ         $180AE8                   ; Code from the original game readjusted.
  JMP         $1E6EC                    ; Jumps back to where it stopped in the original code.
  JMP         $1E6F4                    ; Code from the original game readjusted.



; This module fix Jack, Hannah, Mustapha and Mess palletes 
; when the game is in the profile screen, score screen and 
; both ending scenes, to make sure no custom color is being 
; used.
;
; $180A00:    Set Main Characters Palletes to Default
; $180A80:    Clears All Players Active Flag
; $180AA0:    Set Main Characters Palletes to Default Caller (Score Screen, 2nd Ending Scene, Profile Screen)
; $180AD0:    Set Main Characters Palletes to Default Caller (1st Ending Scene)