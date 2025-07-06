angleurDelayers = CreateFramePool("Frame", angleurDelayers, nil, function(framePool, frame)
    frame:ClearAllPoints()
    frame:SetScript("OnUpdate", nil)
    frame:Hide()
end)

AngleurConfig = {
    angleurKey,
    angleurKeyModifier,
    angleurKeyMain,
    raftEnabled,
    chosenRaft = {toyID = 0, name = 0, dropDownID = 0},
    baitEnabled,
    chosenBait = {itemID = 0, name = 0, dropDownID = 0},
    oversizedEnabled,
    crateEnabled,
    chosenCrateBobber = {toyID = 0, name = 0, dropDownID = 0},
    chosenMethod,
    doubleClickChosenID = 2,
    visualHidden,
    visualLocation,
    ultraFocusAudioEnabled,
    ultraFocusAutoLootEnabled,
    ultraFocusTurnOffInteract,
    ultraFocusingAudio,
    ultraFocusingAutoLoot,
}

AngleurCharacter = {
    sleeping = false,
    angleurSet = false
}

Angleur_CVars = {
    ultraFocus = {musicOn, ambienceOn, dialogOn, effectsOn,  effectsVolume, masterOn, masterVolume, backgroundOn},
    autoLoot
}

AngleurMinimapButton = {
    hide
}

Angleur_TinyOptions = {
    turnOffSoftInteract = false,
    allowDismount = false,
    doubleClickWindow = 0.4,
    visualScale = 1,
    ultraFocusMaster = 1,
    loginDisabled = false,
    errorsDisabled = true,
    softIconOff = false,
}

function Init_AngleurSavedVariables()
    if AngleurConfig.ultraFocusAudioEnabled == nil then
        AngleurConfig.ultraFocusAudioEnabled = false
    end
    if AngleurConfig.ultraFocusAutoLootEnabled == nil then
        AngleurConfig.ultraFocusAutoLootEnabled = false
    end
    if AngleurConfig.chosenBait == nil then
        AngleurConfig.chosenBait = {itemID = 0, name = 0, dropDownID = 0}
    end

    

    if AngleurCharacter.sleeping == nil then
        AngleurCharacter.sleeping = false
    end

    if Angleur_TinyOptions.turnOffSoftInteract == nil then
        Angleur_TinyOptions.turnOffSoftInteract = false
    end
    if Angleur_TinyOptions.allowDismount == nil then
        Angleur_TinyOptions.allowDismount = false
    end
    if Angleur_TinyOptions.softTargetIcon == nil then
        Angleur_TinyOptions.softTargetIcon = true
    end
    if Angleur_TinyOptions.doubleClickWindow == nil then
        Angleur_TinyOptions.doubleClickWindow = 0.4
    end
    if Angleur_TinyOptions.visualScale == nil then
        Angleur_TinyOptions.visualScale = 1
    end
    if Angleur_TinyOptions.ultraFocusMaster == nil then
        Angleur_TinyOptions.ultraFocusMaster = 1
    end
    if Angleur_TinyOptions.loginDisabled == nil then
        Angleur_TinyOptions.loginDisabled = false
    end
    if Angleur_TinyOptions.errorsDisabled == nil then
        Angleur_TinyOptions.errorsDisabled = true
    end

    if AngleurMinimapButton.hide == nil then
        AngleurMinimapButton.hide = false
    end

    if AngleurTutorial.part == nil then
        AngleurTutorial.part = 1
    end
end

-- 1 : Retail, 2 : Cata Classic, 3 : Classic 19 : MoP Classic    (0: None, fail)
function Angleur_CheckVersion()
    if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
        return 1
    elseif WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC or WOW_PROJECT_ID == 19 then
        return 2
    elseif WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
        return 3
    end
    return 0
end

-- USE TO CHECK VERSIONS
-- /run print(WOW_PROJECT_ID == WOW_PROJECT_MAINLINE and "Retail" 
-- or WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC and "Cata" 
-- or WOW_PROJECT_ID == WOW_PROJECT_CLASSIC and "Vanilla" or "I don't know")

function Angleur_SingleDelayer(delay, timeElapsed, elapsedThreshhold, delayFrame, cycleFunk, endFunk)
    delayFrame:SetScript("OnUpdate", function(self, elapsed)
        timeElapsed = timeElapsed + elapsed
        if timeElapsed > elapsedThreshhold then
            if cycleFunk then
                if cycleFunk() == true then
                    --print("Breaking delayer")
                    self:SetScript("OnUpdate", nil)
                    return
                end
            end
            delay = delay - timeElapsed
            timeElapsed = 0
        end
        
        if delay <= 0 then
            self:SetScript("OnUpdate", nil)
            endFunk()
            return
        end
    end)
end

angleurCombatDelayFrame = CreateFrame("Frame")
angleurCombatDelayFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
angleurFunctionsQueueTable = {}
function Angleur_CombatDelayer(funk)
    if InCombatLockdown() then
        --print("triggered")
        table.insert(angleurFunctionsQueueTable, funk)
        angleurCombatDelayFrame:SetScript("OnEvent", function()
            for i, funktion in pairs(angleurFunctionsQueueTable) do
                funktion()
                --print("executed: ", funktion)
            end
            angleurFunctionsQueueTable = {}
            angleurCombatDelayFrame:SetScript("OnEvent", nil)
        end)
    else
        funk()
    end
end

function Angleur_PoolDelayer(delay, timeElapsed, elapsedThreshhold, delayFramePool, cycleFunk, endFunk)
    local delayFrame = delayFramePool:Acquire()
    delayFrame:Show()
    delayFrame:SetScript("OnUpdate", function(self, elapsed)
        timeElapsed = timeElapsed + elapsed
        if timeElapsed > elapsedThreshhold then 
            if cycleFunk then 
                if cycleFunk() == true then
                    delayFramePool:Release(self)
                    return
                end
            end
            delay = delay - timeElapsed
            timeElapsed = 0
        end
        if delay <= 0 then
            if endFunk then endFunk() end
            delayFramePool:Release(self)
            return
        end
    end)
end

function Angleur_BetaPrint(text, ...)
    if Angleur_TinyOptions.errorsDisabled == false then
        print(text, ...)
    end
end

function Angleur_BetaDump(dump)
    if Angleur_TinyOptions.errorsDisabled == false then
        DevTools_Dump(dump)
    end
end

function Angleur_BetaTableToString(tbl)
    if Angleur_TinyOptions.errorsDisabled == false then
        local tableToString = ""
        for i, v in pairs(tbl) do
            local element = "[" .. tostring(i) .. ":" .. tostring(v) .. "]"
            tableToString = tableToString .. "  " .. element
        end
        print(tableToString)
    end
end