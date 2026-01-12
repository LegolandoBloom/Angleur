local T = Angleur_Translate

local debugChannel = 7

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

-- Determines the height of each row. Bigger number, smaller height
local V_LINES = 14

-- Is set to '2' when method 3, 'Cover all elevations' is selected
local V_DIST_MULTIPLIER = 1

-- Determines Zoom Factor's Strength. Bigger Number = Weaker Effect
local ZFACTOR_STR = 1.3

local UI_WIDTH_MAX = 1318
local UI_HEIGHT_MAX = 768

local active = false


local function bScanner_SavedVariables()
    if AngleurBobberScannerUI == nil then
        AngleurBobberScannerUI = {}
    end
    if AngleurBobberScannerUI.method == nil then
        AngleurBobberScannerUI.method = 1
    end
    if AngleurBobberScannerUI.scanWidth == nil then
        AngleurBobberScannerUI.scanWidth = 0.25
    end
    if AngleurBobberScannerUI.scanSpeed == nil then
        AngleurBobberScannerUI.scanSpeed = 0.4
    end
    if AngleurBobberScannerUI.startDelay == nil then
        AngleurBobberScannerUI.startDelay = 1
    end
    -- if AngleurBobberScannerUI.disableWarning == nil then
    --     AngleurBobberScannerUI.disableWarning = false
    -- end
end

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
.. "or any form of fast graphical\nchange. Such as but not limited "
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
text:SetText(T["Place your cursor in the box\nbelow for the scanner to work."])
cameraFrame:Hide()
cameraFrame:SetPropagateMouseMotion(true)
cameraFrame:SetPropagateMouseClicks(true)
-- cameraFrame:SetPassThroughButtons("LeftButton", "RightButton", "MiddleButton", "Button4", "Button5")
-- cameraFrame:SetMouseClickEnabled(false)
-- cameraFrame:SetMouseMotionEnabled(false)
-- cameraFrame:SetMouseMotionEnabled(false)
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

local scannerArea = CreateFrame("Frame", "Angleur_ScannerArea", cameraFrame)
scannerArea.texture = scannerArea:CreateTexture("Angleur_ScannerArea", "ARTWORK")
scannerArea.texture:SetAllPoints(scannerArea)
scannerArea.texture:SetTexture("Interface/Addons/Angleur/imagesClassic/scanarea.png")
scannerArea.offsetArrow = scannerArea:CreateTexture("Angleur_ScannerArea_OffsetArrow", "ARTWORK")
scannerArea.offsetArrow:SetTexture("Interface/Addons/Angleur/imagesClassic/redarrow.png")
scannerArea.offsetArrow:SetPoint("BOTTOMLEFT", scannerArea, "TOPLEFT")
scannerArea.offsetArrow.text = scannerArea:CreateFontString(nil, "ARTWORK", "SpellFont_Small")
scannerArea.offsetArrow.text:SetPoint("LEFT", scannerArea.offsetArrow, "RIGHT", 0, -10)
scannerArea.offsetArrow.text:SetText(T["Shows how far the camera will move downward from the \'Centered Position\' to start the scan. " 
.. "Amount is based on your Max Zoom and chosen \'Elevation\'(Bobber Scanner Menu)"])
scannerArea:Hide()
local CONVERSION_FACTOR = 0.8
local OFFSET_CONVERSION_FACTOR = 1/3
function scannerArea:Adjust()
    local maxZoom = GetCVar("cameraDistanceMaxZoomFactor")
    -- The factor that determines how strong zoom's effect is
    local zoomFactor = (maxZoom + ZFACTOR_STR) / (ZFACTOR_STR + 1)
    local zoomFactor_vOffset = zoomFactor
    local zoomFactor_Horizontal = zoomFactor * 0.8
    self:ClearAllPoints()
    -- Convert the radian based area into pixels
    local width = UI_WIDTH_MAX * ((H_DIST / zoomFactor_Horizontal) * CONVERSION_FACTOR)
    local height = UI_HEIGHT_MAX * ((V_DIST / zoomFactor_Horizontal) * CONVERSION_FACTOR) * V_DIST_MULTIPLIER
    -- Convert the Radian based offset into pixels
    local offsetY = UI_HEIGHT_MAX * ((V_OFFSET * zoomFactor_vOffset) * OFFSET_CONVERSION_FACTOR)
    self:SetPoint("TOP", texture, "TOP", 0, -offsetY)
    self:SetSize(width, height)
    self.offsetArrow:SetSize(32, offsetY)
end

-- 1 : Same Elevation | 2 : Lower Elevation | 3 : Both
local function loadUserSettings()
    if AngleurBobberScannerUI.method == 1 then
        V_OFFSET = 1/4
        V_DIST_MULTIPLIER = 1
    elseif AngleurBobberScannerUI.method == 2 then
        V_OFFSET = 1/3
        V_DIST_MULTIPLIER = 1
    elseif AngleurBobberScannerUI.method == 3 then
        -- Vertical distance covered is doubled
        V_OFFSET = 1/8
        V_DIST_MULTIPLIER = 1
    elseif AngleurBobberScannerUI.method == 4 then
        -- Vertical distance covered is doubled
        V_OFFSET = 1/4
        V_DIST_MULTIPLIER = 2
    end

    if AngleurBobberScannerUI.scanSpeed then
        H_SPEED = AngleurBobberScannerUI.scanSpeed
        V_SPEED = AngleurBobberScannerUI.scanSpeed
    end
    
    if AngleurBobberScannerUI.scanWidth then
        H_DIST = AngleurBobberScannerUI.scanWidth
    end
    
    if AngleurBobberScannerUI.startDelay then
        WAIT_TIME = AngleurBobberScannerUI.startDelay
    end
    
    scannerArea:Adjust()
end

local collapseConfig = CreateFrame("Button", "AngleurBobberScanner_CollapseConfig", cameraFrame, "Legolando_CollapseConfigTemplate_Angleur")
collapseConfig:SetPoint("LEFT", cameraFrame, "RIGHT", 3, 0)
collapseConfig.tooltip = T["Open Config"]
collapseConfig.icon:SetTexture("Interface/BUTTONS/UI-OptionsButton")
collapseConfig.popup.title:SetText(T["Bobber Scanner Configuration"])
collapseConfig.popup:SetScript("OnShow", function()
    scannerArea:Show()
end)
collapseConfig.popup:SetScript("OnHide", function()
    scannerArea:Hide()
end)
collapseConfig.popup.defaults.text:SetText(T["Reset to Defaults"])
collapseConfig.popup.defaults:SetScript("OnClick", function()
    AngleurBobberScanner_CheckMethod(1)
    collapseConfig.popup.scanWidth:SetValue(25)
    collapseConfig.popup.scanSpeed:SetValue(4)
    collapseConfig.popup.startDelay:SetValue(1)

end)

local function config_updateMethod(id)
    AngleurBobberScannerUI.method = id
end
local function uncheckSiblings(id)
    for i=1,4,1 do
        local button = collapseConfig.popup[i]
        if id ~= i then
            Angleur_BetaPrint(debugChannel, button:GetDebugName())
            button:SetChecked(false)
        end
    end
end
function AngleurBobberScanner_CheckMethod(id)
    if collapseConfig.popup[id]:GetChecked() == false then
        collapseConfig.popup[id]:SetChecked(true)
    end
    uncheckSiblings(id)
    config_updateMethod(id)
    loadUserSettings()
end
local elevationTitle = collapseConfig.popup:CreateFontString("AngleurBobberScanner_ElevationTitle", "ARTWORK", "GameFontHighlightHugeOutline2")
elevationTitle:SetPoint("TOPLEFT", collapseConfig.popup, "TOPLEFT", 130, -50)
elevationTitle:SetText(T["ELEVATION:"])

local pngTable = {
    [1] = "Interface/Addons/Angleur/imagesClassic/sameelevation.png",
    [2] = "Interface/Addons/Angleur/imagesClassic/lowerelevation.png",
    [3] = "Interface/Addons/Angleur/imagesClassic/insidewater.png",
    [4] = "Interface/Addons/Angleur/imagesClassic/bothelevation.png",
}
local tooltipTable = {
    [1] = {title = T["Same Elevation"], text = T["Use this when you are on the same level as the water, or close to it."]},
    [2] = {title = T["Lower Elevation"], text = T["Use this when the water is lower level than you."]},
    [3] = {title = T["Inside Water"], text = T["Use this when you are inside the water, making the bobber land higher than you."]},
    [4] = {title = T["Both"], text = T["Use this if you are fishing in a spot where the elevation constantly changes from level to lower and vice versa." 
    .. " The scan covers twice the height as usual, thus taking twice as long."]},
}
for i=1,4,1 do
    collapseConfig.popup[i] = CreateFrame("CheckButton", "AngleurBobberScanner_ElevationOption" .. i, collapseConfig.popup, "Angleur_SimplifiedActionButtonTemplate")
    local checkButton = collapseConfig.popup[i]
    checkButton:SetID(i)
    local scale = 1.8
    checkButton:SetScale(scale)
    checkButton:SetPoint("TOP", elevationTitle, "BOTTOM", (-125 + (i - 1) * 85)/scale, -12/scale)
    checkButton.icon:SetTexture(pngTable[i])
    checkButton:SetScript("OnClick", function(self)
        if self:GetChecked() == true then
            AngleurBobberScanner_CheckMethod(self:GetID())
        elseif self:GetChecked() == false then
            self:SetChecked(true)
        end
    end)
    checkButton:SetScript("OnEnter", function()
        GameTooltip:SetOwner(checkButton, "ANCHOR_TOPRIGHT", 0, 0)
        GameTooltip:AddLine(tooltipTable[i].title)
        GameTooltip:AddLine(tooltipTable[i].text)
        GameTooltip:Show()
    end)
    checkButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
end

collapseConfig.popup.scanWidth.ValueBox:SetNumericFullRange()
collapseConfig.popup.scanWidth:SetCallback(function(value, isUserInput)
    AngleurBobberScannerUI.scanWidth = value/100
    loadUserSettings()
end)

collapseConfig.popup.scanSpeed.ValueBox:SetNumericFullRange()
collapseConfig.popup.scanSpeed:SetCallback(function(value, isUserInput)
    AngleurBobberScannerUI.scanSpeed = value/10
    loadUserSettings()
end)


collapseConfig.popup.startDelay.ValueBox:SetNumeric(false)
collapseConfig.popup.startDelay.unitText:SetText("sec")
collapseConfig.popup.startDelay:SetCallback(function(value, isUserInput)
    local formatted = string.format("%.1f", value)
    AngleurBobberScannerUI.startDelay = tonumber(formatted)
    loadUserSettings()
end)

-- collapseConfig.popup.disableWarning.text:SetText(T["Disable Wall Warning"])
-- collapseConfig.popup.disableWarning.text.tooltip = T["When unchecked, Bobber Scanner warn you with a chat message when your " 
-- .. "Camera Zoom changes during scan(when it's not supposed to). It's usually due to a wall that's behind you, and it is recommended to " 
-- .. "keep the warning \'enabled\' so you can know when a fishing spot might cause issues."]
-- collapseConfig.popup.disableWarning:reposition()
-- collapseConfig.popup.disableWarning:SetScript("OnClick", function(self)
--     if self:GetChecked() then
--         AngleurBobberScannerUI.disableWarning = true
--     elseif self:GetChecked() == false then
--         AngleurBobberScannerUI.disableWarning = false
--     end
-- end)
--______________________________________________
--______________________________________________





--_______________________________________________________________________
--                       EVENTS AND CALLBACKS
--_______________________________________________________________________
EventRegistry:RegisterFrameEventAndCallback("PLAYER_ENTERING_WORLD", function(ownerID, ...)
    --________________________
    scannerArea:Adjust()
    bScanner_SavedVariables()
    collapseConfig.popup[AngleurBobberScannerUI.method]:SetChecked(true)
    AngleurBobberScanner_CheckMethod(AngleurBobberScannerUI.method)
    collapseConfig.popup.scanWidth:SetupSlider(5, 100, AngleurBobberScannerUI.scanWidth * 100, 5, T["Scan Width"])
    collapseConfig.popup.scanSpeed:SetupSlider(1, 10, AngleurBobberScannerUI.scanSpeed * 10, 1, T["Scan Speed"])
    collapseConfig.popup.startDelay:SetupSlider(0.1, 5, AngleurBobberScannerUI.startDelay, 0.1, T["Start Delay"])
    -- if AngleurBobberScannerUI.disableWarning == true then
    --     collapseConfig.popup.disableWarning:SetChecked(true)
    -- end
end)
EventRegistry:RegisterCallback("Angleur_StopFishing", function()
    if active then
        cameraFrame:stopAll()
    end
    texture:SetAlpha(0.6)
end)
EventRegistry:RegisterCallback("Angleur_StartFishing", function()
    Angleur_BobberScanner_HandleGamepad(true, nil)
    texture:SetAlpha(0.15)
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
local setupZoom
function cameraFrame:stopAll()
    -- local zoomNow = GetCameraZoom()
    -- if setupZoom and zoomNow ~= setupZoom then
    --     print("Angleur Bobber Scanner : WARNING! Camera Zoom changed during scan. "
    --     .. "This can (and will) disrupt success of the bobber scanner, and is likely "
    --     .. "due to a wall or some other game world object behind your character. To fix this, " 
    --     .. "either move to a clearing, or lower the \'Max Camera Distance\' in "
    --     .. "the Game's Options under Options->Gameplay->Controls->Camera."
    --     .. "You can turn this warning off in the Bobber Scanner's Config Menu by clicking the gear icon next to the mouse drop-off box.")
    -- end
    MoveViewRightStop()
    MoveViewLeftStop()
    MoveViewDownStop()
    MoveViewUpStop()
    MoveViewOutStop()
    active = false
    setupZoom = nil
    self:SetScript("OnUpdate", nil)
    self:SetScript("OnEvent", nil)
    timeOutFrame:SetScript("OnUpdate", nil)
end
local mouseoverUnit = false
local function checkCursor(self)
    local changed = SetCursor(nil)
    Angleur_BetaPrint(debugChannel, changed)
    if changed == true then
        cameraFrame:stopAll()
    end
end
function cameraFrame:nextLine(lines, lineChangeTime, columnSweepTime, moveLeft)
    if lines == 0 then 
        print(T["Bobber Scan: Scan unsuccessful. Try changing the \'Elevation\' setting, "
        .. "or the width of the search area in the Scanner menu by clicking the Gear icon next to the mouse drop-off box"])
        self:stopAll()
        CenterCamera()
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
        Angleur_BetaPrint(debugChannel, "moving left")
    else
        Angleur_BetaPrint(debugChannel, "moving right")
    end
end
function cameraFrame:sweep(lines, lineChangeTime, columnSweepTime, moveLeft)
    if moveLeft then
        Angleur_BetaPrint(debugChannel, "starting sweep of line: ", lines, "to the left")
        MoveViewLeftStart(H_SPEED)
        Angleur_SingleDelayer(columnSweepTime, 0, columnSweepTime, self, function()printSweep(moveLeft) end, function()
            MoveViewLeftStart(0)
            self:nextLine(lines, lineChangeTime, columnSweepTime, not moveLeft)
        end)
    else
        Angleur_BetaPrint(debugChannel, "starting sweep of line: ", lines, "to the right")
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
function cameraFrame:setup(lines, verticalTime, horizontalTime, moveLeft, zoomFactor_vOffset)
    local setup_time = horizontalTime
    -- H_SPEED is unchanged for setup, horizontalTimer will be halved instead
    local setup_hSpeed = H_SPEED
    -- Calculate the time for the 'V_OFFSET' distance for V_SPEED 
    local vOffset_time  = (V_OFFSET / V_SPEED)
    -- Adjust vertical offset speed from V_SPEED based on the ratio of vOffset_time / horizontalTime
    -- Then, MULTIPLY BY Zoom Factor - Farther zoom ==> More Downward Movement
    local setup_vSpeed = V_SPEED * (vOffset_time / horizontalTime) * zoomFactor_vOffset
    Angleur_BetaPrint(debugChannel, "setup time is: ", setup_time)
    Angleur_BetaPrint(debugChannel, setup_hSpeed, setup_vSpeed)
    Angleur_BetaPrint(debugChannel, "setup distance: ", setup_hSpeed * horizontalTime/2, setup_vSpeed * horizontalTime/2)
    Angleur_SingleDelayer(15, 0, 1, timeOutFrame, nil, function()
        self:stopAll()
        Angleur_BetaPrint(debugChannel, "Camera Frame: Timed out")
    end)
    MoveViewOutStart(16)
    Angleur_SingleDelayer(WAIT_TIME, 0, WAIT_TIME, cameraFrame, nil, function()
        MoveViewOutStop()
        MoveViewUpStart(setup_vSpeed)
        MoveViewRightStart(setup_hSpeed)
        Angleur_SingleDelayer(horizontalTime/2, 0, 0.1, cameraFrame, nil, function()
            Angleur_BetaPrint(debugChannel, "Setup Phase Over")
            MoveViewRightStart(0)
            MoveViewUpStart(0)
            setupZoom = GetCameraZoom()
            local lineswap_time = verticalTime / lines
            Angleur_BetaPrint(debugChannel, "line time", lineswap_time)
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
        print(T["Mouse needs to be in the indicated area for the scanner to work properly."])
        Angleur_BobberScanner_HandleGamepad(true, T["Angleur Bobber Scanner: Please move the Gamepad Cursor that appears into the inticated box."])
        return
    end
    local gameVersion = Angleur_CheckVersion()
    if gameVersion == 2 then
        -- ResetView(2)
        -- SetView(2)
        CenterCamera()
    elseif gameVersion == 3 then
        -- ResetView(2)
        -- SetView(2)
        CenterCamera()
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
    -- The factor that determines how strong zoom's effect is
    local zoomFactor = (maxZoom + ZFACTOR_STR) / (ZFACTOR_STR + 1)
    local zoomFactor_vOffset = zoomFactor
    local zoomFactor_Horizontal = zoomFactor * 0.8
    -- Calculate the times for V_DIST and H_DIST based on speeds | then DIVIDE BY Zoom Factor
    local vTime = (V_DIST / V_SPEED) * V_DIST_MULTIPLIER
    local hTime = (H_DIST / H_SPEED) / zoomFactor_Horizontal
    Angleur_BetaPrint(debugChannel, "Distances: ", vTime * V_SPEED, hTime * H_SPEED)
    local lines = V_LINES * V_DIST_MULTIPLIER
    active = true
    setupZoom = nil
    Angleur_SetCursorForGamePad(true)
    cameraFrame:setup(lines, vTime, hTime, false, zoomFactor_vOffset)
    scannerArea:Adjust()
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






--_________________________(Commented)____________________________
-- Manual Camera Control Frame & Buttons for testing. DONT DELETE.
--_________________________(Commented)____________________________
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
--_______________________________________________________________
--_______________________________________________________________