-- function Angleur_EventHandler_Audio(self, event, unit, ...)

-- end

-- local audioHandlerFrame = CreateFrame("Frame")
-- audioHandlerFrame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
-- audioHandlerFrame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP")
-- audioHandlerFrame:SetScript("OnEvent", )



function Angleur_CastTimer(spellID)
    if not AngleurAudio.checkboxes.recastReminder then return end
    local channelInfo = {UnitChannelInfo("player")}
    if not channelInfo then return end
    local spellIDFromUnit = Angleur_ScrubSecret(channelInfo[8])
    if not spellIDFromUnit or spellIDFromUnit ~= spellID then 
        print("This is not the same spell")
        return 
    end
    print("Channel duration is: " )
    local durationObject = UnitChannelDuration("player")
    DevTools_Dump(durationObject:GetTotalDuration())
    DevTools_Dump(durationObject:GetClockTime())
    DevTools_Dump(durationObject:GetEndTime())
    -- TODO: set a delayer that will play the sound effect upon expiry
end

-- /dump UnitChannelDuration("player")


SLASH_ANGLEURDEST1 = "/dest"
SlashCmdList["ANGLEURDEST"] = function() 
    local teeburu = {"Bee", 2, "Dickbag"}
    print(Angleur_IsSecret(teeburu))
    DevTools_Dump(Angleur_ScrubSecret(teeburu))

    DevTools_Dump(Angleur_ScrubSecret(teeburu[3]))
    DevTools_Dump(Angleur_ScrubSecret(teeburu[4]))
end