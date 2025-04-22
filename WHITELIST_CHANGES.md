# Lua Whitelist Changes

- `com.badlogic.gdx.backends` - **Still block**
    - `.lwjgl3.Lwjgl3Graphics.setTitle(arg0: String) : void` - **Whitelist** in [fxkw00_general.lua](scripts/fxkw00_general.lua). Needed for change window title. `C.Gdx.graphics:setTitle()` does not work with the blocked corresponding backend function
- `com.prineside.tdi2.managers.script.ScriptEnvironment` - **Still block**
    - `.loadScriptsInDir(arg0: String) : void` - **Whitelist** in [map-editor/fxkw00_general.lua](scripts/map-editor/fxkw00_general.lua). Needed for loading all scripts in the dir
- `com.prineside.tdi2.managers.ScriptManager` - **Still block**
    - `.setup() : void` - **Whitelist** in [global/fxkw01_cmd.lua](scripts/global/fxkw01_cmd.lua). Needed to be able to reboot ScriptManager
- `com.prineside.tdi2.systems.ScriptSystem.scriptEnvironment` - **Whitelist** in [map-editor/fxkw00_general.lua](scripts/map-editor/fxkw00_general.lua). Needed for loading all scripts in the dir.
- `com.prineside.tdi2.Game.scriptManager` - **Whitelist** in [global/fxkw01_cmd.lua](scripts/global/fxkw01_cmd.lua). Needed to be able to reboot ScriptManager
