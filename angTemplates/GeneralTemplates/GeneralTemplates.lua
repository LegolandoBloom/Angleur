local T = Angleur_Translate

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

function Angleur_CheckboxMixin:reposition()
    local width, height = self.text:GetSize()
    local _, _, _, offsetX, offsetY = self:GetPoint()
    self:AdjustPointsOffset(width, 0)
end

Angleur_CombatWeaponSwapButtonMixin = {};

local function isEquipItemValid(itemInfo)
    if C_Item.IsEquippableItem(itemInfo) == false then return false end
    if C_Item.GetItemCount(itemInfo) < 1 then return false end
    return true
end

function Angleur_CombatWeaponSwapButtonMixin:setMacro(swapTable)
    if not swapTable or next(swapTable) == nil then return end
    local _, firstLink = next(swapTable)
    local macroBody = ""
    for location, link in pairs(swapTable) do
        if isEquipItemValid(link) then
            local name = C_Item.GetItemNameByID(link)
            Angleur_BetaPrint("Angleur_CombatWeaponSwapButtonMixin: ", name)
            macroBody = macroBody .. "/equipslot " .. location .. " " .. name .. "\n"
        end
    end
    if not macroBody or not firstLink then return end
    self.icon:SetTexture(C_Item.GetItemIconByID(firstLink))
    self:SetAttribute("macrotext", macroBody)
    self:Show()
    local colorPurple = CreateColor(0.64, 0.3, 0.71)
    Angleur_BetaPrint(colorPurple:WrapTextInColorCode("Angleur_CombatWeaponSwapButtonMixin: ") .. "setMacro: MACRO TEXT\n" , macroBody)
end
