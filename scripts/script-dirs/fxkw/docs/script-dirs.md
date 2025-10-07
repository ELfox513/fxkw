# script-dirs 
A mechanism for separate and sequential loading of script folders for more convenient mod management

## IMPORTANT Security Notice
This mod _**USES MODIFIED LUA WHITELIST**_ to access important parts of the game. All whitelist changes required for mechanism to work are listed [here](#lua-whitelist-modifications).

## Mod features
- [Split loading of script folders](#split-loading-of-script-folders)
- [Advanced cmd.help()](#advanced-cmdhelp)
- [New convenient commands for mod development](#new-convenient-commands-for-mod-development)
- [Special copies of dofile() functions for each script-dir folder](#special-copies-of-dofile-functions-for-each-script-dir-folder)

## More about the features
### Split loading of script folders
A similar script-dir folder uses the following architecture:

- `<script-dir folder>`
    - `_runtime`
        - `game`
            - (Autoload scripts, like in `scripts/game`)
        - `global`
            - (Autoload scripts, like in `scripts/global`)
        - `map-editor`
            - (Autoload scripts, like in `scripts/map-editor`)
        - (Autoload scripts, like in `scripts` root)
    - (Any scripts and other files)

The `_runtime` folder follows the same layout and principles as the root `scripts` folder. All scripts in the root `_runtime` folder and in the `global`, `game`, and `map-editor` folders are loaded in alphabetical order. The contents of the `global` folder are loaded when the game is not in play mode, like `scripts/global`. The contents of the `game` folder are loaded when playing a level - `scripts/game`. And the contents of the `map-editor` folder are loaded in the map editor - `scripts/map-editor`. Any other folders can be freely used to store important files of mod or for other purposes. **Don't use folders with names starting with `_`** — they are reserved by script-dirs mechanism.

### Advanced cmd.help()
Now each command has a customizable prefix. This allows you to divide commands into groups for easier searching. Commands in the help are written in the following format:

```
> [Prefix] cmd.name(ArgsType args)
Command description
```

If you want to create your own command, create it in the same format as the commands in the game's `50_cmd.lua` files, but add the parameter `pr` to the return help table (which any command in the cmd table returns when given a single string argument, "?"). The beginning of your command should look something like this:

```lua
cmd.name = function(args)
    if (args == "?") then
        return {
            pr = "Prefix",
            args = "ArgsType args",
            descr = "Command description",
        }
    end

    -- your code
end
```

When creating your command, be sure to **include the prefix**. Otherwise, the prefix will be set to `_MAIN_`, which is reserved by the game's stock commands. Also, **don't use prefixes starting with `_`** — they are reserved by script-dirs mechanism.

Also was added the output of information about JVM (OS, CPU arch, JVM version) on which the game is running.

### New convenient commands for mod development
- `cmd.help()` - Advanced version of original `cmd.help()`. More details [here](#advanced-cmdhelp).
- `cmd.gdx_javadoc()` - Opens the Javadoc version of LibGDX that runs this version of the game.
- `cmd.jdk8_javadoc()` - Opens Java 8 Javadoc. Regardless of the running Java version, the game is oriented towards version 8 for high cross-platform support of Lua VM.
- `cmd.reload_env()` - Reloads entire Lua environment without having to restart the game or level

### Special copies of dofile() functions for each script-dir folder
Instead of the regular `dofile()` function, you can use a special copy for your script-dir folder so that you don't have to write the same long path part `scripts/script-dirs/scriptdir_name` to execute the script in folder

```lua
-- Usual variant
dofile("scripts/script-dirs/scriptdir_name/myScript.lua")
-- script-dirs variant
dofile_scriptdir_name("myScript.lua")
```

## How to install script-dirs mechanism
The script-dirs mechanism is part of fxkw mod. To install fxkw with script-dirs, follow [these](../../../../README.md#how-to-install) instructions. While this mechanism is intended to be used separately from fxkw, this installation method is not currently supported.

## How to install script-dir folders
Installing script-dir folders is very simple. They come with a one-line launcher script, they usually named like script-dir folder.
1. Copy the script-dir folder to the `scripts/script-dirs` path
2. Copy the launcher script to the root of the `scripts` folder
3. Done

## How to convert my mod into script-dir format
This is also quite simple. Basically, you just need to move your script files to specified folder and create a simple launcher script.
1. Create your script-dir folder with valid name in the `scripts/script-dirs` folder. The rules for naming scripе-dir folders are identical to the rules for naming variables in Lua. For example, `myMod`
2. Organize your scripts, files, and folders according to the script directory architecture. More details [here](#split-loading-of-script-folders).
3. If you have your own console commands, add prefix to them in the return help table. More details [here](#advanced-cmdhelp).
4. Create script-dir launcher script. It's recommended to name them the same as the script directors. For example, `myMod.lua`
5. Add call to function in the script: `scriptDirs.load()`. As an argument, specify a string with the name of your script folder. For example:
```lua
scriptDirs.load("myMod")
```
6. Redy for use

## Lua Whitelist Modifications
- `com.badlogic.gdx`
    - `.backends.lwjgl3.Lwjgl3Net.openURI(arg0: String) : boolean` - For openning Javadocs in browser 
    - `.Gdx.net` - Access to libGDX Net object
    - `.Net.openURI(arg0: String) : boolean` - For openning Javadocs in browser 
- `com.prineside.tdi2`
    - `.desktop.DesktopLauncher.ActionResolverDesktop.getShortDeviceInfo() : String` - get OS, CPU arch and JVM version
    - `.managers`
        - `.script.ScriptEnvironment.loadScriptsInDir(arg0: String) : void` - Self explanatory
        - `.ScriptManager`
            - `.global : ScriptEnvironment` - **Whitelist** - Access to lua env in non-game state for load scripts runtime folder to env
            - `.setup() : void` - **Whitelist** - Reload ScriptManager and env
    - `.systems.ScriptSystem.scriptEnvironment` - Access to lua env in game and map editor state for load scripts runtime folder to env
    - `.ActionResolver.getShortDeviceInfo() : String` - get OS, CPU arch and JVM version
    - `.Game.scriptManager` - **Whitelist** - Access to game ScriptManager object for load scripts runtime folder to env and reload env command
