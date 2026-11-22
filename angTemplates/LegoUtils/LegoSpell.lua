if not LegolandoUtil then return end
if LegolandoUtil.Spell then return end

LegolandoUtil.Spell = {}
local LSec = LegolandoUtil.Secret
local LSpell = LegolandoUtil.Spell



function LSpell:GetNonSecretActiveAuraDataFromSpell(spellID)
    if not spellID then return end
    local spellInfo = LSec.ScrubSecret(C_Spell.GetSpellInfo(spellID))
    if not spellInfo then return end
    local name = LSec.ScrubSecret(spellInfo.name)
    if not name then return end
    -- Can't get auraData from SpellID, have to have name
    local auraData = C_UnitAuras.GetAuraDataBySpellName("player", name)
    if not auraData or LSec:IsSecret(auraData) then return end
    -- return spellAuraID as well, as it's needed for print in ExtraItems_Auras
    return auraData
end