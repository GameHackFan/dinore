*----------------------------------------------------------------------------------------------
* Title:        CADE Color Select Manager
* Written by:   GameHackFan
* Date:         
* Description:  Calls all the routines necessary so color select works properly.
*----------------------------------------------------------------------------------------------

  JMP         $180100.L                 ; Code to jump to the new code that handles the color selection on title screen (replace B274).
  NOP

; ORG         $180100

                                        ; Block of code that call all necessary routines.
  BSR         $180300                   ; Calls the routine that reads the player input.
  BSR         $180400                   ; Calls the routine that prints the color label.

                                        ; Block of code that executes the replaced code and go back.
  JSR         $B2A0                     ; Code from the original game that was replaced to jump to this code.
  JSR         $B36A                     ; Code from the original game that was replaced to jump to this code.
  JMP         $B27C                     ; Jumps back to where it stopped in the original code.



  JMP         $180130.L                 ; Code to jump to the new code that handles the color selection mid game (replace 7174).
  NOP
  NOP
  NOP
  NOP
  NOP

; ORG         $180130

                                        ; Block of code that call all necessary routines.
  BSR         $180360                   ; Calls the routine that reads the player input.
  BSR         $180440                   ; Calls the routine that prints the character label.

                                        ; Block of code that executes the replaced code and go back.
  MOVE.B      #$10, D0                  ; Code from the original game that was replaced to jump to this code.
  TST.B       ($4CF, A5)                ; Code from the original game that was replaced to jump to this code.
  BEQ         $180146                   ; Code from the original game readjusted.
  MOVE.B      #$5, D0                   ; Code from the original game that was replaced to jump to this code.
  JMP         $7184                     ; Jumps back to where it stopped in the original code.


  JMP         $180160.L                 ; Code to jump to the new code that replaces the pallete of all players (replace 8A4E).
  NOP

; ORG         $180160

                                        ; Block of code that call all necessary routines.
  JSR         $8A8E                     ; Code from the original game readjusted.
  JSR         $8AAE                     ; Code from the original game readjusted.
  BSR         $180630                   ; Calls the routine that clears the car flags.
  BSR         $180860                   ; Calls the routine that replaces the pallete of all players.
  JMP         $8A56                     ; Jumps back to where it stopped in the original code.



  JMP         $180190.L                 ; Code to jump to the new code that replaces the palletes of all players (replace 8942).

; ORG         $180190

                                        ; Block of code that call all necessary routines.
  BSR         $180630                   ; Calls the routine that clears the car flags.
  BSR         $180860                   ; Calls the routine that replaces the pallete of all players.
  LEA         $914000, A1               ; Code from the original game readjusted.
  JMP         $8948                     ; Jumps back to where it stopped in the original code.


  JMP         $1801C0.L                 ; Code to jump to the new code that replaces the pallete of the player (replace 18A98).

; ORG         $1801C0

  BSR         $180600                   ; Calls the routine that sets the color flags.
  BSR         $180800                   ; Calls the routine that replaces the player color.
  MOVE.B      #1, (A6)                  ; Code from the original game readjusted.
  JMP         $18A9E                    ; Jumps back to where it stopped in the original code.


  JMP         $1801F0.L                 ; Code to jump to the new code that replaces the pallete of the player (replace 71DA).

; ORG         $1801F0

  BSR         $180600                   ; Calls the routine that sets the color flags.
  BSR         $180580                   ; Calls color confirmation routine.
  BSR         $180800                   ; Calls the routine that replaces the player color.
  MOVE.B      #$1, (A6)                 ; Code from the original game readjusted.
  JMP         $71E0                     ; Jumps back to where it stopped in the original code.



; This module execute several routines 
; that ensure a proper function of the
; new color select feature.