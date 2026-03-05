local PATIENT_SPELLID1 = 1269521
local PATIENT_SPELLID2 = 1235378

local patientFrame = CreateFrame("Frame", "Angleur_PatientChestFrame", UIParent, "AngleurPorted_ActionBarButtonSpellActivationAlert")
local uiParent_w, uiParent_h = UIParent:GetSize()
patientFrame:SetSize(uiParent_w * 2, uiParent_h * 2)
patientFrame:SetPoint("CENTER", UIParent, "CENTER")
patientFrame:HookScript("OnShow", function()
    PlaySoundFile("Interface/AddOns/Angleur/sounds/renoRich.mp3")
end)
patientFrame:Hide()
local reno = patientFrame:CreateTexture("Angleur_PatientReno", "ARTWORK")
reno:SetTexture("Interface/AddOns/Angleur/images/renojackson.png")
reno:SetSize(512, 512)
reno:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT")

patientFrame:RegisterEvent("UNIT_AURA")



local recentlyCalled = false
local function checkPatientAura()
    --Checks for raft aura
    if C_UnitAuras.GetPlayerAuraBySpellID(PATIENT_SPELLID1) or C_UnitAuras.GetPlayerAuraBySpellID(PATIENT_SPELLID2) then
        if not recentlyCalled then
            recentlyCalled = true
            patientFrame:Show()
            Angleur_SingleDelayer(60, 0, 1, patientFrame, nil, function(self)
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


patientFrame:SetScript("OnEvent", function (self, event, unit, ...)
    local arg4, arg5 = ...
    unit, arg4, arg5 = scrubsecretvalues(unit, arg4, arg5)
    if event == "UNIT_AURA" and unit == "player" then
        -- print("oh my gah")
        checkPatientAura()
    end
end)

SLASH_PATIENTTEST1 = "/plet"
SlashCmdList["PATIENTTEST"] = function() 
   patientFrame.ProcStartAnim:Play()
   patientFrame:Show()
end