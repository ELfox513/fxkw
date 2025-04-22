--[[
    LUA WHITELIST REQUIREMENTS: 
    - com.badlogic.gdx.backends.lwjgl3.Lwjgl3Graphics.setTitle(arg0: String) : void --> WHITELIST
--]]

local logger = C.TLog:forTag("fxkw.lua")

dofile("scripts/fxkw/misc.lua")

C.Gdx.graphics:setTitle("I2 Foxkitten Workspace")

logger:i("Done")