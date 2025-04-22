# I2 Foxkitten Workspace
Just my workspace and my archive in Infinitode 2 Modding

## IMPORTANT Security Notice
Lua Whitelist restricts the use of some objects and variables of the game to protect players from possible dangerous scripts and maps. This modification _**CHANGES LUA WHITELIST**_ to gain access to the necessary (and unnecessary) parts of the game. What is added to the whitelist, why and in which script it is used is described in **[THIS FILE](WHITELIST_CHANGES.md)**

## Content
The following projects are in mod, current and archival
* none

## How to install
1. Get [Infinitode 2 from Steam](https://store.steampowered.com/app/937310/Infinitode_2__Infinite_Tower_Defense/) and download it
2. Go to your Steam Library and right-click on Infinitode 2 in the list. Select "Manage" and then click "Browse local files" to open the folder where the game has been installed
3. Create an empty folder somewhere (for example, `C:/i2fxkw`) and copy everything from the game's installation folder there
4. Download this mod. Scroll up to the top and click the green button labeled "Code" then click ["Download Zip"](https://github.com/ELfox513/I2fxkWorkspace/archive/refs/heads/main.zip)
5. Unzip the contents of the `I2fxkWorkspace-main` folder inside the zip archive into the mod folder. **Agree to replace files at destination**
6. Done! You can run the mod by double-clicking on the `infinitode-2.exe` file

## Compatibility
###### Vanilla
This mod is **fully compatible** with **R.1.9.2 (build 208) for PC**. Compatibility with _previous and future versions_ of the game and with _other platforms_ is _not guaranteed_
###### Other mods and maps
Compatibility with other mods is also not guaranteed. But you can try to resolve possible compatibility conflicts described below to be able to run this mod with others
* Lua Whitelist changed in `res/luaj/whitelist.txt` file. Access to some closed parts of the game is necessary for the correct work of the mod
* The mod adds a `fxkw` stage, which is why the `res/basic-level-stages.json` file is changed
