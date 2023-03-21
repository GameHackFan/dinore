*----------------------------------------------------------------------------------------------
* Title:        DINORE Feature Manager
* Written by:   GameHackFan
* Date:         
* Description:  Calls all the routines necessary to ensure 
*               the new features works properly.
*----------------------------------------------------------------------------------------------

  JMP         $180100.L                 ; Replace B274.
  NOP

; ORG         $180100

                                        ; Block of code that handles color select for select screen.
  BSR         $180300                   ; Calls the routine that reads the player input.
  BSR         $180400                   ; Calls the routine that prints the color label.
  JSR         $B2A0                     ; Code from the original game that was replaced to jump to this code.
  JSR         $B36A                     ; Code from the original game that was replaced to jump to this code.
  JMP         $B27C                     ; Jumps back to where it stopped in the original code.



  JMP         $180130.L                 ; Replace 7174.
  NOP
  NOP
  NOP
  NOP
  NOP

; ORG         $180130

                                        ; Block of code that handles color select mid game.
  BSR         $180360                   ; Calls the routine that reads the player input.
  BSR         $180440                   ; Calls the routine that prints the character label.
  MOVE.B      #$10, D0                  ; Code from the original game that was replaced to jump to this code.
  TST.B       ($4CF, A5)                ; Code from the original game that was replaced to jump to this code.
  BEQ         $180146                   ; Code from the original game readjusted.
  MOVE.B      #$5, D0                   ; Code from the original game that was replaced to jump to this code.
  JMP         $7184                     ; Jumps back to where it stopped in the original code.



  JMP         $180160.L                 ; Replace 8A4E.
  NOP

; ORG         $180160

                                        ; Block of code that replaces all palletes and randomizes characters.
  JSR         $8A8E                     ; Code from the original game readjusted.
  JSR         $8AAE                     ; Code from the original game readjusted.
  BSR         $1807B0                   ; Calls the routine that randomizes all players characters.
  BSR         $180860                   ; Calls the routine that replaces the pallete of all players.
  JMP         $8A56                     ; Jumps back to where it stopped in the original code.



  JMP         $180190.L                 ; Replace 8942.

; ORG         $180190

                                        ; Block of code that replaces all palletes and randomizes characters.
  BSR         $1807B0                   ; Calls the routine that randomizes all players characters.
  BSR         $180860                   ; Calls the routine that replaces the pallete of all players.
  LEA         $914000, A1               ; Code from the original game readjusted.
  JMP         $8948                     ; Jumps back to where it stopped in the original code.



  JSR         $1801C0.L                 ; Replace 18A94.
  NOP
  NOP

; ORG         $1801C0

                                        ; Block of code that replaces the pallete and randomizes the character.
  BSR         $181A30                   ; Calls the routine that saves some registers values.
  BSR         $180780                   ; Calls the routine that randomizes a character.
  BSR         $180500                   ; Calls color conflict routine.
  BSR         $180800                   ; Calls the routine that replaces the player color.
  BSR         $181B80                   ; Calls the routine that sets the player custom pallete ID.
  BSR         $180900                   ; Calls the routine that fixes the player HUD.
  BSR         $181A60                   ; Calls the routine that retore some registers values.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $1801F0.L                 ; Replace 71DA.

; ORG         $1801F0

                                        ; Block of code that handles character confirmation.
  BSR         $181A30                   ; Calls the routine that saves some registers values.
  BSR         $180700                   ; Calls the routine that sets the character randomizer flag.
  BSR         $180780                   ; Calls the character randomizer routine.
  BSR         $180500                   ; Calls color conflict routine.
  BSR         $180800                   ; Calls the routine that replaces the player color.
  BSR         $181A60                   ; Calls the routine that retore some registers values.
  MOVE.B      #$1, (A6)                 ; Code from the original game readjusted.
  JMP         $71E0                     ; Jumps back to where it stopped in the original code.



  JMP         $180220.L                 ; Replace 16456.
  NOP

; ORG         $180220

                                        ; Block of code that draws the power indicator.
  BSR         $181600                   ; Calls the routine that prints the power indicator.
  JSR         $164E4                    ; Code from the original game readjusted (prints lifebar).
  SUB.W       #$80, A0                  ; Code from the original game that was replaced to jump to this code.
  JMP         $1645E                    ; Jumps back to where it stopped in the original code.



  JMP         $180250.L                 ; Replace ACAA8.

; ORG         $180250

                                        ; Block of code that fixes play mode and converts difficulty
  SWAP        D6                        ; Invert D6 higher and lower bits, lower bits might be used later.
  SWAP        D7                        ; Invert D7 higher and lower bits, lower bits might be used later.
  BSR         $181300                   ; Calls the routine that forces play mode to 3 players 3 chute.
  BSR         $181700                   ; Calls the routine that converts the difficulty.
  CLR.W       D6                        ; Clears D6.
  CLR.W       D7                        ; Clears D7.
  SWAP        D6                        ; Invert D6 higher and lower bits, lower bits might be used later.
  SWAP        D7                        ; Invert D7 higher and lower bits, lower bits might be used later.
  JSR         $ACBDE                    ; Code from the original game readjusted.
  MOVE.B      D0, (A0)+                 ; Code from the original game that was replaced to jump to this code.
  JMP         $ACAAE                    ; Jumps back to where it stopped in the original code.



  JMP         $180290.L                 ; Replace A848C.

; ORG         $180290

                                        ; Block of code that converts difficulty.
  BSR         $181730                   ; Calls the routine that converts the difficulty.
  MOVE.B      (A0)+, (A1)+              ; Code from the original game that was replaced to jump to this code.
  DBRA        D0, $180290               ; Code from the original game readjusted.
  JMP         $A8492                    ; Jumps back to where it stopped in the original code.



; This module has routines that execute several 
; other routines to ensure that the new features
; present in this hack will work as it should.
; 
; $180100:    Handle Color Select (Select Screen)
; $180130:    Handle Color Select (Mid Game)
; $180160:    Handle Pallete Replace (All Players)
; $180190:    Handle Pallete Replace (All Players)
; $1801C0:    Handle Pallete Replace (Current Player)
; $1801F0:    Handle Pallete Replace (Current Player)
; $180220:    Draw Power Indicator Caller (Current Player)
; $180250:    Play Mode Limiter and Custom Difficulty Caller (Game Start)
; $180290:    Convert Custom Difficulty to Original Caller (Service Menu)