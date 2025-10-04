local Logger = C.TLog:forTag("fxkw/quad-viewer.lua")

return function(quad)
    local wnd = C.Window.new_WS(fxkw.createDefaultWindowStyle())
    wnd:setTitle("Quad-"..C.Integer:toHexString(quad:hashCode()))
    wnd.minHeight = 296
    wnd.minWidth = 256
    local wndTbl = C.Table.new()

    local tbl = C.Table.new()
    local img = C.Image.new_D(quad)
    tbl:add(img):grow()
    wndTbl:add(tbl):grow():pad(16):row()

    local wndListener = nil
    wndListener = C.WindowListener({
        -- Every QuadViewer window is unique and one time
        -- So, we need to clean after closing
        closed = function(self) 
            wnd:removeListener(wndListener)
            C.Game.i.uiManager:getWindowsLayer():getTable():removeActor(wnd)
        end,

        --dragged = function(self) end,
        --moved = function(self) end,

        -- This part exist, because damn game dont want work with any other
        -- scaling mode for quads, then stretch >:
        resized = function(self)
            local tblXsize = tbl:getWidth()
            local tblYsize = tbl:getHeight()

            if tblXsize > tblYsize then img:setScale(tblYsize/tblXsize, 1)
            else
                img:setScaleX(1)
                -- Idk why, but setScale(1, n) dont work properly
                -- All the pics become neurosongs about casinos
                img:setScaleY(tblXsize/tblYsize)
            end
            img:setOrigin(C.Align.center)
        end,

        --shown = function(self) end
    })
    wnd:addListener(wndListener)

    C.Game.i.uiManager:addWindow(wnd)
    wnd:setContents(wndTbl)
    wnd:fitToContentSimple()
    img:setOrigin(C.Align.center) -- Center after fit. Or align will be ignored 
    wnd:showAtCursor()
end



--[[

tbl2 = C.Table.new()


wndTbl:add(tbl2):grow():pad(10):row()

tbl3 = C.Table.new()
addButton = C.FancyButton.new_S_R("regularButton.a", C.Runnable(function()
    print("Works!")
end))
addButton:add(C.Label.new("Test", C.Game.i.assetManager:getLabelStyle(21))):padLeft(10):padRight(10)
tbl3:add(addButton):height(32):padRight(8)
tbl3:add():growX()
wndTbl:add(tbl3):growX():pad(10):padTop(0):height(32):row()



return wnd]]