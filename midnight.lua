local T = Angleur_Translate
local debugChannel = 8
local colorDebug = CreateColor(0.2, 0.21, 0.54) -- void blue

local IMMOLATION_AURA_SPELLID = 258920 -- for testing
local PATIENT_SPELLID1 =  1269521 -- ActualID: 1269521
local PATIENT_SPELLID2 = 1235378 -- Actual ID: 1235378
local NETHER_EGG_ITEMID = 268730


--_______________________________________________________________________________________________________________________________________________________
--_______________________________________________________________________ UI PART _______________________________________________________________________
--_______________________________________________________________________________________________________________________________________________________


-- <Frame name="$parent_RecastCheckbox" parentKey="recastEnable" inherits="CheckboxFrameTemplate_Angleur">
--     <Anchors>
--         <Anchor point="TOPLEFT" relativeTo="$parent_FishingMethod" relativePoint="BOTTOMLEFT" x="0" y="13"/>
--     </Anchors>
--     <Frames>
--         <Button name="Angleur_RecastKey" parentkey="recastKey" inherits="Legolando_KeybindButtonTemplate_Angleur" hidden="true">
--             <Size x="100" y="22"/>
--             <Anchors>
--                 <Anchor point="LEFT" relativeTo="$parent_Checkbox" relativePoint="RIGHT"/>
--             </Anchors>
--         </Button>
--     </Frames>
-- </Frame>


local anim = CreateFrame("Frame", "Angleur_VoidScanAnim", UIParent, "Legolando_MouseScanAnim_Angleur")
anim:SetSize(256, 256)
anim:SetPoint("CENTER")
anim:Hide()

local secureActionButton = CreateFrame("Button", "Angleur_VoidSecureAction", UIParent, "SecureActionButtonTemplate")
secureActionButton:SetAttribute("type", "macro")
secureActionButton:SetAttribute("macrotext", "/tar Hyper\n/cleartarget [dead]\n/stopmacro [noexists]\n/script PlaySound(5274)\n/tm 8")
secureActionButton:RegisterEvent("PLAYER_REGEN_DISABLED")
secureActionButton:RegisterEvent("PLAYER_REGEN_ENABLED")
local function override_Set()
    if not InCombatLockdown() and AngleurConfig.voidFinderEnabled and AngleurConfig.voidFinderKey then
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



function Angleur_LoadMidnight()
    if AngleurConfig.patientEnabled == nil then
        AngleurConfig.patientEnabled = false
    end
    if AngleurConfig.voidFinderEnabled == nil then
        AngleurConfig.voidFinderEnabled = false
    end

    local tabContents = Angleur_ConfigPanel_Tab1_Contents
    local patientEnable = CreateFrame("Frame", "Angleur_ConfigPanel_Tab1_Contents_PatientCheckbox", tabContents, "CheckboxFrameTemplate_Angleur")
    patientEnable:SetPoint("TOPLEFT", tabContents.ultraFocus.audio.text, "TOPRIGHT", 0, 7)
    patientEnable.checkbox:ClearAllPoints()
    patientEnable.checkbox:SetPoint("TOPLEFT", patientEnable, "TOPLEFT")
    patientEnable.text:ClearAllPoints()
    patientEnable.text:SetPoint("LEFT", patientEnable.checkbox, "RIGHT")
    patientEnable.text:SetFontObject(SpellFont_Small)

    local newTexture = patientEnable:CreateTexture("Angleur_New!", "ARTWORK")
    newTexture:SetTexture("Interface/AddOns/Angleur/images/newfeature.png")
    newTexture:SetSize(58, 29)
    newTexture:SetPoint("LEFT", patientEnable.text, "RIGHT")

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

    local voidFinderKey = CreateFrame("Button", "Angleur_ConfigPanel_Tab1_Contents_VoidKey", voidFinderEnable, "Legolando_KeybindButtonTemplate_Angleur")
    voidFinderKey:SetParentKey("voidFinderKeyU")
    voidFinderKey:SetSize(80, 20)
    voidFinderKey:SetPoint("LEFT", voidFinderEnable.checkbox, "RIGHT")
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
    -- voidFinderEnable:greyOut()

    voidFinderEnable.text.tooltip = T["Macro-Bound Key to find and mark Void Pools easily!"]
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
end

--_______________________________________________________________________________________________________________________________________________________







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
    print(T["[Patient Treasure] Spawned. Be quick and grab it! Good luck with the mount egg:\n"] .. "---------------------------------------- ", link .. " ----------------------------------------")
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
    if InCombatLockdown() then return end
    if AngleurConfig.patientEnabled == false then return end
    if not updateInfo then return end
    if AngleurCharacter.sleeping then return end

    local added = updateInfo.addedAuras
    local removed = updateInfo.removedAuraInstanceIDs
    -- Added Auras
    if added then
        for i, v in pairs(added) do
            local spellID = v.spellId
            if spellID == PATIENT_SPELLID1 or spellID == PATIENT_SPELLID2 then
                activeAuras[v.auraInstanceID] = spellID
                Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Patient Chest:"), "Added", activeAuras[v.auraInstanceID], "Instance ID: ", v.auraInstanceID)
                checkPatient()
            end
        end
    end
    -- Updated Auras

    -- Removed Auras
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

    -- --Checks for raft aura
    -- if C_UnitAuras.GetPlayerAuraBySpellID(PATIENT_SPELLID1) or C_UnitAuras.GetPlayerAuraBySpellID(PATIENT_SPELLID2) then
    --     
    -- else
    --     return false
    -- end
end



-- <Frame parent="Angleur" name="AngleurSet_AlertAnim" frameStrata="TOOLTIP" toplevel="true" inherits="AngleurPorted_ActionBarButtonSpellActivationAlert" hidden="true">
--     <Size x="64" y="64"/>
--     <Scripts>
--         <OnEnter>
--             self:Hide()
--         </OnEnter>
--     </Scripts>
-- </Frame>




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

SLASH_PATIENTTEST1 = "/renotest"
SlashCmdList["PATIENTTEST"] = function() 
    patientFrame:Show()
    anim:Hide()
    anim:Show()
end