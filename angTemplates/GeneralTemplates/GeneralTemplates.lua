Angleur_CheckboxMixin = {};

function Angleur_CheckboxMixin:greyOut()
    self:SetChecked(false)
    self:Disable()
    self.text:SetTextColor(0.9, 0.9, 0.9)
    self.disabledText:Show()
    if self.dropDown then
        self.dropDown:Hide()
    end
end

Angleur_CombatWeaponSwapButtonMixin = {};

function Angleur_CombatWeaponSwapButtonMixin:setMacro(swapTable)
    if not swapTable or next(swapTable) == nil then return end
    local _, firstItemID = next(swapTable)
    local macroBody = ""
    for location, itemID in pairs(swapTable) do
        local GUID = C_TooltipInfo.GetOwnedItemByID(itemID).guid
        if GUID then
            local name = C_Item.GetItemName(C_Item.GetItemLocation(GUID))
            Angleur_BetaPrint("Angleur_CombatWeaponSwapButtonMixin: ", name)
            macroBody = macroBody .. "/equipslot " .. location .. " " .. name
        end
    end
    if not macroBody or not firstItemID then return end
    self.icon:SetTexture(C_Item.GetItemIconByID(firstItemID))
    self:SetAttribute("macrotext", macroBody)
    self:Show()
    Angleur_BetaPrint("Angleur_CombatWeaponSwapButtonMixin:setMacro: MACRO TEXT" , macroBody)
end
