local T = Angleur_Translate

local debugChannel = 5

local DEFAULT_MASTER = 1
local DEFAULT_SFX = 1
local DEFAULT_MUSIC = 0
local DEFAULT_DIALOG = 0
local DEFAULT_AMBIENCE = 0

local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

-- 'ang' is the angleur namespace
local addonName, ang = ...
local retailStandardTab = ang.retail.standardTab
local mistsStandardTab = ang.mists.standardTab
local mistsToys = ang.mists.toys
local retailToys = ang.retail.toys

-- <Button name="$parent_Defaults" parentKey="defaults" inherits="GameMenuButtonTemplate">
--     <Size x="72" y="42"/>
--     <Anchors>
--         <Anchor point="BOTTOMRIGHT" relativeTo="$parent" relativePoint="BOTTOMRIGHT" x="-15" y="65"/>
--     </Anchors>
-- </Button>

local function setupAudio(self)
    local audioConfig = CreateFrame("Button", "Angleur_UltraFocusAudio_CollapseConfig", self.ultraFocus.audio.checkbox, "Legolando_CollapseConfigTemplate_Angleur")
    audioConfig:SetPoint("LEFT", self.ultraFocus.audio.text, "RIGHT")
    audioConfig.icon:SetTexture("Interface/AddOns/Angleur/images/audiooptions.png")
    audioConfig.tooltip= T["Adjust Audio Levels"]
    audioConfig.popup:SetSize(270, 345)
    audioConfig.popup:AdjustPointsOffset(-5, 5)
    audioConfig.popup.title:SetText(T["Ultra Focus: Audio Settings"])
    audioConfig:Hide()

    local masterSlider = CreateFrame("Frame", "Angleur_UltraFocusAudio_MasterSlider", audioConfig.popup, "SliderAndEditControlTemplate")
    masterSlider:SetScale(1.1)
    masterSlider:SetPoint("TOPLEFT", audioConfig.popup, "TOPLEFT", 20, -38)
    masterSlider.ValueBox:SetNumericFullRange()
    masterSlider:SetupSlider(0, 100, AngleurAudio.ultraFocusMaster * 100, 1, colorYello:WrapTextInColorCode(T["Master Volume"]))
    masterSlider:SetCallback(function(value, isUserInput)
        AngleurAudio.ultraFocusMaster = value/100
        Angleur_TempCVars["Sound_MasterVolume"].setTo = AngleurAudio.ultraFocusMaster
    end)

    local musicSlider = CreateFrame("Frame", "Angleur_UltraFocusAudio_MusicSlider", audioConfig.popup, "SliderAndEditControlTemplate")
    musicSlider:SetScale(0.9)
    musicSlider:SetPoint("TOPLEFT", audioConfig.popup, "TOPLEFT", 34, -97)
    musicSlider.ValueBox:SetNumericFullRange()
    musicSlider:SetupSlider(0, 100, AngleurAudio.ultraFocusMusic * 100, 1, colorYello:WrapTextInColorCode(T["Music Volume"]))
    musicSlider:SetCallback(function(value, isUserInput)
        AngleurAudio.ultraFocusMusic = value/100
        Angleur_TempCVars["Sound_MusicVolume"].setTo = AngleurAudio.ultraFocusMusic
    end)

    local sfxSlider = CreateFrame("Frame", "Angleur_UltraFocusAudio_SFXSlider", audioConfig.popup, "SliderAndEditControlTemplate")
    sfxSlider:SetPoint("TOPLEFT", audioConfig.popup, "TOPLEFT", 34, -138)
    sfxSlider:SetScale(0.9)
    sfxSlider.ValueBox:SetNumericFullRange()
    sfxSlider:SetupSlider(0, 100, AngleurAudio.ultraFocusSFX * 100, 1, colorYello:WrapTextInColorCode(T["Effects Volume"]))
    sfxSlider:SetCallback(function(value, isUserInput)
        AngleurAudio.ultraFocusSFX = value/100
        Angleur_TempCVars["Sound_SFXVolume"].setTo = AngleurAudio.ultraFocusSFX
    end)

    local ambienceSlider = CreateFrame("Frame", "Angleur_UltraFocusAudio_AmbienceSlider", audioConfig.popup, "SliderAndEditControlTemplate")
    ambienceSlider:SetScale(0.9)
    ambienceSlider:SetPoint("TOPLEFT", audioConfig.popup, "TOPLEFT", 34, -179)
    ambienceSlider.ValueBox:SetNumericFullRange()
    ambienceSlider:SetupSlider(0, 100, AngleurAudio.ultraFocusAmbience * 100, 1, colorYello:WrapTextInColorCode(T["Ambience Volume"]))
    ambienceSlider:SetCallback(function(value, isUserInput)
        AngleurAudio.ultraFocusAmbience = value/100
        Angleur_TempCVars["Sound_AmbienceVolume"].setTo = AngleurAudio.ultraFocusAmbience
    end)

    local dialogSlider = CreateFrame("Frame", "Angleur_UltraFocusAudio_DialogSlider", audioConfig.popup, "SliderAndEditControlTemplate")
    dialogSlider:SetScale(0.9)
    dialogSlider:SetPoint("TOPLEFT", audioConfig.popup, "TOPLEFT", 34, -220)
    dialogSlider.ValueBox:SetNumericFullRange()
    dialogSlider:SetupSlider(0, 100, AngleurAudio.ultraFocusDialog * 100, 1, colorYello:WrapTextInColorCode(T["Dialog Volume"]))
    dialogSlider:SetCallback(function(value, isUserInput)
        AngleurAudio.ultraFocusDialog = value/100
        Angleur_TempCVars["Sound_DialogVolume"].setTo = AngleurAudio.ultraFocusDialog
    end)


    local audioCheckboxes = CreateFrame("Frame", "Angleur_UltraFocusAudio_Checkboxes", audioConfig.popup, "Legolando_CheckboxesTemplate_Angleur")
    audioCheckboxes:SetPoint("TOPLEFT", audioConfig.popup, "TOPLEFT", 20, -255)
    audioCheckboxes.savedVarTable = AngleurAudio.checkboxes

    local backgroundToggle = CreateFrame("CheckButton", "Angleur_UltraFocusAudio_ToggleBackground", audioCheckboxes, "Legolando_CheckboxFrameTemplate_Angleur")
    backgroundToggle:SetPoint("TOPLEFT", audioCheckboxes, "TOPLEFT")
    backgroundToggle.text:SetText(T["Toggle Background Audio"])
    backgroundToggle.tooltip = T["If enabled, Angleur will turn on \"Sound in the Background\" when awake, and restore it to its previous value when sleeping." 
    .. "\n\nOnly disable if you NEVER want background sound to be on, or there is an error due to a clash with another addon."]
    backgroundToggle.reference = "toggleBG"
    backgroundToggle.onClickCallback = function(self, checked) 
        if checked == true then
            if AngleurCharacter.sleeping == false and AngleurConfig.ultraFocusAudioEnabled == true then
                Angleur_TempCVarHandler:Set("Sound_EnableSoundWhenGameIsInBG")
            end
        elseif checked == false then
            Angleur_TempCVarHandler:Release("Sound_EnableSoundWhenGameIsInBG")       
        end
    end
    audioCheckboxes:Update()

    local defaults = CreateFrame("Button", "Angleur_UltraFocusAudio_Defaults", audioConfig.popup, "GameMenuButtonTemplate")
    defaults:SetSize(120, 42)
    defaults:SetPoint("BOTTOMRIGHT", audioConfig.popup, "BOTTOMRIGHT", -12, 10)
    defaults.Text:SetFontObject("Game12Font_o1")
    defaults.Text:SetText(colorYello:WrapTextInColorCode(T["Defaults\n(Recommended)"]))
    defaults:SetScript("OnClick", function()
        AngleurAudio.ultraFocusMaster = DEFAULT_MASTER
        masterSlider:SetValue(DEFAULT_MASTER * 100)
        Angleur_TempCVars["Sound_MasterVolume"].setTo = AngleurAudio.ultraFocusMaster

        AngleurAudio.ultraFocusMusic = DEFAULT_MUSIC
        musicSlider:SetValue(DEFAULT_MUSIC * 100)
        Angleur_TempCVars["Sound_MusicVolume"].setTo = AngleurAudio.ultraFocusMusic

        AngleurAudio.ultraFocusSFX = DEFAULT_SFX
        sfxSlider:SetValue(DEFAULT_SFX * 100)
        Angleur_TempCVars["Sound_SFXVolume"].setTo = AngleurAudio.ultraFocusSFX

        AngleurAudio.ultraFocusAmbience = DEFAULT_AMBIENCE
        ambienceSlider:SetValue(DEFAULT_AMBIENCE * 100)
        Angleur_TempCVars["Sound_AmbienceVolume"].setTo = AngleurAudio.ultraFocusAmbience

        AngleurAudio.ultraFocusDialog = DEFAULT_DIALOG
        dialogSlider:SetValue(DEFAULT_DIALOG * 100)
        Angleur_TempCVars["Sound_DialogVolume"].setTo = AngleurAudio.ultraFocusDialog


        backgroundToggle.checkbox:SetChecked(true)
        AngleurAudio.checkboxes.toggleBG = true
        if AngleurCharacter.sleeping == false and AngleurConfig.ultraFocusAudioEnabled == true then
            Angleur_TempCVarHandler:Set("Sound_EnableSoundWhenGameIsInBG")
        end
        print(T["Ultra Focus: Default audio settings restored"])
    end)

    self.ultraFocus.title:SetText(T["Ultra Focus:"])
    self.ultraFocus.title:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT", 3, -3)
        GameTooltip:AddLine(colorBlu:WrapTextInColorCode(self:GetText()))
        GameTooltip:AddLine(T["Let Angleur take care of Audio & Loot settings for you."], 1, 1, 1, 0)
        GameTooltip:Show()
    end)
    self.ultraFocus.title:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
    self.ultraFocus.title:SetText(T["Ultra Focus:"])
    self.ultraFocus.audio.text:SetText(T["Audio"])
    self.ultraFocus.audio.text:SetFontObject(SpellFont_Small)
    self.ultraFocus.audio.checkbox:ClearAllPoints()
    self.ultraFocus.audio.checkbox:SetPoint("TOPLEFT", self.ultraFocus.audio, "TOPLEFT")
    self.ultraFocus.audio.text:ClearAllPoints()
    self.ultraFocus.audio.text:SetPoint("LEFT", self.ultraFocus.audio.checkbox, "RIGHT")
    self.ultraFocus.audio.text.tooltip = T["If checked, Angleur will adjust your audio settings for you when you cast your rod, and restore them to the previous values when you reel/loot.\n\n" 
    .. "Ambience & Music will be muted.\nSound Effects will be turned up.\n\nWhile Angleur is awake, \'Sound in Background\' will also be enabled(restored to previous on sleep).\n\n"
    .. "If you want to change the adjusted audio volume, go to Angleur->Tiny->Master Volume(Ultra Focus) and adjust from the slider."]
    self.ultraFocus.audio.checkbox:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurConfig.ultraFocusAudioEnabled = true
            audioConfig:Show()
            if AngleurCharacter.sleeping == false and AngleurAudio.checkboxes.toggleBG == true then
                Angleur_TempCVarHandler:Set("Sound_EnableSoundWhenGameIsInBG")
            end
        elseif self:GetChecked() == false then
            AngleurConfig.ultraFocusAudioEnabled = false
            audioConfig:Hide()
            Angleur_TempCVarHandler:Release("Sound_EnableMusic", "Sound_EnableAmbience", "Sound_EnableDialog", "Sound_EnableSFX", "Sound_EnableAllSound")
            Angleur_TempCVarHandler:Release("Sound_MasterVolume", "Sound_SFXVolume", "Sound_MusicVolume", "Sound_DialogVolume", "Sound_AmbienceVolume")
            Angleur_TempCVarHandler:Release("Sound_EnableSoundWhenGameIsInBG")
        end
    end)
    if AngleurConfig.ultraFocusAudioEnabled == true then
        self.ultraFocus.audio.checkbox:SetChecked(true)
        audioConfig:Show()
    end


end

function Angleur_SetTab1(self)
    local gameVersion = Angleur_CheckVersion()
    if gameVersion == 1 then
        retailStandardTab:ExtraButtons(self)
    elseif gameVersion == 2 or gameVersion == 3 then
        mistsStandardTab:ExtraButtons(self)
    end

    setupAudio(self)


    self.ultraFocus.autoLoot.text:SetText(T["Temp. Auto Loot "])
    self.ultraFocus.autoLoot.text:SetFontObject(SpellFont_Small)
    self.ultraFocus.autoLoot.checkbox:ClearAllPoints()
    self.ultraFocus.autoLoot.checkbox:SetPoint("TOPLEFT", self.ultraFocus.autoLoot, "TOPLEFT")
    self.ultraFocus.autoLoot.text:ClearAllPoints()
    self.ultraFocus.autoLoot.text:SetPoint("LEFT", self.ultraFocus.autoLoot.checkbox, "RIGHT")
    self.ultraFocus.autoLoot.text.tooltip = T["If checked, Angleur will temporarily turn on " .. colorYello:WrapTextInColorCode("Auto-Loot") .. ", then turn it back off after you reel.\n\n" 
    .. colorGrae:WrapTextInColorCode("If you have ") .. colorYello:WrapTextInColorCode("Auto-Loot ") .. colorGrae:WrapTextInColorCode("enabled anyway, this feature will be disabled automatically.")]
    self.ultraFocus.autoLoot.disabledText:SetJustifyH("LEFT")
    self.ultraFocus.autoLoot.disabledText:SetWordWrap(true)
    self.ultraFocus.autoLoot.disabledText:SetText(T["(Already on)"])
    self.ultraFocus.autoLoot.disabledText:ClearAllPoints()
    self.ultraFocus.autoLoot.disabledText:SetPoint("TOP", self.ultraFocus.autoLoot.text, "BOTTOM")
    self.ultraFocus.autoLoot.checkbox:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurConfig.ultraFocusAutoLootEnabled = true
        elseif self:GetChecked() == false then
            AngleurConfig.ultraFocusAutoLootEnabled = false
        end
    end)
    if AngleurConfig.ultraFocusAutoLootEnabled == true then
        self.ultraFocus.autoLoot.checkbox:SetChecked(true)
    end


    self.fishingMethod.menuTitle:SetText(T["FISHING METHOD:"])
    if not AngleurConfig.angleurKey and AngleurTutorial.part > 1 then
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


    self.recastEnable.text:SetText(T["Enable Recast Key"])
    self.recastEnable.disabledText:SetText(T[""])
    self.recastEnable.text.tooltip = T["Bind a dedicated \'Re-Cast Key\'.\n\nWill be released back to you when not fishing."]
    self.recastEnable.checkbox:SetScript("OnClick", function()
        if self.recastEnable.checkbox:GetChecked() then
            AngleurConfig.recastEnabled = true
            self.recastEnable.recastKey:Show()
        elseif self.recastEnable.checkbox:GetChecked() == false then
            AngleurConfig.recastEnabled = false
            self.recastEnable.recastKey:Hide()
        end
    end)
    if AngleurConfig.recastEnabled == true then
        self.recastEnable.checkbox:SetChecked(true)
        self.recastEnable.recastKey:Show()
    end


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
    EventRegistry:TriggerEvent("Angleur-ChosenMethod-Changed")
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
