-- |FOREVER Bobber Scanner Removal|
-- COPIED OFF OF: standard_mists -> then removed softInteract parts

local T = Angleur_Translate

local debugChannel = 5

local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

-- 'ang' is the angleur namespace
local addonName, ang = ...
local gameVersion = ang.gameVersion
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

    if gameVersion == 2 then
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

end