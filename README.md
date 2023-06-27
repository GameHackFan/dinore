# Cadillacs and Dinosaurs Readjusted
A mod for the Cadillacs and Dinosaurs (World, Arcade).
<br/>
This mod brings some extra features and fixes some bugs present in the original game.
<br/><br/>
You can access the patcher [here](https://gamehackfan.github.io/dinore/).
<br/><br/>

Version 1.4:
- Added support for object spawning with custom pallete ID in Hogg area.
- Improved the way Ammo, Weapons and Treasure custom pallete ID are randomized.
- Fixed a bug where Rod broken piece was not grabbing Rod's custom pallete.
- Fixed a bug where Explosive Barrels were not resetting their color after being grabbed.
- Forced all Slice / Slisaur Boomerang sprites to use pallete 16.
- Improved Hannah's 3rd color.
- Improved Hannah Custom Pallete (pallete 03), the one that is used by body parts and objects.
- Barrels now spawn with a random custom pallete ID optimized by area.
- Butcher actions were changed, see change A to D.
- Change A: Butcher punch attack strikebox width increased from 53 to 74 pixels.
- Change B: Butcher punch attack strikebox moved forward 5 pixels.
- Change C: The new strikebox better covers his body and has a better range.
- Change D: The strikebox still allows player to stay inside him, but it is risky to do that.
- Morgan actions were changed, see change E to H.
- Change E: Morgan wake up gun blow attack was brought back.
- Change F: Morgan wake up gun blow strikebox changed from 6A to 7E.
- Change G: The new strikebox better covers his body and has a better range.
- Change H: The strikebox now doesn't allow morgan to miss his blow if players stand inside him.
- Morgue and Fessenden 1st actions were changed, see change I to L.
- Change I: Morgue / Fessenden 1st slap attack strikebox width increased from 85 to 108 pixels.
- Change J: Morgue / Fessenden 1st slap attack strikebox moved forward 5 pixels.
- Change K: The strikebox changes better covers his body and has a better range.
- Change L: The strikebox now doesn't allow morgue to miss his slap if players stand inside him.
- Tyrog actions were changed, see change M to P.
- Change M: Tyrog wake up slap attack was brought back.
- Change N: Tyrog slap attack strikebox width increased from 95 to 127 pixels.
- Change O: Tyrog slap attack strikebox moved forward 8 pixels.
- Change P: The strikebox changes better covers his body and has a better range.
- Change Q: The strikebox now doesn't allow tyrog to miss his slap if players stand inside him.
- Forced enemies to spawn with rage set to max (FF), Most enemies in the game spawns with rage 0.

See all changes made [here](https://github.com/GameHackFan/dinore/blob/main/changelog).
<br/><br/>

Known Bugs:
- Sometimes when an enemy dies, he keeps rotating forever in the air and might softlock the game (bug present in the original game).
- If you hit butcher and your partner at the same time, all players become immortal (bug present in the original game).
- Sometimes the game throws an exception and it crashes, I saw that happen only on 4th stage, have no clue how it happens and why, it might also happen on other stages (bug present in the original game).
- Players can grab enemies from far away and sometimes even when they are in the air (bug present in the original game).
- 2nd Form of Final Boss can be double or triple comboed by players, he dies without even moving (bug present in the original game).
- If you get an extra life in the score count screen at the end of a stage, your character doesn't cheer after defeating the boss and also stop moving, but it goes back to normal as soon as the next stage loads (bug present in the original game).
- Tyrog doesn't puke or spit fire if the player active flag is set to a value that makes the player immortal, Punch + Attack button does that, being knocked down also does that, throwing enemies too, several other situations (bug present in the original game).
- Gameplay demo is grabbing the new colors instead of the originals (Readjusted version bug).
<br/><br/>



WHAT'S NEXT: There isn't much left to do for this hack, maybe adjust some of the changes made. Maybe I will fix some of the bugs left, maybe not, the rare crash bug I don't even have an idea of why it happens so I can't replicate, which means I can't fix it right now.
