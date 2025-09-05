local T = Angleur_Translate

local warningFrame = CreateFrame("Frame", "Angleur_BobberScanner_Disclaimer", UIParent, "Angleur_WarningFrame")
warningFrame:SetPoint("CENTER", 0, 170)
warningFrame.TitleText:SetText(T["Bobber Scanner - Dizzy Warning"])
warningFrame.noButton:Hide()
warningFrame.yesButton:ClearAllPoints()
warningFrame.yesButton:SetPoint("TOP", warningFrame.mainText, "BOTTOM", 0, -4)
warningFrame.yesButton:SetText(T["Okay"])
warningFrame.yesButton:SetSize(96, 32)
warningFrame.mainText:AdjustPointsOffset(0, 5)
warningFrame.mainText:SetText(T["Do not " 
.."use this feature if you are sensitive to\nrapid movement " 
.. "or any form of fast graphical\nchange.Such as but not limited "
.. "to:\nPhotosensitive Epilepsy, Vertigo..."])
warningFrame.yesButton:SetScript("OnClick", function()
    warningFrame:Hide()
end)

--______________________________________________
--                 UI STUFF
--______________________________________________
local cameraFrame = CreateFrame("Frame")
cameraFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 150)
cameraFrame:SetSize(32, 32)
cameraFrame:RegisterEvent("CURSOR_CHANGED")
local texture = cameraFrame:CreateTexture("Angleur_ScannerIndicator", "ARTWORK")
texture:SetPoint("CENTER")
texture:SetSize(32, 32)
texture:SetColorTexture(0, 8, 0, 0.6)
local text = cameraFrame:CreateFontString("Angleur_ScannerWarning", "ARTWORK", "GameFontNormal")
text:SetPoint("BOTTOM", cameraFrame, "TOP", 0, 10)
text:SetText("Place your cursor in the box\nbelow for the scanner to work.")
cameraFrame:Hide()
cameraFrame:SetPropagateMouseMotion(true)
cameraFrame:SetPropagateMouseClicks(true)
-- cameraFrame:SetPassThroughButtons("LeftButton", "RightButton", "MiddleButton", "Button4", "Button5")
-- cameraFrame:SetMouseClickEnabled(false)
-- cameraFrame:SetMouseMotionEnabled(false)
-- cameraFrame:SetMouseMotionEnabled(false)
-- print("why")
local timeOutFrame = CreateFrame("Frame")
local mouseInside = false
if cameraFrame:IsMouseOver() then
    texture:SetColorTexture(0, 8, 0, 0.6)
    mouseInside = true
    text:Hide()
else
    texture:SetColorTexture(8, 0, 0, 0.6)
    mouseInside = false
    text:Show()
end
cameraFrame:SetScript("OnEnter", function(self)
    if active then
    end
    texture:SetColorTexture(0, 8, 0, 0.6)
    mouseInside = true
    text:Hide()
end)
cameraFrame:SetScript("OnLeave", function(self)
    if active then
        self:stopAll()
    end
    texture:SetColorTexture(8, 0, 0, 0.6)
    mouseInside = false
    text:Show()
end)

local collapseConfig = CreateFrame("Button", "AngleurBobberScanner_CollapseConfig", cameraFrame, "Legolando_CollapseConfigTemplate_Angleur")
collapseConfig:SetPoint("LEFT", cameraFrame, "RIGHT")
collapseConfig.tooltip = T["Open Config"]
collapseConfig.icon:SetTexture("Interface/BUTTONS/UI-OptionsButton")
collapseConfig.popup.title:SetText(T["Bobber Scanner Configuration"])



for i=1, 3, 1 do

end
--______________________________________________
--______________________________________________


-- Unit: π Radians / s
local H_SPEED = 0.4
-- Unit: π Radians / 2s
local V_SPEED = 0.3

-- Unit: π Radians
local H_DIST = 1/4
local V_DIST = 1/4
local V_OFFSET = 1/4

-- Unit: Seconds
local WAIT_TIME = 1

local UI_WIDTH_MAX = 1318
local UI_HEIGHT_MAX = 768

local active = false

local function bScanner_SavedVariables()
    if AngleurBobberScannerUI == nil then
            AngleurBobberScannerUI = {}
    end
end

local scannerArea = cameraFrame:CreateTexture("Angleur_ScannerArea", "ARTWORK")
scannerArea:SetTexture("Interface/Addons/Angleur/imagesClassic/scanarea.png")
local CONVERSION_FACTOR = 1
local OFFSET_CONVERSION_FACTOR = 1/3
function scannerArea:Adjust(zoomFactor)
    self:ClearAllPoints()
    -- Convert the radian based area into pixels
    local width = UI_WIDTH_MAX * ((H_DIST / zoomFactor) * CONVERSION_FACTOR)
    local height = UI_HEIGHT_MAX * ((V_DIST / zoomFactor) * CONVERSION_FACTOR)
    -- Convert the Radian based offset into pixels
    local offsetY = UI_HEIGHT_MAX * ((V_OFFSET * zoomFactor) * OFFSET_CONVERSION_FACTOR)
    self:SetPoint("TOP", texture, "TOP", 0, -offsetY)
    self:SetSize(width, height)
end


--_______________________________________________________________________
--                       EVENTS AND CALLBACKS
--_______________________________________________________________________
EventRegistry:RegisterFrameEventAndCallback("PLAYER_ENTERING_WORLD", function(ownerID, ...)
    --________________________
    local maxZoom = GetCVar("cameraDistanceMaxZoomFactor")
    -- The factor that determines how strong zoom's affect is
    -- Currently: 1 --> 1 | 2 --> 1,5 | 3 --> 2 | 4 --> 2 ...
    local zoomFactor = (maxZoom + 1) / 2
    scannerArea:Adjust(zoomFactor)
    bScanner_SavedVariables()
end)
EventRegistry:RegisterCallback("Angleur_StopFishing", function()
    if active then
        cameraFrame:stopAll()
    end
end)
EventRegistry:RegisterCallback("Angleur_StartFishing", function()
    Angleur_BobberScanner_HandleGamepad(true, nil)
end)
EventRegistry:RegisterCallback("Angleur_Sleep", function()
    if AngleurClassicConfig.softInteract.enabled == true and AngleurClassicConfig.softInteract.bobberScanner == true then
        cameraFrame:Hide()
    end
end)
EventRegistry:RegisterCallback("Angleur_Wake", function()
if AngleurClassicConfig.softInteract.enabled == true and AngleurClassicConfig.softInteract.bobberScanner == true then
    cameraFrame:Show()
    Angleur_BobberScanner_HandleGamepad(false, T["Angleur Bobber Scanner: Gamepad Detected! Cast fishing once to trigger cursor mode, then place it in the indicated box."])
    else
        cameraFrame:Hide()
    end
end)
EventRegistry:RegisterCallback("AngleurClassic_ScannerOn", function()
    if AngleurCharacter.sleeping == false then
        cameraFrame:Show()
    end
    warningFrame:Show()
end)
EventRegistry:RegisterCallback("AngleurClassic_ScannerOff", function()
    cameraFrame:Hide()
end)
--_______________________________________________________________________
--_______________________________________________________________________
    

--_______________________________________________________________________
--                     CAMERA FRAME CODE - MOVEMENT
--_______________________________________________________________________
function cameraFrame:stopAll()
    MoveViewRightStop()
    MoveViewLeftStop()
    MoveViewDownStop()
    MoveViewUpStop()
    MoveViewOutStop()
    active = false
    self:SetScript("OnUpdate", nil)
    self:SetScript("OnEvent", nil)
    timeOutFrame:SetScript("OnUpdate", nil)
end
local function checkCursor(self)
    local changed = SetCursor(nil)
    Angleur_BetaPrint(changed)
    if changed == true then
        cameraFrame:stopAll()
    end
end
function cameraFrame:nextLine(lines, lineChangeTime, columnSweepTime, moveLeft)
    if lines == 0 then 
        Angleur_BetaPrint("grid scan done, nothing found")
        self:stopAll()
        SetView(2)
        return 
    end
    MoveViewUpStart(V_SPEED)
    Angleur_SingleDelayer(lineChangeTime, 0, lineChangeTime, self, nil, function()
        MoveViewUpStart(0)
        self:sweep(lines - 1, lineChangeTime, columnSweepTime, moveLeft)
    end)
end
local function printSweep(moveLeft)
    if moveLeft then
        Angleur_BetaPrint("moving left")
    else
        Angleur_BetaPrint("moving right")
    end
end
function cameraFrame:sweep(lines, lineChangeTime, columnSweepTime, moveLeft)
    if moveLeft then
        Angleur_BetaPrint("starting sweep of line: ", lines, "to the left")
        MoveViewLeftStart(H_SPEED)
        Angleur_SingleDelayer(columnSweepTime, 0, columnSweepTime, self, function()printSweep(moveLeft) end, function()
            MoveViewLeftStart(0)
            self:nextLine(lines, lineChangeTime, columnSweepTime, not moveLeft)
        end)
    else
        Angleur_BetaPrint("starting sweep of line: ", lines, "to the right")
        MoveViewRightStart(H_SPEED)
        Angleur_SingleDelayer(columnSweepTime, 0, columnSweepTime, self, function()printSweep(moveLeft) end, function()
            MoveViewRightStart(0)
            self:nextLine(lines, lineChangeTime, columnSweepTime, not moveLeft)
        end)
    end
end
-- Bring camera to starting point. Halfway of horizontal-scan-area(H_DIST) to the left, 
-- and a set distance(V_OFFSET) downward - (independent from V_DIST). 
-- Use 'horizontalTime/2' and don't change H_SPEED to go halfway
-- V_OFFSET will also use 'horizontalTime/2', adjust the offset speed accordingly
function cameraFrame:setup(lines, verticalTime, horizontalTime, moveLeft, zoomFactor)
    local setup_time = horizontalTime
    -- H_SPEED is unchanged for setup, horizontalTimer will be halved instead
    local setup_hSpeed = H_SPEED
    -- Calculate the time for the 'V_OFFSET' distance for V_SPEED 
    local vOffset_time  = (V_OFFSET / V_SPEED)
    -- Adjust vertical offset speed from V_SPEED based on the ratio of vOffset_time / horizontalTime
    -- Then, MULTIPLY BY Zoom Factor - Farther zoom ==> More Downward Movement
    local setup_vSpeed = V_SPEED * (vOffset_time / horizontalTime) * zoomFactor
    print("setup time is: ", setup_time)
    print(setup_hSpeed, setup_vSpeed)
    print("setup distance: ", setup_hSpeed * horizontalTime/2, setup_vSpeed * horizontalTime/2)
    Angleur_SingleDelayer(15, 0, 1, timeOutFrame, nil, function()
        self:stopAll()
        Angleur_BetaPrint("Camera Frame: Timed out")
    end)
    Angleur_SingleDelayer(WAIT_TIME, 0, WAIT_TIME, cameraFrame, nil, function()
        MoveViewUpStart(setup_vSpeed)
        MoveViewRightStart(setup_hSpeed)
        MoveViewOutStart(12)
        Angleur_SingleDelayer(horizontalTime/2, 0, 0.1, cameraFrame, nil, function()
            Angleur_BetaPrint("Setup Phase Over")
            print("Setup Phase Over")
            MoveViewRightStart(0)
            MoveViewUpStart(0)
            MoveViewOutStart(0)
            local lineswap_time = verticalTime / lines
            print("line time", lineswap_time)
            self:SetScript("OnEvent", checkCursor)
            self:sweep(lines, lineswap_time, horizontalTime, not moveLeft)
        end)
    end)
end
--_______________________________________________________________________
--_______________________________________________________________________


--_______________________________________________________________________
--                      CODE ACCESSIBLE FROM OUTSIDE
--_______________________________________________________________________
local textSet = false
function Angleur_BobberScanner_HandleGamepad(cursorMode, toPrint)
    if AngleurClassicConfig.softInteract.enabled == false or AngleurClassicConfig.softInteract.bobberScanner == false then return end
    if C_GamePad.IsEnabled() == false or IsUsingGamepad() == false then return end
    if not textSet then
        text:SetText(T["GAMEPAD MODE: After casting \'fishing\', move the cursor that appears into the box below to use."])
        textSet = true
    end
    if cursorMode then 
        Angleur_SetCursorForGamePad(true)
    end
    if toPrint then 
        print(toPrint)
    end
end
function Angleur_BobberScanner()
    if not mouseInside then
        print("Mouse needs to be in the indicated area for the scanner to work properly.")
        Angleur_BobberScanner_HandleGamepad(true, T["Angleur Bobber Scanner: Please move the Gamepad Cursor that appears into the inticated box."])
        return
    end
    local gameVersion = Angleur_CheckVersion()
    if gameVersion == 2 then
        ResetView(2)
        SetView(2)
    elseif gameVersion == 3 then
        ResetView(2)
        SetView(2)
    else
        print("Error: Bobber Scanner called on unregistered game version")
        return
    end
    MoveViewRightStart(0)
    MoveViewUpStart(0)
    MoveViewLeftStart(0)
    MoveViewDownStart(0)
    MoveViewOutStart(0)
    local maxZoom = GetCVar("cameraDistanceMaxZoomFactor")
    -- The factor that determines how strong zoom's affect is
    -- Currently: 1 --> 1 | 2 --> 1,5 | 3 --> 2 | 4 --> 2 ...
    local zoomFactor = (maxZoom + 1) / 2
    -- Calculate the times for V_DIST and H_DIST based on speeds | then DIVIDE BY Zoom Factor
    local vTime = (V_DIST / V_SPEED) / zoomFactor
    local hTime = (H_DIST / H_SPEED) / zoomFactor
    print("Distances: ", vTime * V_SPEED, hTime * H_SPEED)
    local lines = 14
    active = true
    Angleur_SetCursorForGamePad(true)
    cameraFrame:setup(lines, vTime, hTime, false, zoomFactor)
    scannerArea:Adjust(zoomFactor)
end


SLASH_ANGLEURBOBBERCALIBRATE1 = "/angcalib"
local calibrateFrame = CreateFrame("Frame")
SlashCmdList["ANGLEURBOBBERCALIBRATE"] = function() 
    MoveViewUpStart(1)
    print("starting test")
    local elapsedTotal = 0
    local delay = 2
    calibrateFrame:SetScript("OnUpdate", function(self, elapsed)
        elapsedTotal = elapsedTotal + elapsed
        if elapsedTotal >= delay then
            print("Time elapsed: ", elapsedTotal)
            self:SetScript("OnUpdate", nil)
            self:SetScript("OnEvent", nil)
            MoveViewUpStop()
        end
    end)
    calibrateFrame:RegisterEvent("PLAYER_STARTED_MOVING")
    calibrateFrame:SetScript("OnEvent", function(self)
        print("Time elapsed: ", elapsedTotal)
        self:SetScript("OnUpdate", nil)
        self:SetScript("OnEvent", nil)
        MoveViewUpStop()
    end)
end
--_______________________________________________________________________
--_______________________________________________________________________

-- local camControl = CreateFrame("Frame", "CamControlFrame", UIParent, "BasicFrameTemplateWithInset")
-- camControl:SetPoint("CENTER", 300, 130)
-- camControl:SetSize(128, 128)


-- local turnLeft = CreateFrame("Button", nil, camControl, "GameMenuButtonTemplate")
-- turnLeft:SetPoint("CENTER", camControl, "CENTER", -32, -10)
-- turnLeft:SetSize(32, 24)
-- turnLeft:SetText("<")
-- turnLeft:SetScript("OnClick", function()
--     stopAll()
--     MoveViewRightStart(H_SPEED)
--     Angleur_SingleDelayer(2, 0, 0.5, camControl, function()printSweep(true) end, function()
--         MoveViewRightStop()
--     end)
-- end)
-- local turnRight = CreateFrame("Button", nil, camControl, "GameMenuButtonTemplate")
-- turnRight:SetPoint("CENTER", camControl, "CENTER", 32, -10)
-- turnRight:SetSize(32, 24)
-- turnRight:SetText(">")
-- turnRight:SetScript("OnClick", function()
--     stopAll()
--     MoveViewLeftStart(H_SPEED)
--     Angleur_SingleDelayer(2, 0, 0.5, camControl, function()printSweep(false) end, function()
--         MoveViewLeftStop()
--     end)
-- end)
-- local turnUp = CreateFrame("Button", nil, camControl, "GameMenuButtonTemplate")
-- turnUp:SetPoint("CENTER", camControl, "CENTER", 0, 22)
-- turnUp:SetSize(32, 24)
-- turnUp:SetText("^")
-- turnUp:SetScript("OnClick", function()
--     stopAll()
--     MoveViewDownStart(H_SPEED)
--     Angleur_SingleDelayer(2, 0, 0.5, camControl, nil, function()
--         MoveViewDownStop()
--     end)
-- end)

-- EventRegistry:RegisterCallback("WhatwhatWhat", function()
--     MoveViewUpStart(H_SPEED)
-- end)

-- local turnDown = CreateFrame("Button", nil, camControl, "GameMenuButtonTemplate")
-- turnDown:SetPoint("CENTER", camControl, "CENTER", 0, -42)
-- turnDown:SetSize(32, 24)
-- turnDown:SetText("_")
-- turnDown:SetScript("OnClick", function()
--     MoveViewUpStart(0)
--     local delay = 3
--     local threshold = 0.5
--     local timeElapsed = 0
--     turnDown:SetScript("OnUpdate", function(self, elapsed) 
--     timeElapsed = timeElapsed + elapsed
--         if timeElapsed > threshold then
--             delay = delay - timeElapsed
--             timeElapsed = 0
--         end
--         if delay <= 0 then
--             self:SetScript("OnUpdate", nil)
--             MoveViewUpStart(H_SPEED)
--         end
--     end)
-- end)

-- local stopAllButton = CreateFrame("Button", nil, camControl, "GameMenuButtonTemplate")
-- stopAllButton:SetPoint("LEFT", camControl, "RIGHT", 0, 0)
-- stopAllButton:SetSize(64, 48)
-- stopAllButton:SetText("X")
-- stopAllButton:SetScript("OnClick", function()
--     stopAll()
--     SetView(2)
    
-- end)
-- camControl:Show()
