local T = Angleur_Translate
local debugChannel = 8
local colorDebug = CreateColor(0.2, 0.21, 0.54) -- void blue

local IMMOLATION_AURA_SPELLID = 258920 -- for testing
local PATIENT_SPELLID1 =  1269521 -- ActualID: 1269521
local PATIENT_SPELLID2 = 1235378 -- Actual ID: 1235378
local NETHER_EGG_ITEMID = 268730



--______________________________________________ Void Finder ______________________________________________

local anim = CreateFrame("Frame", "Angleur_VoidScanAnim", UIParent, "Legolando_MouseScanAnim_Angleur")
anim:SetSize(256, 256)
anim:SetPoint("CENTER")
anim:Hide()

local LOCALISATION_VORTEX = {
    ["enUS"] = "Hyper-Compressed",
    ["deDE"] = "Ziel für hyperkomprimierten",
    ["esES"] = "Objetivo de Océano hipercomprimido",
    ["esMX"] = "Objetivo de Océano hipercomprimido",
    ["frFR"] = "Cible d'océan hyper-comprimé",
    ["itIT"] = "Bersaglio dell'Oceano Ultra Compresso",
    ["koKR"] = "초압축 바다 대상",
    ["ptBR"] = "Alvo de Oceano Hipercomprimido",
    ["ruRU"] = "Гиперсжатый",
    ["zhCN"] = "压缩海洋的目标",
    ["zhTW"] = "超壓縮海洋目標",
}
local locale = GAME_LOCALE or GetLocale()
local vortex_name = "Hyper-Compressed"
if locale and LOCALISATION_VORTEX[locale] then
    vortex_name = LOCALISATION_VORTEX[locale]
end

local secureActionButton = CreateFrame("Button", "Angleur_VoidSecureAction", UIParent, "SecureActionButtonTemplate")
secureActionButton:RegisterForClicks("AnyUp", "AnyDown")
secureActionButton:SetAttribute("type", "macro")
-- SLASH_TARGET_MARKER1 --> Causes an issue on ptBR Clients: "You aren't part of that group"
secureActionButton:SetAttribute("macrotext", "/tar " .. vortex_name .. "\n/cleartarget [dead]\n/stopmacro [noexists]\n/script PlaySound(5274)\n" .. SLASH_TARGET_MARKER3 .. " 8")
secureActionButton:RegisterEvent("PLAYER_REGEN_DISABLED")
secureActionButton:RegisterEvent("PLAYER_REGEN_ENABLED")
local function override_Set()
    if not InCombatLockdown() and AngleurCharacter.sleeping == false and AngleurConfig.voidFinderEnabled and AngleurConfig.voidFinderKey then
        ClearOverrideBindings(secureActionButton)
        SetOverrideBindingClick(secureActionButton, false, AngleurConfig.voidFinderKey, "Angleur_VoidSecureAction")
    end
end
local function override_Release()
    if not InCombatLockdown() then 
        ClearOverrideBindings(secureActionButton)
    end
end
secureActionButton:SetScript("OnEvent", function(self, event, unit, ...)
    local arg4, arg5 = ...
    unit, arg4, arg5 = scrubsecretvalues(unit, arg4, arg5)
    if event == "PLAYER_REGEN_DISABLED" then
        override_Release()
    elseif event == "PLAYER_REGEN_ENABLED" then
        override_Set()
    end
end)
secureActionButton:SetScript("PostClick", function()
    PlaySoundFile("Interface/AddOns/Angleur/sounds/scansound.ogg")
    anim:Hide()
    anim:Show()
end)

EventRegistry:RegisterCallback("Angleur_Sleep", function()
    override_Release()
end)
EventRegistry:RegisterCallback("Angleur_Wake", function()
    override_Set()
end)
--_________________________________________________________________________________________________________


--_______________________________________________________________________________________________________________________________________________________
--_______________________________________________________________________ UI PART _______________________________________________________________________
--_______________________________________________________________________________________________________________________________________________________
function Angleur_LoadMidnight()
    if AngleurConfig.patientEnabled == nil then
        AngleurConfig.patientEnabled = false
    end
    if AngleurConfig.voidFinderEnabled == nil then
        AngleurConfig.voidFinderEnabled = false
    end

    local tabContents = Angleur_ConfigPanel_Tab1_Contents
    local patientEnable = CreateFrame("Frame", "Angleur_ConfigPanel_Tab1_Contents_PatientCheckbox", tabContents, "CheckboxFrameTemplate_Angleur")
    patientEnable:SetPoint("TOPLEFT", tabContents.ultraFocus.audio.text, "TOPRIGHT", 25, 7)
    patientEnable.checkbox:ClearAllPoints()
    patientEnable.checkbox:SetPoint("TOPLEFT", patientEnable, "TOPLEFT")
    patientEnable.text:ClearAllPoints()
    patientEnable.text:SetPoint("LEFT", patientEnable.checkbox, "RIGHT")
    patientEnable.text:SetFontObject(SpellFont_Small)



    patientEnable.text:SetText(T["Patient Chest"])
    patientEnable.text.tooltip = T["for [Patient Chest]\n\n" .. "When enabled, Angleur will play a warning sound, screen animation and show a cool image of Reno Jackson warning you about the treasure.\n\nNote: The sound is also that of Reno Jackson\n\n" 
    .. "We're gonna be rich!"]
    patientEnable.checkbox:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurConfig.patientEnabled = true
            PlaySoundFile("Interface/AddOns/Angleur/sounds/renoRich.mp3")
        elseif self:GetChecked() == false then
            AngleurConfig.patientEnabled = false
        end
    end)
    if AngleurConfig.patientEnabled == true then
        patientEnable.checkbox:SetChecked(true)
    end
    
    local voidFinderEnable = CreateFrame("Frame", "Angleur_ConfigPanel_Tab1_Contents_VoidCheckbox", tabContents, "CheckboxFrameTemplate_Angleur")
    voidFinderEnable:SetPoint("TOPLEFT", tabContents.recastEnable.text, "BOTTOMLEFT", 0, -7)

    local vortex = voidFinderEnable:CreateTexture("Angleur_VortexTexture", "ARTWORK")
    vortex:SetTexture("Interface/AddOns/Angleur/images/vortex.png")
    vortex:SetSize(24, 24)
    vortex:SetPoint("LEFT", voidFinderEnable.checkbox, "RIGHT", -3, 0)
    vortex:SetIgnoreParentAlpha(true)
    vortex:SetAlpha(1)

    local voidFinderKey = CreateFrame("Button", "Angleur_ConfigPanel_Tab1_Contents_VoidKey", voidFinderEnable, "Legolando_KeybindButtonTemplate_Angleur")
    voidFinderKey:SetParentKey("voidFinderKeyU")
    voidFinderKey:SetSize(80, 20)
    voidFinderKey:SetPoint("LEFT", vortex, "RIGHT", -3, 0)
    voidFinderKey:Hide()
    voidFinderKey.onBindFunction = function()
        if AngleurConfig.voidFinderKey then
            override_Set()
        else
            override_Release()
        end
    end

    voidFinderEnable.text:SetText("Void Finder")
    voidFinderEnable.disabledText:SetText(T["Coming Soon!"])

    voidFinderEnable.text.tooltip = T["Macro-Bound Key to find and mark Void Pools easily!\n\nWhen you press it, if there is a nearby Void Pool, it will be marked on your minimap & in-game with a skull marker." 
    .. "\n\nAlso plays a cool sound effect and a scan animation under your mouse cursor"]
    voidFinderEnable.checkbox:SetScript("OnClick", function()
        if voidFinderEnable.checkbox:GetChecked() then
            AngleurConfig.voidFinderEnabled = true
            voidFinderKey:Show()
            override_Set()
        elseif voidFinderEnable.checkbox:GetChecked() == false then
            AngleurConfig.voidFinderEnabled = false
            voidFinderKey:Hide()
            override_Release()
        end
    end)
    if AngleurConfig.voidFinderEnabled == true then
        voidFinderEnable.checkbox:SetChecked(true)
        voidFinderKey:Show()
        override_Set()
    end

    voidFinderKey.savedVarTable = AngleurConfig
    voidFinderKey.keybindRef = "voidFinderKey"



    local newTexture1 = patientEnable:CreateTexture("Angleur_New1!", "ARTWORK")
    newTexture1:SetTexture("Interface/AddOns/Angleur/images/newfeature.png")
    newTexture1:SetSize(58, 29)
    newTexture1:SetPoint("TOPRIGHT", patientEnable.text, "BOTTOMRIGHT", 10, 5)

    local newTexture2 = patientEnable:CreateTexture("Angleur_New2!", "ARTWORK")
    newTexture2:SetTexture("Interface/AddOns/Angleur/images/newfeature.png")
    newTexture2:SetSize(58, 29)
    newTexture2:SetPoint("TOP", voidFinderEnable.text, "BOTTOM", 10, 0)
end
--_______________________________________________________________________________________________________________________________________________________






-- _______________________________________ PATIENT CHEST _______________________________________
local eggLoaded = false
local patientFrame = CreateFrame("Frame", "Angleur_PatientChestFrame", UIParent, "AngleurPorted_ActionBarButtonSpellActivationAlert")

local uiParent_w, uiParent_h = UIParent:GetSize()
patientFrame:SetSize(uiParent_w * 2, uiParent_h * 2)
patientFrame:SetPoint("CENTER", UIParent, "CENTER")
patientFrame:SetAlpha(0.7)
patientFrame:HookScript("OnShow", function(self)
    PlaySoundFile("Interface/AddOns/Angleur/sounds/renoRich.mp3")
    self.ProcStartAnim:Play()
    Angleur_SingleDelayer(5, 0, 1, self, nil, function()
        self:Hide()
    end)
    local link
    if eggLoaded then
        _, link = C_Item.GetItemInfo(NETHER_EGG_ITEMID)
    end
    print(T["[Patient Treasure] Spawned. Be quick and grab it! Good luck with the mount egg:\n"] .. "---------------------------------------- ", link, " ----------------------------------------")
end)
patientFrame:Hide()
local reno = patientFrame:CreateTexture("Angleur_PatientReno", "ARTWORK")
reno:SetTexture("Interface/AddOns/Angleur/images/renojackson.png")
reno:SetSize(650, 650)
reno:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT")
reno:SetIgnoreParentAlpha(true)
reno:SetAlpha(1)


local activeAuras = {}
local timerFrame = CreateFrame("Frame")
local recentlyCalled = false
local function checkPatient()
    if not recentlyCalled then
        recentlyCalled = true
        patientFrame:Show()
        Angleur_SingleDelayer(30, 0, 1, timerFrame, nil, function(self)
            recentlyCalled = false
        end)
    end
end

local function handleAuras(updateInfo)
    local inCombat = InCombatLockdown()
    if AngleurConfig.patientEnabled == false then return end
    if not updateInfo then return end
    if AngleurCharacter.sleeping then return end

    local added = scrubsecretvalues(updateInfo.addedAuras)
    local removed = scrubsecretvalues(updateInfo.removedAuraInstanceIDs)
    -- Added Auras
    if added and not inCombat then
        for i, v in pairs(added) do
            local spellID = scrubsecretvalues(v.spellId)
            if spellID == PATIENT_SPELLID1 or spellID == PATIENT_SPELLID2 then
                activeAuras[v.auraInstanceID] = spellID
                Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Patient Chest:"), "Added", activeAuras[v.auraInstanceID], "Instance ID: ", v.auraInstanceID)
                checkPatient()
            end
        end
    end

    -- Updated Auras
    -- nothing

    -- Removed Auras - These are never secret, so we can access them in combat
    if removed then
        for i, v in pairs(removed) do
            if activeAuras[v] then
                Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Patient Chest:"), "Removed", activeAuras[v], "Instance ID: ", v)
                activeAuras[v] = nil
            end
        end
    end
    Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Patient Chest:"), "Active Auras:")
    Angleur_BetaDump(debugChannel, activeAuras)
end

patientFrame:RegisterEvent("UNIT_AURA")
patientFrame:RegisterEvent("ITEM_DATA_LOAD_RESULT")
patientFrame:RegisterEvent("PLAYER_LOGIN")
patientFrame:SetScript("OnEvent", function (self, event, unit, ...)
    local arg4, arg5 = ...
    unit, arg4, arg5 = scrubsecretvalues(unit, arg4, arg5)
    if event == "UNIT_AURA" and unit == "player" then
        -- print("oh my gah")
        handleAuras(arg4)
    elseif event == "PLAYER_LOGIN" then
        C_Item.RequestLoadItemDataByID(NETHER_EGG_ITEMID)
    elseif event == "ITEM_DATA_LOAD_RESULT" and unit == NETHER_EGG_ITEMID and arg4 == true then
        eggLoaded = true
    end
end)
-- _____________________________________________________________________________________________


SLASH_PATIENTTEST1 = "/renotest"
SlashCmdList["PATIENTTEST"] = function() 
    patientFrame:Show()
    anim:Hide()
    anim:Show()
end