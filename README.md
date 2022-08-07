# Cadillacs and Dinosaurs Readjusted
A mod for the Cadillacs and Dinosaurs (World, Arcade).
<br/>
This mod brings some extra features and fixes some bugs present in the original game.
<br/><br/>
You can access the patcher [here](https://gamehackfan.github.io/dinore/).
<br/><br/>

Version 1.2:
- EnemyTargetImprovement code changed again, now all players have an almost equal chance of being targeted, the difference is very small (P1 = 33.11603651%, P2 = 32.33376793%, P3 = 34.55019557%).
- Tyrog now has 32.8125% (can be more or can be less cause it uses his internal timer) chance of doing his Slap Attack instead of doing his Spine, Fire Spit, Puke Attack if his target is in the range of the Slap Attack (he could slap only when getting up, and it was removed in the 1.1 version).
- Mack (Triceratops) now behaves similar to HOGG (Biker Boss), when he leaves the screen he doesn't despawn, he comes back going to the opposite direction and keeps repeating doing it all the time.
- Tyrog Puke pallete ID changed from 1 to 3, now it is red again (3 was set to be Hannah's pallete in the 1.0 version).
- Hannah's 8th Color Change (its time for Hannah to look like herself not like Mess).
- Some small changes, more like reorganizing some code (irrelevant on gameplay).

See all changes made [here](https://github.com/GameHackFan/dinore/blob/main/changelog).
<br/><br/>

Known Bugs:
- Sometimes when an enemy dies, he keeps rotating forever in the air and might softlock the game (bug present in the original game).
- If you hit butcher and your partner at the same time, all players become immortal (bug present in the original game).
- Sometimes the game throws an exception and it crashes, I saw that happen only on 4th stage, have no clue how it happens and why, it might also happen on other stages (bug present in the original game).
- Players can grab enemies from far away and sometimes even when they are in the air (bug present in the original game).
- 2nd Form of Final Boss can be double or triple comboed by players, he dies without even moving (bug present in the original game).
- If you get an extra life in the score count screen at the end of a stage, you character doesn't cheer for defeating the boss and also stop moving, but it goes back to normal as soon as the next stage loads (bug present in the original game).
- Tyrog doesn't puke or spit fire if the player active flag is set to a value that makes the player immortal, Punch + Attack button does that, being knocked down also does that, throwing enemies too, several other situations (bug present in the original game).
- Tyrog puke for some reason is not grabbing pallete 3, it is grabbing pallete 1 / P2 instead (Readjusted version bug).
- On 3rd Stage, sometimes the pallete of the CPU driver bugs (Readjusted version bug).
- Gameplay demo is grabbing the new colors instead of the originals (Readjusted version bug).
<br/><br/>



WHAT'S NEXT: There isn't much left to do for this hack, maybe adjust some of the changes made. Forcing the sprites to use different palletes by changing their pallete values inside the ROM instead of remapping them when the game is running is one of the few major things left to improve.
