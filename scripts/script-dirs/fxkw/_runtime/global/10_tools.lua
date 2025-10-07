-- [[scriptDirs CMD]]

local quad_viewer_wnd = nil
cmd.quad_viewer = function(quad)
    if (quad == "?") then
        return {
            pr = fxkw.cmdPrefix,
            args = "Quad obj",
            descr = "Shows Quad Viewer tool for specified quad",
        }
    end
    dofile("scripts/script-dirs/fxkw/tools/quad-viewer.lua")(quad)
end