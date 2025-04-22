local logger = C.TLog:forTag("fxkw_cmd.lua")

local prefix = "fxkw"

cmd.help = function(a1)
    if (a1 == "?") then
        return { descr = "Show DeveloperConsole help", }
    end

    ---@diagnostic disable-next-line: undefined-field
    logger:i("Version %s (build %s) running %s with LibGDX %s on JVM[%s]", C.Config.VERSION, C.Config.BUILD, _VERSION, com.badlogic.gdx.Version.class.VERSION, C.Game.i.actionResolver:getShortDeviceInfo())
    logger:i("Use DeveloperConsole to run any Lua script. There are some predefined functions for easier usage of console:")

    local sorted = {}
    for k, v in pairs(_G.cmd) do
        local info = v("?")
        local cmdArgs = info and info.args or nil
        local cmdDescr = info and info.descr or nil
        local cmdPrefix = info and info.prefix or "__INF2"
        if not cmdArgs then cmdArgs = "" end
        if not cmdDescr then cmdDescr = "description not provided" end
        sorted[cmdPrefix..k] = { prefix = cmdPrefix, cmd = k, args = cmdArgs, descr = cmdDescr}
    end

    for _, info in utils.pairsByKeys(sorted) do
        logger:i("> [" .. info.prefix .. "] cmd." .. info.cmd .. "[#64B5F6](" .. info.args .. ")\n[#8BC34A]" .. info.descr)
    end
end

logger:i("Done")