# Lua Whitelist Changes

- `com.badlogic.gdx`
    - `.backends` - **Still block**
        - `.lwjgl3`
            - `.Lwjgl3Net.openURI(arg0: String) : boolean` - **Whitelist** - For openning URLs in browser
            [scripts/51_script-dirs.lua](scripts/51_script-dirs.lua) - Javadoc commands
            - `.Lwjgl3Graphics.setTitle(arg0: String) : void` - **Whitelist** - Set window title
            [~/_runtime/00_main.lua](scripts/fxkw/_runtime/00_main.lua) - Mod name window title
    - `.Gdx.net` - **Whitelist** - Access to libGDX Net object
        [scripts/51_script-dirs.lua](scripts/51_script-dirs.lua) - Javadoc commands
    - `.Net` - **Still block**
        - `.openURI(arg0: String) : boolean`  - **Whitelist**  - For openning URLs in browser. Backend required
        [scripts/51_script-dirs.lua](scripts/51_script-dirs.lua) - Javadoc commands
- `com.prineside.tdi2`
    - `.desktop` - **Still block**
        - `.DesktopLauncher.ActionResolverDesktop.getShortDeviceInfo() : String` - **Whitelist** - get OS, CPU arch and JVM version
        [scripts/51_script-dirs.lua](scripts/51_script-dirs.lua) - Extended info about runtime
    - `.managers`
        - `.script.ScriptEnvironment` - **Still block**
            - `.loadScriptsInDir(arg0: String) : void` - **Whitelist** - Self explanatory
            [scripts/51_script-dirs.lua](scripts/51_script-dirs.lua) - Separate script order loading to mod dirs
        - `.ScriptManager` - **Still block**
            - `.global : ScriptEnvironment` - **Whitelist** - Access to lua env in non-game state
            [scripts/51_script-dirs.lua](scripts/51_script-dirs.lua) - Load scripts runtime folder to env
            - `.setup() : void` - **Whitelist** - Init ScriptManager
            [scripts/global/51_script-dirs.lua](scripts/global/51_script-dirs.lua) - Reload env command
    - `.systems.ScriptSystem.scriptEnvironment` - **Whitelist** - Access to lua env in game and map editor state
        [scripts/51_script-dirs.lua](scripts/51_script-dirs.lua) - Load scripts runtime folder to env
    - `.ActionResolver.getShortDeviceInfo() : String` - **Whitelist** - get OS, CPU arch and JVM version
        [scripts/51_script-dirs.lua](scripts/51_script-dirs.lua) - Extended info about runtime. Backend required
    - `.Game.scriptManager` - **Whitelist** - Access to game ScriptManager object
        [scripts/51_script-dirs.lua](scripts/51_script-dirs.lua) - Load scripts runtime folder to env
        [scripts/global/51_script-dirs.lua](scripts/global/51_script-dirs.lua) - Reload env command
