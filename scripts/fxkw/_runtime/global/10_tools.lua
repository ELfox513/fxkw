-- [[scriptDirs CMD]]

local quad_viewer_wnd = nil
cmd.quad_viewer = function(quad)
    if (quad == "?") then
        return { pr = fxkw.cmdPrefix, descr = "Shows Quad Viewer tool", }
    end

    dofile("scripts/fxkw/tools/quad-viewer.lua")(quad)
end