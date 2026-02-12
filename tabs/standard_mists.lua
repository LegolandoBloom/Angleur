local T = Angleur_Translate

local debugChannel = 5

local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

-- 'ang' is the angleur namespace
local addonName, ang = ...
ang.mists.standardTab = {}
local mistsStandardTab = ang.mists.standardTab
local mistsToys = ang.mists.toys


local function DropDown_CreateTitle(self, titleText)
    local info = UIDropDownMenu_CreateInfo()
    info.text = titleText
    info.isTitle = true
    UIDropDownMenu_AddButton(info)
end

local function BaitDropDownOnClick(self)
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.baitEnable.dropDown, self:GetID())
    AngleurConfig.chosenBait.dropDownID = self:GetID()
    --AngleurConfig.chosenBait.name = angleurItems.ownedBait[self:GetID()].name --> Changed into the below for localisation
    AngleurConfig.chosenBait.itemID = angleurItems.ownedBait[self:GetID()].itemID
    Angleur_SetSelectedItem(angleurItems.selectedBaitTable, angleurItems.ownedBait, AngleurConfig.chosenBait.itemID)
end

local baitTitleSet = false
local function InitializeDropDownBait(self, level)
    if not baitTitleSet then
        DropDown_CreateTitle(self, T["Bait"])
        baitTitleSet = true
        return
    end
    Angleur_CheckOwnedItems(angleurItems.selectedBaitTable, angleurItems.ownedBait, angleurItems.baitPossibilities)
    Angleur_SetSelectedItem(angleurItems.selectedBaitTable, angleurItems.ownedBait, AngleurConfig.chosenBait.itemID)
    --Contents
    for i, bait in pairs(angleurItems.ownedBait) do
        local info = UIDropDownMenu_CreateInfo()
        info.text = bait.name
        info.value = bait.name
        info.func = BaitDropDownOnClick
        UIDropDownMenu_AddButton(info)
    end
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.baitEnable.dropDown, angleurItems.selectedBaitTable.dropDownID)
end


local function RaftDropDownOnClick(self)
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.raftEnable.dropDown, self:GetID())
    AngleurConfig.chosenRaft.dropDownID = self:GetID()
    --AngleurConfig.chosenRaft.name = angleurToys.ownedRafts[self:GetID()].name --> Changed into the below for localisation
    AngleurConfig.chosenRaft.toyID = angleurToys.ownedRafts[self:GetID()].toyID
    mistsToys:SetSelectedToy(angleurToys.selectedRaftTable, angleurToys.ownedRafts, AngleurConfig.chosenRaft.toyID)
end

local raftTitleSet = false
local function InitializeDropDownRafts(self, level)
    if not raftTitleSet then
        DropDown_CreateTitle(self, T["Rafts"])
        raftTitleSet = true
        return
    end
    --Contents
    for i, rafts in pairs(angleurToys.ownedRafts) do
        local info = UIDropDownMenu_CreateInfo()
        info.text = rafts.name
        info.value = rafts.name
        info.func = RaftDropDownOnClick
        UIDropDownMenu_AddButton(info)
    end
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.raftEnable.dropDown, AngleurConfig.chosenRaft.dropDownID)
end

function mistsStandardTab:ExtraButtons(tab1contents)
    tab1contents.baitEnable.text:SetText(T["Bait"])
    tab1contents.baitEnable.disabledText:SetText(T["Couldn't find any bait \n in your bags, feature disabled"])
    tab1contents.baitEnable.text.tooltip = T["Pick a Bait Item from the ones in your bags, and Angleur will keep it applied!\n\nMake sure you pick one whose level isn't higher than yours."]
    tab1contents.baitEnable.checkbox:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurConfig.baitEnabled = true
            tab1contents.baitEnable.dropDown:Show()
        elseif self:GetChecked() == false then
            AngleurConfig.baitEnabled = false
            tab1contents.baitEnable.dropDown:Hide()
        end
    end)

    UIDropDownMenu_Initialize(tab1contents.baitEnable.dropDown, InitializeDropDownBait)
    UIDropDownMenu_SetWidth(tab1contents.baitEnable.dropDown, 100)
    UIDropDownMenu_SetButtonWidth(tab1contents.baitEnable.dropDown, 124)
    UIDropDownMenu_SetSelectedID(tab1contents.baitEnable.dropDown, 1)
    UIDropDownMenu_JustifyText(tab1contents.baitEnable.dropDown, "LEFT")
    if AngleurConfig.baitEnabled == true then
        tab1contents.baitEnable.checkbox:SetChecked(true)
        tab1contents.baitEnable.dropDown:Show()
    end
    DropDown_CreateTitle(tab1contents.baitEnable.dropDown, T["Bait"])

    if Angleur_CheckVersion() == 2 then
        tab1contents.raftEnable.text:SetText(T["Raft"])
        tab1contents.raftEnable.disabledText:SetText(T["Couldn't find any rafts \n in toybox, feature disabled"])
        tab1contents.raftEnable.text.tooltip = T["Pick a Raft, and Angleur will have you use it when you are in water!\n(Also keep the buff going afterwards)"]
        tab1contents.raftEnable.checkbox:SetScript("OnClick", function(self)
            if self:GetChecked() then
                AngleurConfig.raftEnabled = true
                tab1contents.raftEnable.dropDown:Show()
            elseif self:GetChecked() == false then
                AngleurConfig.raftEnabled = false
                tab1contents.raftEnable.dropDown:Hide()
            end
        end)
        UIDropDownMenu_Initialize(tab1contents.raftEnable.dropDown, InitializeDropDownRafts)
        UIDropDownMenu_SetWidth(tab1contents.raftEnable.dropDown, 100)
        UIDropDownMenu_SetButtonWidth(tab1contents.raftEnable.dropDown, 124)
        UIDropDownMenu_SetSelectedID(tab1contents.raftEnable.dropDown, 1)
        UIDropDownMenu_JustifyText(tab1contents.raftEnable.dropDown, "LEFT")
        if AngleurConfig.raftEnabled == true then
            tab1contents.raftEnable.checkbox:SetChecked(true)
            tab1contents.raftEnable.dropDown:Show()
        end
        DropDown_CreateTitle(tab1contents.raftEnable.dropDown, T["Rafts"])
    end

    
    tab1contents.softInteract.text:SetText(T["Enable Soft Interact"])
    local pictureTooltip = CreateFrame("GameTooltip", "AngleurSoftInteract_PictureTooltip", UIParent, "Legolando_PictureTooltipTemplate_Angleur")
    tab1contents.softInteract.text:SetScript("OnEnter", function()
        pictureTooltip:SetOwner(tab1contents.softInteract.text, "ANCHOR_BOTTOMRIGHT")
        pictureTooltip:AddLine(T["Soft Interact in Classic:"])
        pictureTooltip:AddLine(T["Due to a limitation in Classic, the \'soft interact system\' can sometimes fail to catch the bobber when it lands too far.(Demonstrated in the picture)" 
        .. "\n\nAngleur is designed to provide workarounds for this. Once enabled, please check out the options that appear below."], 1, 1, 1, true)
        pictureTooltip:Show()
        pictureTooltip:PlaceTexture("Interface/AddOns/Angleur/imagesClassic/icontoofar.png", 128, 128, "TOPRIGHT")
    
    end)
    tab1contents.softInteract.text:SetScript("OnLeave", function()
        pictureTooltip:Hide()
    end)
    -- tab1contents.softInteract.disabledText:SetText(T[])
    tab1contents.softInteract.checkbox:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurClassicConfig.softInteract.enabled = true
            tab1contents.softInteract.bobberScanner:Show()
            tab1contents.softInteract.warningSound:Show()
            tab1contents.softInteract.recastWhenOOB:Show()
            if AngleurClassicConfig.softInteract.bobberScanner == true then
                EventRegistry:TriggerEvent("AngleurClassic_ScannerOn")
            end
        elseif self:GetChecked() == false then
            AngleurClassicConfig.softInteract.enabled = false
            Angleur_TempCVarHandler:Release("SoftTargetInteract")
            tab1contents.softInteract.bobberScanner:Hide()
            tab1contents.softInteract.warningSound:Hide()
            tab1contents.softInteract.recastWhenOOB:Hide()
            EventRegistry:TriggerEvent("AngleurClassic_ScannerOff")
        end
    end)
    if AngleurClassicConfig.softInteract.enabled == true then
        tab1contents.softInteract.checkbox:SetChecked(true)
        tab1contents.softInteract.bobberScanner:Show()
        tab1contents.softInteract.warningSound:Show()
        tab1contents.softInteract.recastWhenOOB:Show()
    else
        tab1contents.softInteract.bobberScanner:Hide()
        tab1contents.softInteract.warningSound:Hide()
        tab1contents.softInteract.recastWhenOOB:Hide()
    end

    
    tab1contents.softInteract.bobberScanner.text:SetText(T["Bobber Scanner(EXPERIMENTAL)"])
    tab1contents.softInteract.bobberScanner.text:SetFontObject(SpellFont_Small)
    tab1contents.softInteract.bobberScanner.text.tooltip = T["Manually scans for the bobber by moving the camera in a grid.\n\nDIZZY WARNING:\nDo NOT " 
    .."use this feature if you are sensitive to rapid movement or any form of fast graphical change.\n\n" 
    .."This feature is still in development! With enough good feedback, it can be improved and made much smoother :)"]
    -- tab1contents.softInteract.bobberScanner:greyOut()
    -- tab1contents.softInteract.disabledText:SetText(T[])
    tab1contents.softInteract.bobberScanner.checkbox:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurClassicConfig.softInteract.bobberScanner = true
            AngleurClassicConfig.softInteract.recastWhenOOB = false
            tab1contents.softInteract.recastWhenOOB.checkbox:SetChecked(false)
            EventRegistry:TriggerEvent("AngleurClassic_ScannerOn")
        elseif self:GetChecked() == false then
            AngleurClassicConfig.softInteract.bobberScanner = false
            EventRegistry:TriggerEvent("AngleurClassic_ScannerOff")
        end
    end)
    if AngleurClassicConfig.softInteract.bobberScanner == true then
        tab1contents.softInteract.bobberScanner.checkbox:SetChecked(true)
    end

    tab1contents.softInteract.warningSound.text:SetText(T["Warning Sound"])
    tab1contents.softInteract.warningSound.text:SetFontObject(SpellFont_Small)
    tab1contents.softInteract.warningSound.text.tooltip = T["Plays a warning sound when the bobber lands too far for the soft interact system to capture."]
    -- tab1contents.softInteract.disabledText:SetText(T[])
    tab1contents.softInteract.warningSound.checkbox:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurClassicConfig.softInteract.warningSound = true
        elseif self:GetChecked() == false then
            AngleurClassicConfig.softInteract.warningSound = false
        end
    end)
    if AngleurClassicConfig.softInteract.warningSound == true then
        tab1contents.softInteract.warningSound.checkbox:SetChecked(true)
    end

    tab1contents.softInteract.recastWhenOOB.text:SetText(T["Recast When OOB"])
    tab1contents.softInteract.recastWhenOOB.text:SetFontObject(SpellFont_Small)
    tab1contents.softInteract.recastWhenOOB.text.tooltip = T["Sets the OneKey/Double-Click to Recast when the bobber lands too far for the soft interact system to capture."]
    -- tab1contents.softInteract.disabledText:SetText(T[])
    tab1contents.softInteract.recastWhenOOB.checkbox:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurClassicConfig.softInteract.recastWhenOOB = true
            AngleurClassicConfig.softInteract.bobberScanner = false
            EventRegistry:TriggerEvent("AngleurClassic_ScannerOff")
            tab1contents.softInteract.bobberScanner.checkbox:SetChecked(false)
        elseif self:GetChecked() == false then
            AngleurClassicConfig.softInteract.recastWhenOOB = false
        end
    end)
    if AngleurClassicConfig.softInteract.recastWhenOOB == true then
        tab1contents.softInteract.recastWhenOOB.checkbox:SetChecked(true)
    end

end