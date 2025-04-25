--[[ Particly worked: Conflict with LevelStagesEditor save feature ]]

-- Add workspace stage
local stage = C.BasicLevelStage.new("i2cw", C.Color.new_4f(0,0.625,0,1), "I2Collection Workspace")
C.Game.i.basicLevelManager:addStage(stage)
-- Set stage from end to beggining of stage list
local stagesOrdered = C.Game.i.basicLevelManager.stagesOrdered
stagesOrdered:pop()
stagesOrdered:insert(0, stage)