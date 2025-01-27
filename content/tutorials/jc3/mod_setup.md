---
title: Setup JC3 for mods
description: Simple guide to enable mods in Just Cause 3
tags:
  - tutorials
  - knowledge/basics
  - game/jc3
---
# Step 1: Enabling mod-loading

- Open *Steam*
- Go to your *library*
- Find *Just Cause 3* in your list of games
- Right click it, then click *properties*
- At the bottom of the popup window below where it says *launch options* paste the below command (including the dot)

`--vfs-fs dropzone --vfs-archive patch_win64 --vfs-archive archives_win64 --vfs-fs .`

# Step 2: Getting to the game's install-folder

With the popup menu from the previous step still open, click *Installed files* on the left, then *Browse...* in the top right to get to the game's install folder.

# Step 3: Creating a mod folder

Once you're in here, all you need to do is create a folder called **dropzone**. This is where most mods you download and install go to.

# Step 4: Downloading and installing mods

The Just Cause 3 mod site is [VideoGameMods.com](https://videogamemods.com/justcause3/). All the mods you find here are completely free. What all mods have in common is that they come in a file archive (.zip, .rar, 7z, etc). Before you can do anything with the mod, you need to extract the archive. In Newer Windows 11 versions you can just right click the file and click *extract all*. In older Windows versions you might need other software such as winrar or 7zip.

Once you extracted the mod, installing mods is quite simple. Most of the time you will either get a dropzone folder in the download or [one or more of these folders](files/jc3/overview.md).
If your download comes with a dropzone folder, simply go copy the folders from the download dropzone and paste them into your dropzone. If the mod just comes with one of the above mentioned folders, copy them all and paste them into your dropzone.

DLC mods are a bit special and don't just go into the normal dropzone. 
They come in a "dropzone_*DLC name* folder". If you get a mod like this, simply copy the dlc dropzone next to the default one, go inside and run the *DLCPacker.exe*. That is going to install the dlc mod. 
Mind that if you don't own the DLC the mod is for, you will just get an error and the mod will not work. Also mind that if you have several DLC dropzones, you only need to run on of the DLCpackers. They will run eachother and install the mods in all DLC dropzones.
To uninstall dlc mods, you can't simple remove the files of the mod you want to get rid of, you also need to re-run the DLCpacker to apply the changes.

Of course there is also a small number of miscellaneous mods like trainers and Reshade configs. For things like that, always take a look at the mod's installation section.