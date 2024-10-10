---
title: Launch Arguments
tags:
  - info
---
Launch arguments are required to load files from the dropzone directory. This is the most common way to load mods into Avalanche Studio games.

Add the below commands to your launch properties to enable mods (or use a mod launcher!)

# Just Cause 3
`--vfs-fs dropzone --vfs-archive patch_win64 --vfs-archive archives_win64 --vfs-fs .`

# Just Cause 4
Unfortunately, the launch arguments for JC4 are very long and depend on your language. It's typically best to launch JC4 with a launcher to deal with this.

Below is an example for English speakers:

`" --vfs-fs dropzone --vfs-archive archives_win64\boot_patch --vfs-archive archives_win64\boot_patch\eng --vfs-archive archives_win64\boot --vfs-archive archives_win64\boot\hires --vfs-archive archives_win64\daredevil --vfs-archive archives_win64\daredevil\eng --vfs-archive archives_win64\daredevil\hires --vfs-archive archives_win64\demonios --vfs-archive archives_win64\demonios\eng --vfs-archive archives_win64\demonios\hires --vfs-archive archives_win64\agency --vfs-archive archives_win64\agency\eng --vfs-archive archives_win64\agency\hires --vfs-archive archives_win64\main_patch --vfs-archive archives_win64\main_patch\hires --vfs-archive archives_win64\main_patch\eng --vfs-archive archives_win64\main --vfs-archive archives_win64\main\hires --vfs-archive archives_win64\main\eng --vfs-archive archives_win64\cp_deathstalker --vfs-archive archives_win64\cp_deathstalker\hires --vfs-archive archives_win64\cp_digitaldeluxe --vfs-archive archives_win64\cp_digitaldeluxe\hires --vfs-archive archives_win64\cp_goldengear --vfs-archive archives_win64\cp_goldengear\hires --vfs-archive archives_win64\cp_neonracer --vfs-archive archives_win64\cp_neonracer\hires --vfs-archive archives_win64\cp_renegade --vfs-archive archives_win64\cp_renegade\hires --vfs-archive archives_win64\wpn_904_dragon --vfs-archive archives_win64\market1 --vfs-archive archives_win64\market2 --vfs-archive archives_win64\market2\hires --vfs-archive archives_win64\market3 --vfs-archive archives_win64\market3\hires --vfs-archive archives_win64\market4 --vfs-archive archives_win64\market4\hires --vfs-archive archives_win64\market5 --vfs-archive archives_win64\market5\hires --vfs-archive archives_win64\market6 --vfs-archive archives_win64\market6\hires"`

# Other Avalanche games
These include TheHunter COTW, Second Extinction, and Generation Zero

`--vfs-fs dropzone --vfs-archive archives_win64 --vfs-fs.`