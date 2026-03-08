local T = Angleur_Translate

local debugChannel = 5

function Angleur_SetTab2(self)
    local colorYello = CreateColor(1.0, 0.82, 0.0)
    
    local itemTitle = self.contents.extraItems:CreateFontString("$parent_Title", "ARTWORK", "SplashHeaderFont")
    itemTitle:SetPoint("TOP", self.contents.extraItems, "TOP", 0, 10)
    local color = CreateColor(0.67, 0.41, 0)
    itemTitle:SetText(color:WrapTextInColorCode(T["Extra Items / Macros"]))
    local itemHowTo = self.contents.extraItems:CreateFontString("$parent_HowTo", "ARTWORK", "FriendsFont_Normal")
    itemHowTo:SetPoint("TOP", itemTitle, "BOTTOM", 12, -85)
    itemHowTo:SetJustifyH("LEFT")
    itemHowTo:SetJustifyV("TOP")
    itemHowTo:SetNonSpaceWrap(false)
    itemHowTo:SetSize(250, 200)
    itemHowTo:SetText(T["   " .. colorYello:WrapTextInColorCode("Drag ") .. "a usable " .. colorYello:WrapTextInColorCode("Item ") .. "or a " .. 
    colorYello:WrapTextInColorCode("Macro ") .. "into any of the boxes above."])

    self.contents.extraItems[1].timeButton.tooltipText = T["Set Timer"]
    self.contents.extraItems[2].timeButton.tooltipText = T["Set Timer"]
    self.contents.extraItems[3].timeButton.tooltipText = T["Set Timer"]

    self.contents.equipmentButton.tooltipText = T["Toggle Equipment"]
    self.contents.bagsButton.tooltipText = T["Toggle Bags"]
    self.contents.macroButton.tooltipText = T["Open Macros"]

    AngleurUI_AdvancedAngling()
end