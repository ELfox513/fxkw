--[[
    LUA WHITELIST REQUIREMENTS: 
    - com.badlogic.gdx.backends.lwjgl3.Lwjgl3Graphics.setTitle(arg0: String) : void
--]]

local logger = C.TLog:forTag("fxkw.lua")

fxkw = {}

C.Gdx.graphics:setTitle("Infinitode 2 Fox Kiwi")

logger:i("Done")