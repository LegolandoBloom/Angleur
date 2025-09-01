local H_SPEED = 0.5
local V_SPEED = 0.4

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

cameraFrame:SetPropagateMouseMotion(true)
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
    active = false
    self:SetScript("OnUpdate", nil)
    self:SetScript("OnEvent", nil)
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
    SetView(2)
    cameraFrame:SetScript("OnEvent", checkCursor)
    MoveViewDownStart(0)
    MoveViewRightStart(0)
    MoveViewUpStart(0)
    MoveViewLeftStart(0)
    MoveViewRightStart(H_SPEED/3)
    local vTime = 0.05
    local hTime = 0.1
    setupPhase = true
    active = true
    Angleur_SingleDelayer(hTime, 0, hTime, cameraFrame, nil, function()
        Angleur_BetaPrint("stopping")
        MoveViewRightStart(0)
        setupPhase = false
        cameraFrame:sweep(8, vTime, hTime, true)
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
