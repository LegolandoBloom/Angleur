local T = Angleur_Translate

local debugChannel = 5

-- 'ang' is the angleur namespace
local addonName, ang = ...
ang.retail.standardTab = {}
local retailStandardTab = ang.retail.standardTab
local retailToys = ang.retail.toys

local function DropDown_CreateTitle(self, titleText)
    local info = UIDropDownMenu_CreateInfo()
    info.text = titleText
    info.isTitle = true
    UIDropDownMenu_AddButton(info)
end

local function RaftDropDownOnClick(self)
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.raftEnable.dropDown, self:GetID())
    AngleurConfig.chosenRaft.dropDownID = self:GetID()
    if self.value == T["Random Raft"] then
        AngleurConfig.chosenRaft.toyID = 0
        AngleurConfig.chosenRaft.name = T["Random Raft"]
        angleurToys.selectedRaftTable.name = 0
        angleurToys.selectedRaftTable.icon = 0
        angleurToys.selectedRaftTable.toyID = 0
        angleurToys.selectedRaftTable.spellID = 0
        angleurToys.selectedRaftTable.hasToy = false
        angleurToys.selectedRaftTable.loaded = false
        retailToys:PickRandomToy("raft", angleurToys.ownedRafts, angleurToys.selectedRaftTable, true)
    else
        AngleurConfig.chosenRaft.toyID = angleurToys.ownedRafts[self:GetID()].toyID
        AngleurConfig.chosenRaft.name = self:GetText()
        
        retailToys:SetSelectedToy(angleurToys.selectedRaftTable, angleurToys.ownedRafts, AngleurConfig.chosenRaft.toyID)
    end 
end

local function CrateDropDownOnClick(self)
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.crateBobberEnable.dropDown, self:GetID())
    AngleurConfig.chosenCrateBobber.dropDownID = self:GetID()
    if self.value == T["Random Bobber"] then
        AngleurConfig.chosenCrateBobber.toyID = 0
        AngleurConfig.chosenCrateBobber.name = T["Random Bobber"]
        angleurToys.selectedCrateBobberTable.name = 0
        angleurToys.selectedCrateBobberTable.icon = 0
        angleurToys.selectedCrateBobberTable.toyID = 0
        angleurToys.selectedCrateBobberTable.spellID = 0
        angleurToys.selectedCrateBobberTable.hasToy = false
        angleurToys.selectedCrateBobberTable.loaded = false
        retailToys:PickRandomToy("bobber", angleurToys.ownedCrateBobbers, angleurToys.selectedCrateBobberTable, true)
    else
        AngleurConfig.chosenCrateBobber.toyID = angleurToys.ownedCrateBobbers[self:GetID()].toyID
        AngleurConfig.chosenCrateBobber.name = self:GetText()
        
        retailToys:SetSelectedToy(angleurToys.selectedCrateBobberTable, angleurToys.ownedCrateBobbers, AngleurConfig.chosenCrateBobber.toyID)
    end 
    --AngleurConfig.chosenCrateBobber.name = angleurToys.ownedCrateBobbers[self:GetID()].name --> Changed into the below for localisation
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
    local info = UIDropDownMenu_CreateInfo()
    info.text = T["Random Raft"]
    info.value = T["Random Raft"]
    info.func = RaftDropDownOnClick
    UIDropDownMenu_AddButton(info)
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.raftEnable.dropDown, AngleurConfig.chosenRaft.dropDownID)
end

local crateTitleSet = false
local function InitializeDropDownCrateBobbers(self, level)
    if not crateTitleSet then
        DropDown_CreateTitle(self, T["Crate Bobbers"])
        crateTitleSet = true
        return
    end
    --Contents
    for i, crateBobbers in pairs(angleurToys.ownedCrateBobbers) do
        local info = UIDropDownMenu_CreateInfo()
        info.text = crateBobbers.name
        info.value = crateBobbers.name
        info.func = CrateDropDownOnClick
        UIDropDownMenu_AddButton(info)
    end
    local info = UIDropDownMenu_CreateInfo()
    info.text = T["Random Bobber"]
    info.value = T["Random Bobber"]
    info.func = CrateDropDownOnClick
    UIDropDownMenu_AddButton(info)
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.crateBobberEnable.dropDown, AngleurConfig.chosenCrateBobber.dropDownID)
end

function retailStandardTab:ExtraButtons(tab1contents)
    tab1contents.raftEnable.text:SetText(T["Raft"])
    tab1contents.raftEnable.disabledText:SetText(T["Couldn't find any rafts \n in toybox, feature disabled"])
    tab1contents.raftEnable.text.tooltip = T["Pick a Raft, and Angleur will have you use it when you are in water!\n(Also keep the buff going afterwards)\n\n" 
    .. "Pick \'Random Raft\' to get a different one every time!"]
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
    
    tab1contents.oversizedBobberEnable.text:SetText(T["Oversized Bobber"])
    tab1contents.oversizedBobberEnable.disabledText:SetText(T["Couldn't find \n Oversized Bobber in \n toybox, feature disabled"])
    tab1contents.oversizedBobberEnable.text.tooltip = T["If checked, Angleur will have you keep \'Reusable Oversized Bobber\' applied."]
    tab1contents.oversizedBobberEnable.checkbox:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurConfig.oversizedEnabled = true
        elseif self:GetChecked() == false then
            AngleurConfig.oversizedEnabled = false
        end
    end)
    if AngleurConfig.oversizedEnabled == true then
        tab1contents.oversizedBobberEnable.checkbox:SetChecked(true)
    end
    
    tab1contents.crateBobberEnable.text:SetText(T["Crate of Bobbers"])
    tab1contents.crateBobberEnable.disabledText:SetText(T["Couldn't find \n any Crate Bobbers \n in toybox, feature disabled"])
    tab1contents.crateBobberEnable.text.tooltip = T["Pick a Bobber from the Crate of Bobbers, and Angleur will have you keep it applied!\n\n" 
    .. "Pick \'Random Bobber\' to get a different one every time!"]
    tab1contents.crateBobberEnable.checkbox:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurConfig.crateEnabled = true
            tab1contents.crateBobberEnable.dropDown:Show()
        elseif self:GetChecked() == false then
            AngleurConfig.crateEnabled = false
            tab1contents.crateBobberEnable.dropDown:Hide()
        end
    end)
    if AngleurConfig.crateEnabled == true then
        tab1contents.crateBobberEnable.checkbox:SetChecked(true)
    end
    UIDropDownMenu_Initialize(tab1contents.crateBobberEnable.dropDown, InitializeDropDownCrateBobbers)
    UIDropDownMenu_SetWidth(tab1contents.crateBobberEnable.dropDown, 100)
    UIDropDownMenu_SetButtonWidth(tab1contents.crateBobberEnable.dropDown, 124)
    UIDropDownMenu_SetSelectedID(tab1contents.crateBobberEnable.dropDown, 1)
    UIDropDownMenu_JustifyText(tab1contents.crateBobberEnable.dropDown, "LEFT")
    if AngleurConfig.crateEnabled == true then
        tab1contents.crateBobberEnable.checkbox:SetChecked(true)
        tab1contents.crateBobberEnable.dropDown:Show()
    end
    DropDown_CreateTitle(tab1contents.crateBobberEnable.dropDown, T["Crate Bobbers"])
end
