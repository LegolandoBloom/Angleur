local T = Angleur_Translate

local H_SPEED = 0.5
local V_SPEED = 0.4

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

local timeOutFrame = CreateFrame("Frame")

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

local active = false
local setupPhase = false
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

EventRegistry:RegisterCallback("Angleur_StopFishing", function()
    if active then
        cameraFrame:stopAll()
    end
end)
EventRegistry:RegisterCallback("Angleur_Sleep", function()
    if AngleurClassicConfig.softInteract.enabled == true and AngleurClassicConfig.softInteract.bobberScanner == true then
        cameraFrame:Hide()
    end
end)
EventRegistry:RegisterCallback("Angleur_Wake", function()
    if AngleurClassicConfig.softInteract.enabled == true and AngleurClassicConfig.softInteract.bobberScanner == true then
        cameraFrame:Show()
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

local function checkCursor(self)
    local changed = SetCursor(nil)
    Angleur_BetaPrint(changed)
    if changed == true and setupPhase == false then
        cameraFrame:stopAll()
    end
end

function cameraFrame:nextLine(lines, lineChangeTime, columnSweepTime, moveLeft)
    if lines == 0 then 
        Angleur_BetaPrint("grid scan done")
        self:stopAll()
        SetView(2)
        return 
    end
    MoveViewUpStart(V_SPEED)
    Angleur_SingleDelayer(lineChangeTime, 0, 0.01, self, nil, function()
        MoveViewUpStart(0)
        self:sweep(lines - 1, lineChangeTime, columnSweepTime, not moveLeft)
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
        Angleur_SingleDelayer(columnSweepTime, 0, 0.5, self, function()printSweep(moveLeft) end, function()
            MoveViewLeftStart(0)
            self:nextLine(lines, lineChangeTime, columnSweepTime, moveLeft)
        end)
    else
        Angleur_BetaPrint("starting sweep of line: ", lines, "to the right")
        MoveViewRightStart(H_SPEED)
        Angleur_SingleDelayer(columnSweepTime, 0, 0.5, self, function()printSweep(moveLeft) end, function()
            MoveViewRightStart(0)
            self:nextLine(lines, lineChangeTime, columnSweepTime, moveLeft)
        end)
    end
end

function Angleur_BobberScanner()
    if not mouseInside then
        print("Mouse needs to be in the indicated area for the scanner to work properly.")
        return
    end

    local maxZoom = GetCVar("cameraDistanceMaxZoomFactor")

    local vTime = 0.06
    local hTime = 0.1
    local lines = 10
    local gameVersion = Angleur_CheckVersion()
    if gameVersion == 2 then
        ResetView(2)
        SetView(2)
    elseif gameVersion == 3 then
        -- CameraZoomOut(30)
        ResetView(2)
        SetView(2)
        -- vTime = 0.02
        -- hTime = 0.04
        -- lines = 10
    else
        print("Error: Bobber Scanner called on unregistered game version")
        return
    end
    cameraFrame:SetScript("OnEvent", checkCursor)
    MoveViewRightStart(0)
    MoveViewUpStart(0)
    MoveViewLeftStart(0)
    MoveViewDownStart(0)
    MoveViewOutStart(0)
    setupPhase = true
    active = true
    Angleur_SingleDelayer(15, 0, 1, timeOutFrame, nil, function()
        cameraFrame:stopAll()
        Angleur_BetaPrint("Camera Frame: Timed out")
    end)
    Angleur_SingleDelayer(0.4, 0, 0.1, cameraFrame, nil, function()
        MoveViewUpStart(0.3 * maxZoom + 0.4)
        MoveViewRightStart(0.3)
        MoveViewOutStart(10)
        Angleur_SingleDelayer(0.4, 0, 0.2, cameraFrame, nil, function()
            Angleur_BetaPrint("stopping")
            MoveViewRightStart(0)
            MoveViewUpStart(0)
            MoveViewOutStart(0)
            setupPhase = false
            cameraFrame:sweep(lines, vTime, hTime, true)
        end)
    end)
end

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
