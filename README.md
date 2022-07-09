# Cadillacs and Dinosaurs Readjusted
A mod for the Cadillacs and Dinosaurs (World, Arcade).
<br/>
This mod brings some extra features and fixes some bugs present in the original game.
<br/><br/>
You can access the patcher [here](https://gamehackfan.github.io/dinore/).
<br/><br/>

Version v1.1:
- Improved Hannah's 2nd and 5th Color.
- Improved Mess' 5th Color.
- Improved Mustapha's 2nd Color.
- Increased Final Boss time once more, now from 6 minutes to 8 minutes.
- Increased 7th Boss time from 3 minutes and 50 seconds to 8 minutes.
- Removed unused ColorConfirmation code.
- Improved the ColorConfirmation code, it is way more cleaner now.
- Added to the title screen a link to the project on github.
- Improved the enemy update target code, it is cleaner now.
- Coded GameDifficultyImprovement, it increases the difficulty, enemies attack more now.
- Coded PowerIndicator, it has routines to draw the current power of the player in the HUD area.
- Renamed ColorSelectManager to FeatureManager and added the a caller to the power indicator.
- Coded EnemyInvulnerabilityImprovement, see changes A to D.
- Change A: Coded a logic to allow a timer of the enemies to be used as a timer to handle invulnerability, it will turn enemies vulnerable again.
- Change B: Added a table with flags that specify what enemies can be invulnerable.
- Change C: Added a code to allow enemies to be invulnerable if their flag is active (will be called when the enemy is knocked out).
- Change D: Made Butcher, Slice, Morgan, Morgue, Tyrog and Fessenden 1st Form flag active in the table, which allow them to be invulnerable at some point.
- Change E: Adapted a code called by enemies to better support the invulnerability feature.
- Change F: This feature will ensure Butcher, Slice, Morgan, Tyrog and Fessenden 1st Form to be invulnerable when they get knocked down for 60 frames (loop punch them to death is now gone, you have to fight them for real).
- OBS: Didn't Add Slisaur to the list since they are more than 1, that would make them a nightmare and looping them into a combo is one of the few things the players can do now to beat them.
- Updated EnemyActionCallback, improved enemy knock down callback and made it also call the new invulnerability code.
- Changed Morgan get up attack that is executed if the player is near him, he no longer gets up punching you with his gun, he gets up trying to move now (this removes a weakness that allowed the player to go inside him and loop combo him to death).
- Changed Tyrog get up automatic attack that is executed if the player is near him, he no longer gets up slapping, he gets up trying to move (this removes a weakness that allowed the player to go inside him and loop combo him to death).
- Changed Slisaur get up action, now if he gets knocked out of screen, he will get up straight to his aggressive action (that makes beating them on corner even harder, Mustapha with his 
big range was having a reasonable chance to beat slisaur slash attack, even if he is the target, now it is way more risky).
- Fixed Punch + Jump Attack damage taken doing more damage than it should in case an object was hit.
- Punch + Jump Attack no longer makes enemies dizzy, since this attack now does very little damage to the player (for some reason, in the original game, only Hannah, Mustapha and Mess Punch + Jump Attack make enemies dizzy, but for Jack it is like any attack that causes a knock down, being random if the enemy is going to become dizzy or not, taking in consideration that the dizzy feature in the original game also has a protection, if the enemy is knocked down, when he wakes up he has a 1 second tolerance that doesn't let him be dizzy by any attack, even the Punch + Jump Attack).

See all changes made [here](https://github.com/GameHackFan/dinore/blob/main/changelog).
<br/><br/>

Known Bugs:
- Sometimes when an enemy dies, he keeps rotating forever in the air and might softlock the game (bug present in the original game).
- If you hit butcher and your partner at the same time, all players become immortal (bug present in the original game).
- Sometimes the game throws an exception and it crashes, I saw that happen only on 4th stage, have no clue how it happens and why, it might also happen on other stages (bug present in the original game).
- Players can grab enemies from far away and sometimes even when they are in the air (bug present in the original game).
- 2nd Form of Final Boss can be double or triple comboed by players, he dies without even moving (bug present in the original game).
- If you get an extra life in the score count screen at the end of a stage, you character doesn't cheer for defeating the boss and also stop moving, but it goes back to normal as soon as the next stage loads (bug present in the original game).
- Tyrog puke for some reason is not grabbing pallete 3, it is grabbing pallete 1 / P2 instead (Readjusted version bug).
- On 3rd Stage, sometimes the pallete of the CPU driver bugs (Readjusted version bug).
- Gameplay demo is grabbing the new colors instead of the originals (Readjusted version bug).
<br/><br/>



WHAT'S NEXT: There isn't much left to do for this hack, maybe adjust some of the changes made. Forcing the sprites to use different palletes by changing their pallete values inside the ROM instead of remapping them when the game is running is one of the few major things left to improve.

EDIT: Actually, the change target code is just not good enough, again, OMG. A version 1.2 is needed to tacklet that, so I also have some ideas about Mack (Tryceratops) and Tyrog, maybe I can turn these ideas into features for the new update.
