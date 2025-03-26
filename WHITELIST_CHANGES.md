# Lua Whitelist Changes

- `com.badlogic.gdx.backends` - **Still block**
    - `.lwjgl3.Lwjgl3Graphics.setTitle(arg0: String) : void` - **Whitelist** in `500_i2fxkw.lua`. Needed for change window title. `C.Gdx.graphics:setTitle()` does not work with the blocked corresponding backend function
- `com.prineside.tdi2.managers.ScriptManager` - **Still block**
    - `.setup() : void` - **Whitelist** in `globals/501_i2fxkw.lua`. Needed to be able to reboot ScriptManager
- `com.prineside.tdi2.Game.scriptManager` - **Whitelist** in `globals/501_i2fxkw.lua`. Needed to be able to reboot ScriptManager