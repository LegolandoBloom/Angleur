local T = Angleur_Translate
local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

local retail = AngleurStandardPanelRetail
local cata = AngleurStandardPanelCata

function Angleur_SetTab1(self)
    local gameVersion = Angleur_CheckVersion()
    if gameVersion == 1 then
        retail:ExtraButtons(self)
    elseif gameVersion == 2 or gameVersion == 3 then
        cata:ExtraButtons(self)
    end

    self.ultraFocus.title:SetText(T["Ultra Focus:"])
    self.ultraFocus.audio.text:SetText(T["Audio"])
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

    self.ultraFocus.autoLoot.text:SetText(T["Temp. Auto Loot "])
    self.ultraFocus.autoLoot.text:SetFontObject(SpellFont_Small)
    self.ultraFocus.autoLoot.text:ClearAllPoints()
    self.ultraFocus.autoLoot.text:SetPoint("LEFT", self.ultraFocus.autoLoot, "RIGHT")
    self.ultraFocus.autoLoot.text.tooltip = T["If checked, Angleur will temporarily turn on " .. colorYello:WrapTextInColorCode("Auto-Loot") .. ", then turn it back off after you reel.\n\n" 
    .. colorGrae:WrapTextInColorCode("If you have ") .. colorYello:WrapTextInColorCode("Auto-Loot ") .. colorGrae:WrapTextInColorCode("enabled anyway, this feature will be disabled automatically.")]
    self.ultraFocus.autoLoot.disabledText:SetJustifyH("LEFT")
    self.ultraFocus.autoLoot.disabledText:SetWordWrap(true)
    self.ultraFocus.autoLoot.disabledText:SetText(T["(Already on)"])
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


    self.fishingMethod.menuTitle:SetText(T["FISHING METHOD:"])
    if AngleurConfig.angleurKey then 
        self.fishingMethod.oneKey.contents.angleurKey:SetText(AngleurConfig.angleurKey)
    elseif AngleurTutorial.part > 1 then
        self.fishingMethod.oneKey.contents.angleurKey.warning:Show()
    end

    local angKey = self.fishingMethod.oneKey.contents.angleurKey
    angKey.menuTitle:SetText(T["One Key"])
    angKey.disclaimer:SetText(T["The next key you press\nwill be set as Angleur Key"])
    angKey.warning:SetText(T["Please set a keybind\nto use the One Key\nishing Method by\nusing the the\nbutton above"])
    self.fishingMethod.oneKey.icon:SetTexture("Interface/AddOns/Angleur/images/onekeyicon.png")
    self.fishingMethod.doubleClick.icon:SetTexture("Interface/AddOns/Angleur/images/doubleclickicon.png")

    UIDropDownMenu_Initialize(self.fishingMethod.doubleClick.contents.dropDownMenu, Angleur_InitializeDropDownDoubleClickSelection)
    UIDropDownMenu_SetWidth(self.fishingMethod.doubleClick.contents.dropDownMenu, 100)
    UIDropDownMenu_SetButtonWidth(self.fishingMethod.doubleClick.contents.dropDownMenu, 124)
    UIDropDownMenu_SetSelectedID(self.fishingMethod.doubleClick.contents.dropDownMenu, 1)
    UIDropDownMenu_JustifyText(self.fishingMethod.doubleClick.contents.dropDownMenu, "LEFT")
    
    self.fishingMethod.doubleClick.contents.dropDownMenu.menuTitle:SetText(T["Double Click"])
    Angleur_FishingMethodSetSelected(self.fishingMethod)

    self.returnButton:SetText(T["Return\nAngleur Visual"])
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
        print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "If you experience stiffness with the Double-Click, do a " .. colorYello:WrapTextInColorCode("/reload") .. " to fix it."])
    end
end

function Angleur_DoubleClickSelectionDropDownOnClick(self)
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.fishingMethod.doubleClick.contents.dropDownMenu, self:GetID())
    AngleurConfig.doubleClickChosenID = self:GetID()
end

function Angleur_InitializeDropDownDoubleClickSelection(self, level)
    local info = UIDropDownMenu_CreateInfo()
    info.text = T["Preferred Mouse Button"]
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
    info.text = T["Right Click"]
    info.value = T["Right Click"]
    info.func = Angleur_DoubleClickSelectionDropDownOnClick
    UIDropDownMenu_AddButton(info)
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.fishingMethod.doubleClick.contents.dropDownMenu, AngleurConfig.doubleClickChosenID)
end