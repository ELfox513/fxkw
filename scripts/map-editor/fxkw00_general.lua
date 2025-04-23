--[[
    LUA WHITELIST REQUIREMENTS: 
    - com.prineside.tdi2.managers.script.ScriptEnvironment.loadScriptsInDir(arg0: String) : void
    - com.prineside.tdi2.systems.ScriptSystem.scriptEnvironment
--]]

-- Maped Plugins are regular scripts that can be placed
-- in the scripts folder separately from the mod

local logger = C.TLog:forTag("map-ed/fxkw.lua")

---@diagnostic disable-next-line: undefined-field
S.script.scriptEnvironment:loadScriptsInDir("scripts/fxkw/maped-plugins/")

logger:i("Done")