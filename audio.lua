-- 'ang' is the angleur namespace
local addonName, ang = ...


local debugChannel = 9
local colorDebug = CreateColor(0.29, 1, 0) -- bright green

PHASE1_SUBTRACTAMOUNT = 0.5
PHASE2_DURATION = 2
DELAYER_THRESHOLD = 0.5

INFO_SPELLID_INDEX = 8

-- function Angleur_EventHandler_Audio(self, event, unit, ...)

-- end
-- local audioHandlerFrame = CreateFrame("Frame")
-- audioHandlerFrame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
-- audioHandlerFrame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP")
-- audioHandlerFrame:SetScript("OnEvent", )

local getChannelDuration
if ang.gameVersion == 1 or ang.gameVersion == 2 then
    getChannelDuration = function()
        local durationObject = UnitChannelDuration("player")
        local channelDuration = durationObject:GetTotalDuration()
        return channelDuration
    end
elseif ang.gameVersion == 3 then
    getChannelDuration = function()
        local _, _, _, startTimeMs, endTimeMs = UnitChannelInfo("player")
        local durationMs = endTimeMs - startTimeMs
        local channelDuration = durationMs/1000
        Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Recast Reminder: ") .. "Classic channel duration: ", channelDuration)
        return channelDuration
    end
end

local reminderDelayer = CreateFrame("Frame")
-- 0 -> inactive | 1 -> first part active(waiting until channel ends) | 2 ->  second part active(waiting an arbitrary amount until audio warning)
local scriptPhase = 0
local function _phase2()
    scriptPhase = 2
    Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Recast Reminder: ") .. "Phase 1 complete, starting phase 2")
    Angleur_SingleDelayer(PHASE2_DURATION, 0, DELAYER_THRESHOLD, reminderDelayer, nil, function()
        scriptPhase = 0
        Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Recast Reminder: ") .. "Phase 2 complete, playing sound")
        PlaySoundFile("Interface/AddOns/Angleur/sounds/angleurFailRecast.ogg")
    end)
end
local function _phase1(channelDuration)
    scriptPhase = 1
    Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Recast Reminder: ") .. "Phase 1 Delayer duration: ", channelDuration)
    -- TODO: set a delayer that will play the sound effect upon expiry
    Angleur_SingleDelayer(channelDuration, 0, DELAYER_THRESHOLD, reminderDelayer, nil, function()
        _phase2()
    end)
end

function Angleur_RecastReminder_Start(spellID)
    if not AngleurAudio.checkboxes.recastReminder then return end
    local channelInfo = {UnitChannelInfo("player")}
    if not channelInfo then return end
    local spellIDFromUnit = Angleur_ScrubSecret(channelInfo[INFO_SPELLID_INDEX])
    if not spellIDFromUnit or spellIDFromUnit ~= spellID then 
        Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Recast Reminder: ") .. "Channeled spell isn't fishing. Don't start.")
        return
    end
    if scriptPhase == 2 then
        reminderDelayer:SetScript("OnUpdate", nil)
        scriptPhase = 0
        Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Recast Reminder: ") .. "Phase 2 ended prematurely, removing script.")
    end

    local channelDuration = getChannelDuration()
    if not channelDuration then Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Recast Reminder: ") .. "Channel duration nil. Returning.") return end
    channelDuration = channelDuration - PHASE1_SUBTRACTAMOUNT
    if channelDuration <= 0 then
        Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Recast Reminder: ") .. "Channel too short, not starting phase 1 of delayer. (" .. channelDuration .. ")")
        return
    end
    _phase1(channelDuration)
end

function Angleur_RecastReminder_Stop()
    if scriptPhase ~= 1 then return end
    Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Recast Reminder: ") .. "Phase 1 ended prematurely, removing script.")
    reminderDelayer:SetScript("OnUpdate", nil)
    scriptPhase = 0
end

-- SLASH_ANGLEURAUDIOTEST1 = "/atest"
-- SlashCmdList["ANGLEURAUDIOTEST"] = function() 
--     PlaySoundFile("Interface/AddOns/Angleur/sounds/angleurFailRecast.ogg")
-- end