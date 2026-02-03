local T = Angleur_Translate
local colorBlu = CreateColor(0.61, 0.85, 0.92)
local colorYello = CreateColor(1.0, 0.82, 0.0)

SLASH_ANGLEURHELPTIPFIND1 = "/anghelptip"
SlashCmdList["ANGLEURHELPTIPFIND"] = function()
    for frame in HelpTip.framePool:EnumerateActive() do
        --AngleurConfig.savedText = frame.info.text
        local parent = frame:GetParent()
        print(frame.info.text)
    end
end

SLASH_ENUMERATEPOOL1 = "/angenum"
SlashCmdList["ENUMERATEPOOL"] = function()
    for frame in angleurDelayers:EnumerateActive() do
        print(frame:GetDebugName(), "IS ACTIVE")
    end
    for index, frame in angleurDelayers:EnumerateInactive() do
        print(frame:GetDebugName(), "IS INACTIVE")
    end
end

SLASH_ANGLEURRESET1 = "/angres"
SlashCmdList["ANGLEURRESET"] = function()
    AngleurTutorial.part = 1
    print("First install tutorial reset.")
    Angleur_FirstInstall()
end

SLASH_ANGLEURSLEEP1 = "/angsleep"
SlashCmdList["ANGLEURSLEEP"] = function()
    if InCombatLockdown() then
        print(T["Can't change sleep state in combat."])
        return
    end
    if UnitIsDeadOrGhost("player") then
        print(T["Can't change sleep state while in ghost form."])
        return
    end
    if AngleurCharacter.sleeping == false then
        AngleurCharacter.sleeping = true
        print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping."])
        Angleur_SetSleep()
        Angleur_UnequipAngleurSet()
    elseif AngleurCharacter.sleeping == true then
        AngleurCharacter.sleeping = false
        print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Awake."])
        Angleur_SetSleep()
        Angleur_EquipAngleurSet(true)
    end
end

SLASH_ANGLEURSETTINGS1 = "/angleur"
SLASH_ANGLEURSETTINGS2 = "/angang"
SLASH_ANGLEURSETTINGS3 = "/ang"
SlashCmdList["ANGLEURSETTINGS"] = function() 
    if InCombatLockdown() then
        print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "cannot open " .. colorYello:WrapTextInColorCode("Config Panel ") .. "in combat."])
        print(T["Please try again after combat ends."])
        return
    end
    if not Angleur.configPanel:IsShown() then 
        Angleur.configPanel:Show()
    end
end

--[[
    SLASH_ANGLEURDEBUG1 = "/angdebug"
    SlashCmdList["ANGLEURDEBUG"] = function()
        if not Angleur_TinyOptions.errorsDisabled then
            Angleur_TinyOptions.errorsDisabled = true
            print("glitch hunt messages disabled")
        else
            Angleur_TinyOptions.errorsDisabled = false
            print("glitch hunt messages re-enabled")
        end
    end
]]--
    

