Angleur_ExtraItemAuraFallbackRefreshThreshold = 30
Angleur_LastFishingChannelDuration = nil

function Angleur_ClearFishingChannelDuration()
    Angleur_LastFishingChannelDuration = nil
end

function Angleur_SetFishingChannelDuration(durationSeconds)
    if type(durationSeconds) ~= "number" or durationSeconds <= 0 then
        return
    end

    Angleur_LastFishingChannelDuration = durationSeconds
end

function Angleur_UpdateFishingChannelDurationFromUnit(unit)
    local _, _, _, startTimeMs, endTimeMs = UnitChannelInfo(unit or "player")
    if not startTimeMs or not endTimeMs then
        Angleur_ClearFishingChannelDuration()
        return false
    end

    Angleur_SetFishingChannelDuration((endTimeMs - startTimeMs) / 1000)
    return true
end

function Angleur_GetExtraItemAuraRefreshThreshold()
    return Angleur_LastFishingChannelDuration or Angleur_ExtraItemAuraFallbackRefreshThreshold
end

function Angleur_GetExtraItemAuraRemainingDuration(auraData, currentTime)
    if not auraData then return nil end

    local expirationTime = auraData.expirationTime
    if not expirationTime or expirationTime == 0 then
        return nil
    end

    return expirationTime - currentTime
end

function Angleur_ShouldBlockExtraItemAuraReuse(auraData, currentTime, refreshThreshold)
    if not auraData then
        return false
    end

    local remainingDuration = Angleur_GetExtraItemAuraRemainingDuration(auraData, currentTime)
    if remainingDuration == nil then
        return true
    end

    return remainingDuration >= (refreshThreshold or Angleur_GetExtraItemAuraRefreshThreshold())
end

function Angleur_DoesExtraItemAuraBlockReuse(slot)
    local spellAuraID
    if slot.spellID ~= 0 then
        spellAuraID = slot.spellID
    elseif slot.macroSpellID ~= 0 then
        spellAuraID = slot.macroSpellID
    else
        return false
    end

    local spellInfo = C_Spell.GetSpellInfo(spellAuraID)
    if not spellInfo or not spellInfo.name then
        return false
    end

    local auraData = C_UnitAuras.GetAuraDataBySpellName("player", spellInfo.name)
    return Angleur_ShouldBlockExtraItemAuraReuse(auraData, GetTime())
end
