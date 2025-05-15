wnd = C.Window.new_WS(fxkw.createDefaultWindowStyle())
wnd:setTitle("Quad Builder")
wnd.minHeight = 40
wnd.minWidth = 200
wndTbl = C.Table.new()

tbl1 = C.Table.new()
newButton = C.FancyButton.new_S_R("regularButton.a", C.Runnable(function()
    print("Works 2!")
end))
newButton:add(C.Label.new("Test 2", C.Game.i.assetManager:getLabelStyle(21))):padLeft(10):padRight(10)
tbl1:add(newButton):height(32):padRight(8)
tbl1:add():growX()
wndTbl:add(tbl1):growX():pad(10):padBottom(0):height(32):row()

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

wndTbl:debug()
C.Game.i.uiManager:addWindow(wnd)
wnd:setContents(wndTbl)
wnd:fitToContentSimple()
wnd:showAtCursor()