*----------------------------------------------------------------------------------------------
* Title:        CADE Enemy Action Callback
* Written by:   GameHackFan
* Date:         
* Description:  It call routines when the enemies are knocked down.
*----------------------------------------------------------------------------------------------
 
  JSR         $180C00.L                 ; Code to jump to the new code that calls extra routines when the enemy is knocked down (replace 02A832, 02ABE4).
  NOP
  NOP

; ORG         $180C00

  JSR         $9796.L                   ; Code from the original game that was replaced to jump to this code.
  ADDQ.B      #2, ($7, A6)              ; Code from the original game that was replaced to jump to this code.
  CMP.B       #6, ($7, A6)              ; Compares 6 and ($7 + A6), 6 happens when the character is down.
  BNE         $180C16                   ; If it is not 6, ignore the line below
  BSR         $180D00                   ; Calls the code that tries to updated the target.
  RTS                                   ; Code from the original game that was replaced to jump to this code.


  JMP         $180C30.L                 ; Code to jump to the new code that calls extra routines when the enemy is on clinch (replace 108DE).

; ORG         $180C30

  BSR         $180DD0                   ; Calls the code that tries to updated the targets for Fessenden 2nd form.
  MOVE.B      #$E, ($2E, A3)            ; Code from the original game that was replaced to jump to this code.
  JMP         $108E4                    ; Jumps back to where it stopped in the original code.



; This module is capable of executing 
; routines when certain things happens
; to the enemies, like being knocked down 
; being clinched. For now, it only executes
; routines that change the target for some
; specific enemies when these actions happen.