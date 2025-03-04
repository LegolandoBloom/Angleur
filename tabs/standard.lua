function Angleur_SetTab1(self)
    local colorYello = CreateColor(1.0, 0.82, 0.0)
    local colorGrae = CreateColor(0.85, 0.85, 0.85)
    local colorBlu = CreateColor(0.61, 0.85, 0.92)
    self.raftEnable.text:SetText("Raft")
    self.raftEnable.disabledText:SetText("Couldn't find any rafts \n in toybox, feature disabled")
    self.raftEnable:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurConfig.raftEnabled = true
            self.dropDown:Show()
        elseif self:GetChecked() == false then
            AngleurConfig.raftEnabled = false
            self.dropDown:Hide()
        end
    end)
    UIDropDownMenu_Initialize(self.raftEnable.dropDown, Angleur_InitializeDropDownRafts)
    UIDropDownMenu_SetWidth(self.raftEnable.dropDown, 100)
    UIDropDownMenu_SetButtonWidth(self.raftEnable.dropDown, 124)
    UIDropDownMenu_SetSelectedID(self.raftEnable.dropDown, 1)
    UIDropDownMenu_JustifyText(self.raftEnable.dropDown, "LEFT")
    if AngleurConfig.raftEnabled == true then
        self.raftEnable:SetChecked(true)
        self.raftEnable.dropDown:Show()
    end
    Angleur_DropDown_CreateTitle(self.raftEnable.dropDown, "Rafts")
    
    self.oversizedBobberEnable.text:SetText("Oversized Bobber")
    self.oversizedBobberEnable.disabledText:SetText("Couldn't find \n Oversized Bobber in \n toybox, feature disabled")
    self.oversizedBobberEnable:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurConfig.oversizedEnabled = true
        elseif self:GetChecked() == false then
            AngleurConfig.oversizedEnabled = false
        end
    end)
    if AngleurConfig.oversizedEnabled == true then
        self.oversizedBobberEnable:SetChecked(true)
    end
    
    self.crateBobberEnable.text:SetText("Crate of Bobbers")
    self.crateBobberEnable.disabledText:SetText("Couldn't find \n any Crate Bobbers \n in toybox, feature disabled")
    self.crateBobberEnable:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurConfig.crateEnabled = true
            self.dropDown:Show()
        elseif self:GetChecked() == false then
            AngleurConfig.crateEnabled = false
            self.dropDown:Hide()
        end
    end)
    if AngleurConfig.crateEnabled == true then
        self.crateBobberEnable:SetChecked(true)
    end
    UIDropDownMenu_Initialize(self.crateBobberEnable.dropDown, Angleur_InitializeDropDownCrateBobbers)
    UIDropDownMenu_SetWidth(self.crateBobberEnable.dropDown, 100)
    UIDropDownMenu_SetButtonWidth(self.crateBobberEnable.dropDown, 124)
    UIDropDownMenu_SetSelectedID(self.crateBobberEnable.dropDown, 1)
    UIDropDownMenu_JustifyText(self.crateBobberEnable.dropDown, "LEFT")
    if AngleurConfig.crateEnabled == true then
        self.crateBobberEnable:SetChecked(true)
        self.crateBobberEnable.dropDown:Show()
    end
    Angleur_DropDown_CreateTitle(self.crateBobberEnable.dropDown, "Crate Bobbers")

    self.ultraFocus.audio.text:SetText("Audio")
    self.ultraFocus.audio.text:SetFontObject(SpellFont_Small)
    self.ultraFocus.audio.text:ClearAllPoints()
    self.ultraFocus.audio.text:SetPoint("LEFT", self.ultraFocus.audio, "RIGHT")
    self.ultraFocus.audio:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurConfig.ultraFocusAudioEnabled = true
            if AngleurCharacter.sleeping == false then
                Angleur_UltraFocusBackground(true)
            end
        elseif self:GetChecked() == false then
            AngleurConfig.ultraFocusAudioEnabled = false
            Angleur_UltraFocusAudio(false)
            Angleur_UltraFocusBackground(false)
        end
    end)
    if AngleurConfig.ultraFocusAudioEnabled == true then
        self.ultraFocus.audio:SetChecked(true)
    end

    self.ultraFocus.autoLoot.text:SetText("Temp. Auto Loot ")
    self.ultraFocus.autoLoot.text:SetFontObject(SpellFont_Small)
    self.ultraFocus.autoLoot.text:ClearAllPoints()
    self.ultraFocus.autoLoot.text:SetPoint("LEFT", self.ultraFocus.autoLoot, "RIGHT")
    self.ultraFocus.autoLoot.text.tooltip = "If checked, Angleur will temporarily turn on " .. colorYello:WrapTextInColorCode("Auto-Loot") .. ", then turn it back off after you reel.\n\n" 
    .. colorGrae:WrapTextInColorCode("If you have ") .. colorYello:WrapTextInColorCode("Auto-Loot ") .. colorGrae:WrapTextInColorCode("enabled anyway, this feature will be disabled automatically.")
    self.ultraFocus.autoLoot.disabledText:SetJustifyH("LEFT")
    self.ultraFocus.autoLoot.disabledText:SetWordWrap(true)
    self.ultraFocus.autoLoot.disabledText:SetText("(Already on)")
    self.ultraFocus.autoLoot.disabledText:ClearAllPoints()
    self.ultraFocus.autoLoot.disabledText:SetPoint("LEFT", self.ultraFocus.autoLoot.text, "RIGHT")
    self.ultraFocus.autoLoot:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurConfig.ultraFocusAutoLootEnabled = true
        elseif self:GetChecked() == false then
            AngleurConfig.ultraFocusAutoLootEnabled = false
        end
    end)
    if AngleurConfig.ultraFocusAutoLootEnabled == true then
        self.ultraFocus.autoLoot:SetChecked(true)
    end

    
    if AngleurConfig.angleurKey then 
        self.fishingMethod.oneKey.contents.angleurKey:SetText(AngleurConfig.angleurKey)
    elseif AngleurTutorial.part > 1 then
        self.fishingMethod.oneKey.contents.angleurKey.warning:Show()
    end
    
    self.fishingMethod.oneKey.icon:SetTexture("Interface/AddOns/Angleur/images/onekeyicon.png")
    self.fishingMethod.doubleClick.icon:SetTexture("Interface/AddOns/Angleur/images/doubleclickicon.png")

    UIDropDownMenu_Initialize(self.fishingMethod.doubleClick.contents.dropDownMenu, Angleur_InitializeDropDownDoubleClickSelection)
    UIDropDownMenu_SetWidth(self.fishingMethod.doubleClick.contents.dropDownMenu, 100)
    UIDropDownMenu_SetButtonWidth(self.fishingMethod.doubleClick.contents.dropDownMenu, 124)
    UIDropDownMenu_SetSelectedID(self.fishingMethod.doubleClick.contents.dropDownMenu, 1)
    UIDropDownMenu_JustifyText(self.fishingMethod.doubleClick.contents.dropDownMenu, "LEFT")
    

    Angleur_FishingMethodSetSelected(self.fishingMethod)

    --[[
        local newFeatureFrame = CreateFrame("Frame", "Angleur_NewFeatureFrame", self.ultraFocus.offInteract)
        newFeatureFrame:SetPoint("RIGHT", self.ultraFocus.offInteract, "LEFT", 7, 0)
        newFeatureFrame:SetSize(48, 32)
        --newFeatureFrame:Raise()
        local newFeatureTexture = newFeatureFrame:CreateTexture("$parent_NewFeatureTexture", "ARTWORK", nil, 1)
        newFeatureTexture:SetPoint("CENTER")
        newFeatureTexture:SetSize(48, 32)
        newFeatureTexture:SetTexture("Interface/AddOns/Angleur/images/newfeature.png")
    ]]--
end

function Angleur_FishingMethodSetSelected(self)
    local methods = {self:GetChildren()}
    for i, button in pairs(methods) do
        if AngleurConfig.chosenMethod == button:GetParentKey() then
            button.selectedTexture:Show()
            button.contents:Show()
        else
            button.selectedTexture:Hide()
            button.contents:Hide()
        end
    end
end

local stiffShownOnce = false
function Angleur_FishingMethodOnClick(self)
    PlaySoundFile(1020201)
    AngleurConfig.chosenMethod = self:GetParentKey()
    Angleur_FishingMethodSetSelected(self:GetParent())
    if AngleurConfig.chosenMethod == "doubleClick" then
        if stiffShownOnce then return end
        stiffShownOnce = true
        local color1 = CreateColor(1.0, 0.82, 0.0)
        local color2 = CreateColor(0.61, 0.85, 0.92)
        print(color2:WrapTextInColorCode("Angleur: ") .. "If you experience stiffness with the Double-Click, do a " .. color1:WrapTextInColorCode("/reload") .. " to fix it.")
    end
end

function Angleur_RaftDropDownOnClick(self)
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.raftEnable.dropDown, self:GetID())
    AngleurConfig.chosenRaft.dropDownID = self:GetID()
    --AngleurConfig.chosenRaft.name = angleurToys.ownedRafts[self:GetID()].name --> Changed into the below for localisation
    AngleurConfig.chosenRaft.toyID = angleurToys.ownedRafts[self:GetID()].toyID
    Angleur_SetSelectedToy(angleurToys.selectedRaftTable, angleurToys.ownedRafts, AngleurConfig.chosenRaft.toyID)
end

function Angleur_DropDown_CreateTitle(self, titleText)
    local info = UIDropDownMenu_CreateInfo()
    info.text = titleText
    info.isTitle = true
    UIDropDownMenu_AddButton(info)
end

local raftTitleSet = false
function Angleur_InitializeDropDownRafts(self, level)
    if not raftTitleSet then
        Angleur_DropDown_CreateTitle(self, "Rafts")
        raftTitleSet = true
        return
    end
    --Contents
    for i, rafts in pairs(angleurToys.ownedRafts) do
        info = UIDropDownMenu_CreateInfo()
        info.text = rafts.name
        info.value = rafts.name
        info.func = Angleur_RaftDropDownOnClick
        UIDropDownMenu_AddButton(info)
    end
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.raftEnable.dropDown, AngleurConfig.chosenRaft.dropDownID)
end

function Angleur_CrateDropDownOnClick(self)
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.crateBobberEnable.dropDown, self:GetID())
    AngleurConfig.chosenCrateBobber.dropDownID = self:GetID()
    if self.value == "Random Bobber" then
        AngleurConfig.chosenCrateBobber.toyID = 0
        AngleurConfig.chosenCrateBobber.name = "Random Bobber"
        angleurToys.selectedCrateBobberTable.name = 0
        angleurToys.selectedCrateBobberTable.icon = 0
        angleurToys.selectedCrateBobberTable.toyID = 0
        angleurToys.selectedCrateBobberTable.spellID = 0
        angleurToys.selectedCrateBobberTable.hasToy = false
        angleurToys.selectedCrateBobberTable.loaded = false
        Angleur_PickRandomBobber()
    else
        AngleurConfig.chosenCrateBobber.toyID = angleurToys.ownedCrateBobbers[self:GetID()].toyID
        AngleurConfig.chosenCrateBobber.name = self:GetText()
        Angleur_SetSelectedToy(angleurToys.selectedCrateBobberTable, angleurToys.ownedCrateBobbers, AngleurConfig.chosenCrateBobber.toyID)
    end 
    --AngleurConfig.chosenCrateBobber.name = angleurToys.ownedCrateBobbers[self:GetID()].name --> Changed into the below for localisation
end


local crateTitleSet = false
function Angleur_InitializeDropDownCrateBobbers(self, level)
    if not crateTitleSet then
        Angleur_DropDown_CreateTitle(self, "Crate Bobbers")
        crateTitleSet = true
        return
    end
    --Contents
    for i, crateBobbers in pairs(angleurToys.ownedCrateBobbers) do
        local info = UIDropDownMenu_CreateInfo()
        info.text = crateBobbers.name
        info.value = crateBobbers.name
        info.func = Angleur_CrateDropDownOnClick
        UIDropDownMenu_AddButton(info)
    end
    local info = UIDropDownMenu_CreateInfo()
    info.text = "Random Bobber"
    info.value = "Random Bobber"
    info.func = Angleur_CrateDropDownOnClick
    UIDropDownMenu_AddButton(info)
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.crateBobberEnable.dropDown, AngleurConfig.chosenCrateBobber.dropDownID)
end

function Angleur_DoubleClickSelectionDropDownOnClick(self)
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.fishingMethod.doubleClick.contents.dropDownMenu, self:GetID())
    AngleurConfig.doubleClickChosenID = self:GetID()
end

function Angleur_InitializeDropDownDoubleClickSelection(self, level)
    local info = UIDropDownMenu_CreateInfo()
    info.text = "Preferred Mouse Button"
    info.isTitle = true
    UIDropDownMenu_AddButton(info)
    --[[
    info = UIDropDownMenu_CreateInfo()
    info.text = "Left Click"
    info.value = "Left Click"
    info.func = Angleur_DoubleClickSelectionDropDownOnClick
    UIDropDownMenu_AddButton(info)
    ]]--
    info = UIDropDownMenu_CreateInfo()
    info.text = "Right Click"
    info.value = "Right Click"
    info.func = Angleur_DoubleClickSelectionDropDownOnClick
    UIDropDownMenu_AddButton(info)
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.fishingMethod.doubleClick.contents.dropDownMenu, AngleurConfig.doubleClickChosenID)
end