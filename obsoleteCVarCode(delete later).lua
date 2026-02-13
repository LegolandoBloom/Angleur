
------------------------------
-- SOON TO BE MADE OBSOLETE --
------------------------------
local temp_Cvars = {
    softTargetInteract = nil,
}
-- activate: set vs release
function Angleur_HandleTempCVars(activate)
    if activate == true then
        temp_Cvars.softTargetInteract = C_CVar.GetCVar("SoftTargetInteract")
        C_CVar.SetCVar("SoftTargetInteract", 3)
        Angleur_BetaPrint(debugChannel, "Set CVAR SoftTargetInteract", "to: ", C_CVar.GetCVar("SoftTargetInteract"))
    elseif activate == false then
        if temp_Cvars.softTargetInteract then
            C_CVar.SetCVar("SoftTargetInteract", temp_Cvars.softTargetInteract)
        end
    end
end
function Angleur_UltraFocusInteractOff(activate)
    if activate == true then
        C_CVar.SetCVar("SoftTargetInteract", 3)
    elseif activate == false then
        C_CVar.SetCVar("SoftTargetInteract", 1)
    end
end
function AngleurClassic_ToggleSoftInteract(activate)
    local current = C_CVar.GetCVar("SoftTargetInteract")
    if activate == true then
        AngleurClassic_CVars.softInteract = current
        C_CVar.SetCVar("SoftTargetInteract", 3)
    elseif activate == false and AngleurClassic_CVars.softInteract and current ~= AngleurClassic_CVars.softInteract then
        C_CVar.SetCVar("SoftTargetInteract", AngleurClassic_CVars.softInteract)
    end
end

function Angleur_UltraFocusBackground(activate)
    if activate == true then
        Angleur_CVars.ultraFocus.backgroundOn = GetCVar("Sound_EnableSoundWhenGameIsInBG")
        SetCVar("Sound_EnableSoundWhenGameIsInBG", 1)
        -- Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_UltraFocusBackground ") .. ": BG Sound set to: ", GetCVar("Sound_EnableSoundWhenGameIsInBG"))
    elseif activate == false then
        if Angleur_CVars.ultraFocus.backgroundOn ~= nil then SetCVar("Sound_EnableSoundWhenGameIsInBG", Angleur_CVars.ultraFocus.backgroundOn) end
        -- Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_UltraFocusBackground ") .. ": BG Sound restored to previous value, which was: ", Angleur_CVars.ultraFocus.backgroundOn)
    end
end


-- Angleur_TempCVarHandler:Release("Sound_EnableMusic", "Sound_EnableAmbience", "Sound_EnableDialog", "Sound_EnableSFX", "Sound_SFXVolume", "Sound_EnableAllSound", "Sound_MasterVolume")

function Angleur_UltraFocusAudio(activate)
    if activate == true then
        Angleur_CVars.ultraFocus.musicOn = GetCVar("Sound_EnableMusic")
        SetCVar("Sound_EnableMusic", 0)
        Angleur_CVars.ultraFocus.ambienceOn = GetCVar("Sound_EnableAmbience")
        SetCVar("Sound_EnableAmbience", 0)
        Angleur_CVars.ultraFocus.dialogOn = GetCVar("Sound_EnableDialog")
        SetCVar("Sound_EnableDialog", 0)
        Angleur_CVars.ultraFocus.effectsOn = GetCVar("Sound_EnableSFX")
        SetCVar("Sound_EnableSFX", 1)
        Angleur_CVars.ultraFocus.effectsVolume = GetCVar("Sound_SFXVolume")
        SetCVar("Sound_SFXVolume", 1.0)
        Angleur_CVars.ultraFocus.masterOn = GetCVar("Sound_EnableAllSound")
        SetCVar("Sound_EnableAllSound", 1)
        Angleur_CVars.ultraFocus.masterVolume = GetCVar("Sound_MasterVolume")
        SetCVar("Sound_MasterVolume", Angleur_TinyOptions.ultraFocusMaster)
        AngleurConfig.ultraFocusingAudio = true
        --[[
            print("Music: " , Angleur_CVars.ultraFocus.musicOn)
            print("Ambience: " , Angleur_CVars.ultraFocus.ambienceOn)
            print("Dialog: " , Angleur_CVars.ultraFocus.dialogOn)
            print("SFX: " , Angleur_CVars.ultraFocus.effectsOn)
            print("SFX-Volume: " , Angleur_CVars.ultraFocus.effectsVolume)
        ]]--
    elseif activate == false then
        if Angleur_CVars.ultraFocus.musicOn ~= nil then SetCVar("Sound_EnableMusic", Angleur_CVars.ultraFocus.musicOn) end
        if Angleur_CVars.ultraFocus.ambienceOn ~= nil then SetCVar("Sound_EnableAmbience", Angleur_CVars.ultraFocus.ambienceOn) end
        if Angleur_CVars.ultraFocus.dialogOn ~= nil then SetCVar("Sound_EnableDialog", Angleur_CVars.ultraFocus.dialogOn) end
        if Angleur_CVars.ultraFocus.effectsOn ~= nil then SetCVar("Sound_EnableSFX", Angleur_CVars.ultraFocus.effectsOn) end
        if Angleur_CVars.ultraFocus.effectsVolume ~= nil then SetCVar("Sound_SFXVolume", Angleur_CVars.ultraFocus.effectsVolume) end
        if Angleur_CVars.ultraFocus.masterOn ~= nil then SetCVar("Sound_EnableAllSound", Angleur_CVars.ultraFocus.masterOn) end
        if Angleur_CVars.ultraFocus.masterVolume ~= nil then SetCVar("Sound_MasterVolume", Angleur_CVars.ultraFocus.masterVolume) end

        AngleurConfig.ultraFocusingAudio = false
        --print("Ultra Focus Disabled")
    end
end

function Angleur_UltraFocusAutoLoot(activate)
    if activate == true then
        local autoLootBefore = GetCVar("autoLootDefault")
        if autoLootBefore == 1 then return end
        AngleurConfig.ultraFocusingAutoLoot = true
        Angleur_CVars.autoLoot = autoLootBefore
        SetCVar("autoLootDefault", 1)
    elseif activate == false then
        AngleurConfig.ultraFocusingAutoLoot = false
        if Angleur_CVars.autoLoot ~= nil then
            SetCVar("autoLootDefault", Angleur_CVars.autoLoot) 
            Angleur_CVars.autoLoot = false
        end
    end
end

