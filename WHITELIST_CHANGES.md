# Lua Whitelist Changes

- `com.badlogic.gdx.backends` - **Still block**
    - `.lwjgl3.Lwjgl3Graphics.setTitle(arg0: String) : void` - **Whitelist** in `500_i2fxkw.lua`. Needed for change window title. `C.Gdx.graphics:setTitle()` does not work with the blocked corresponding backend function
- `com.badlogic.gdx.files.FileHandle` - **Still block**
    - `.FileHandle(arg0: Strung)` - **Whitelist** in `map-editor/510_fxkw_maped-plugins.lua`. Needed to get a list of files in the tiles fxkw folder. `C.SFileHandle` is little buggy for now. 
    - `.list() : FileHandle[]` - *\<check prev\>*
    - `.path() : String` - *\<check prev\>*
- `com.prineside.tdi2.managers.ScriptManager` - **Still block**
    - `.setup() : void` - **Whitelist** in `globals/501_i2fxkw.lua`. Needed to be able to reboot ScriptManager
- `com.prineside.tdi2.Game.scriptManager` - **Whitelist** in `globals/501_i2fxkw.lua`. Needed to be able to reboot ScriptManager
