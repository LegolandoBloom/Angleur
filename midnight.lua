local T = Angleur_Translate

local PATIENT_SPELLID1 = 1269521
local PATIENT_SPELLID2 = 1235378
local NETHER_EGG_ITEMID = 268730

function Angleur_LoadMidnight()
    local tabContents = Angleur_ConfigPanel_Tab1_Contents
    local patientEnable = CreateFrame("Frame", "Angleur_ConfigPanel_Tab1_Contents_PatientCheckbox", tabContents, "CheckboxFrameTemplate_Angleur")
    patientEnable:SetPoint("TOPLEFT", tabContents.ultraFocus.audio.text, "TOPRIGHT", 0, 7)
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
    PlaySoundFile("Interface/AddOns/Angleur/images/newfeature.png")
end



local eggLoaded = false
local patientFrame = CreateFrame("Frame", "Angleur_PatientChestFrame", UIParent, "AngleurPorted_ActionBarButtonSpellActivationAlert")

local uiParent_w, uiParent_h = UIParent:GetSize()
patientFrame:SetSize(uiParent_w * 2, uiParent_h * 2)
patientFrame:SetPoint("CENTER", UIParent, "CENTER")
patientFrame:HookScript("OnShow", function(self)
    PlaySoundFile("Interface/AddOns/Angleur/sounds/renoRich.mp3")
    self.ProcStartAnim:Play()
    Angleur_SingleDelayer(5, 0, 1, self, nil, function()
        self:Hide()
    end)
    local link
    if eggLoaded then
        _, link = C_Item.GetItemInfo(268730)
    end
    print(T["[Patient Treasure] Spawned. Be quick and grab it! Good luck with the mount egg:\n"] .. "--------------- ", link .. " ---------------")
end)
patientFrame:Hide()
local reno = patientFrame:CreateTexture("Angleur_PatientReno", "ARTWORK")
reno:SetTexture("Interface/AddOns/Angleur/images/renojackson.png")
reno:SetSize(650, 650)
reno:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT")




local timerFrame = CreateFrame("Frame")
local recentlyCalled = false
local function checkPatientAura()
    --Checks for raft aura
    if C_UnitAuras.GetPlayerAuraBySpellID(PATIENT_SPELLID1) or C_UnitAuras.GetPlayerAuraBySpellID(PATIENT_SPELLID2) then
        if not recentlyCalled then
            recentlyCalled = true
            patientFrame:Show()
            Angleur_SingleDelayer(30, 0, 1, timerFrame, nil, function(self)
                recentlyCalled = false
            end)
        end
    end
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
    if AngleurConfig.patientEnabled == false then return end
    local arg4, arg5 = ...
    unit, arg4, arg5 = scrubsecretvalues(unit, arg4, arg5)
    if event == "UNIT_AURA" and unit == "player" then
        -- print("oh my gah")
        checkPatientAura()
    elseif event == "PLAYER_LOGIN" then
        C_Item.RequestLoadItemDataByID(NETHER_EGG_ITEMID)
    elseif event == "ITEM_DATA_LOAD_RESULT" and unit == NETHER_EGG_ITEMID and arg4 == true then
        eggLoaded = true
    end
end)

SLASH_PATIENTTEST1 = "/renotest"
SlashCmdList["PATIENTTEST"] = function() 
   patientFrame:Show()
end