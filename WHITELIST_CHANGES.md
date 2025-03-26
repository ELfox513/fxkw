# Lua Whitelist Changes

- `com.badlogic.gdx.backends` - **Still block**
    - `.lwjgl3.Lwjgl3Graphics.setTitle(String arg0)` - **Whitelist** in `500_i2fxkw.lua`. Needed for change window title. `C.Gdx.graphics:setTitle()` does not work with the blocked corresponding backend function
