# Lua Whitelist Changes

- `com.badlogic.gdx.backends` - <u>Still blocked</u>
    - `.lwjgl3.Lwjgl3Graphics.setTitle(String arg0)` - <u>Whitelisted</u> in `500_i2fxkw.lua` for change window title. `C.Gdx.graphics:setTitle()` does not work with the blocked corresponding backend function