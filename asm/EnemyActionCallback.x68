*----------------------------------------------------------------------------------------------
* Title:        DINORE Enemy Action Callback
* Written by:   GameHackFan
* Date:         
* Description:  It call routines when things happens to the 
*               enemies, like being knocked down, clinched,
*               etc.
*----------------------------------------------------------------------------------------------
 
  JMP         $180C00.L                 ; Replace 2AFE4.

; ORG         $180C00

                                        ; Block of code that calls extra routines when the enemy is knocked out.
  MOVE.B      #$1A, ($6, A6)            ; Code from the original game that was replaced to jump to this code.
  BSR         $180D00                   ; Calls the code that tries to updated the target.
  BSR         $181400                   ; Calls the code that tries to add invulnerability.
  BSR         $181800                   ; Calls the code that tries to change get up action for Slisaur.
  JMP         $2AFEA                    ; Jumps back to where it stopped in the original code.



  JMP         $180C30.L                 ; Replace 108DE.

; ORG         $180C30

  BSR         $180DE0                   ; Calls the code that tries to updated the targets for Fessenden 2nd form.
  MOVE.B      #$E, ($2E, A3)            ; Code from the original game that was replaced to jump to this code.
  JMP         $108E4                    ; Jumps back to where it stopped in the original code.



; This module has callback routines that is capable 
; of executing other routines when certain things 
; happens to the enemies, like being knocked down, 
; being clinched, etc. Routines that changes the 
; enemy's target, adds invulnerability to the enemies 
; are being called in some of the callbacks available 
; here.
; 
; 180C00:   Enemy Knocked Down Callback (Current Enemy)
; 180C30:   Enemy Being Clinched Callback (Current Enemy)