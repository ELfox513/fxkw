--[[
    LUA WHITELIST REQUIREMENTS:
    - com.badlogic.gdx.backends.lwjgl3.Lwjgl3Net.openURI(arg0: String) : boolean
    - com.badlogic.gdx.Gdx.net : Net
    - com.badlogic.gdx.Net.openURI(arg0: String) : boolean
    - com.prineside.tdi2.desktop.DesktopLauncher.ActionResolverDesktop.getShortDeviceInfo() : String
    - com.prineside.tdi2.managers.script.ScriptEnvironment.loadScriptsInDir(arg0: String) : void
    - com.prineside.tdi2.managers.ScriptManager.global : ScriptEnvironment
    - com.prineside.tdi2.systems.ScriptSystem.scriptEnvironment : ScriptEnvironment
    - com.prineside.tdi2.ActionResolver.getShortDeviceInfo() : String
    - com.prineside.tdi2.Game.scriptManager : ScriptManager
--]]

local logger = C.TLog:forTag("script-dirs.lua")
local cmdPrefix = "_script-dirs"

_G.scriptDirs = {
    dirs = {},
    logLoad = function(path, dir)
        logger:i("[#8BC34A]%s [#FFFFFF]: loaded [#8BC34A]%s [#FFFFFF]path", dir, path)
    end,
}

-- [[scriptDirs API]]

scriptDirs.load = function(dir)
    scriptDirs.dirs[#scriptDirs.dirs+1] = dir
    logger:i("[#8BC34A]%s [#FFFFFF]added to loadlist", dir)
    ---@diagnostic disable-next-line: undefined-field
    C.Game.i.scriptManager.global:loadScriptsInDir("scripts/" .. dir .. "/_runtime")
    scriptDirs.logLoad("/", dir)
end

scriptDirs.loadRuntime = function(path, isGlobal)
    for _, v in ipairs(scriptDirs.dirs) do
        ---@diagnostic disable-next-line: undefined-field
        local env = isGlobal and C.Game.i.scriptManager.global or S.script.scriptEnvironment
        env:loadScriptsInDir("scripts/" .. v .. "/_runtime" .. path)
        scriptDirs.logLoad(path, v)
    end
end

-- [[scriptDirs CMD]]

cmd.help = function(a1)
    if (a1 == "?") then
        return { pr = cmdPrefix, descr = "Show DeveloperConsole help", }
    end

    ---@diagnostic disable-next-line: undefined-field
    logger:i("Version %s (build %s) running %s with LibGDX %s on JVM[%s]", C.Config.VERSION, C.Config.BUILD, _VERSION, com.badlogic.gdx.Version.class.VERSION, C.Game.i.actionResolver:getShortDeviceInfo())
    logger:i("Use DeveloperConsole to run any Lua script. There are some predefined functions for easier usage of console:")

    local sorted = {}
    for k, v in pairs(_G.cmd) do
        local info = v("?")
        local cmdArgs = info and info.args or nil
        local cmdDescr = info and info.descr or nil
        local cmdPr = info and info.pr or "_MAIN_"
        if not cmdArgs then cmdArgs = "" end
        if not cmdDescr then cmdDescr = "description not provided" end
        sorted[cmdPr..k] = { pr = cmdPr, cmd = k, args = cmdArgs, descr = cmdDescr}
    end

    for _, info in utils.pairsByKeys(sorted) do
        logger:i("> [#D84315][" .. info.pr .. "] [#FFFFFF]cmd." .. info.cmd .. "[#64B5F6](" .. info.args .. ")\n[#8BC34A]" .. info.descr)
    end
end

cmd.gdx_javadoc = function(a1)
    if (a1 == "?") then
        return {
            pr = cmdPrefix,
            descr = "Open LibGDX javadoc in your default browser",
        }
    end

    ---@diagnostic disable-next-line: undefined-field
    C.Gdx.net:openURI("https://javadoc.io/doc/com.badlogicgames.gdx/gdx/" .. com.badlogic.gdx.Version.class.VERSION .. "/index.html");
end

cmd.jdk8_javadoc = function(a1)
    if (a1 == "?") then
        return {
            pr = cmdPrefix,
            descr = "Open OpenJDK8 javadoc in your default browser",
        }
    end

    ---@diagnostic disable-next-line: undefined-field
    C.Gdx.net:openURI("https://devdocs.io/openjdk~8/");
end

logger:d("Ready")