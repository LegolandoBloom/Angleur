local T = Angleur_Translate

Legolando_PictureTooltipMixin = {}

function Legolando_PictureTooltipMixin:OnShow()
    self:SetPadding(self.paddingL, self.paddingB, self.paddingR, self.paddingT)
end

function Legolando_PictureTooltipMixin:PlaceTexture(texturePath, width, height, anchor, padOffsetX, padOffsetY)
    if not texturePath then return end
    self.texture:ClearAllPoints()
    self.texture:SetTexture(texturePath)
    self.texture:SetSize(width, height)
    self.texture:SetPoint(anchor, self, anchor)
    self:ResetPadding()
    if anchor == "TOPLEFT" then
        self.paddingL = width + padOffsetX
        self.paddingT = height + padOffsetY
    elseif anchor == "TOPRIGHT" then
        self.paddingR = width + padOffsetX
        self.paddingT = height + padOffsetY
    elseif anchor == "BOTTOMLEFT" then
        self.paddingL = width + padOffsetX
        self.paddingB = height + padOffsetY
    elseif anchor == "BOTTOMRIGHT" then
        self.paddingR = width + padOffsetX
        self.paddingB = height + padOffsetY
    end
end

function Legolando_PictureTooltipMixin:ResetPadding()
    self.paddingL = 0
    self.paddingB = 0
    self.paddingR = 0
    self.paddingT = 0
end

function Legolando_PictureTooltipMixin:OnHide()
    self.texture:SetTexture(nil)
    self.texture:ClearAllPoints()
    self:ResetPadding()    
end


Angleur_CheckboxFrameMixin = {};

function Angleur_CheckboxFrameMixin:greyOut()
    self.checkbox:SetChecked(false)
    self.checkbox:Disable()
    self.text:SetTextColor(0.9, 0.9, 0.9)
    self.disabledText:Show()
    if self.dropDown then
        self.dropDown:Hide()
    end
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
            Angleur_BetaPrint(4, "Angleur_CombatWeaponSwapButtonMixin: ", name)
            macroBody = macroBody .. "/equipslot " .. location .. " " .. name .. "\n"
        end
    end
    if not macroBody or not firstLink then return end
    self.icon:SetTexture(C_Item.GetItemIconByID(firstLink))
    self:SetAttribute("macrotext", macroBody)
    self:Show()
    local colorPurple = CreateColor(0.64, 0.3, 0.71)
    Angleur_BetaPrint(4, colorPurple:WrapTextInColorCode("Angleur_CombatWeaponSwapButtonMixin: ") .. "setMacro: MACRO TEXT\n" , macroBody)
end
