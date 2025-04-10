local T = Angleur_Translate

function Angleur_SetTab2(self)
    local colorYello = CreateColor(1.0, 0.82, 0.0)
    
    local itemTitle = self.contents.extraItems:CreateFontString("$parent_Title", "ARTWORK", "SplashHeaderFont")
    itemTitle:SetPoint("TOP", self.contents.extraItems, "TOP", 0, 10)
    local color = CreateColor(0.67, 0.41, 0)
    itemTitle:SetText(color:WrapTextInColorCode("Extra Items / Macros"))
    local itemHowTo = self.contents.extraItems:CreateFontString("$parent_HowTo", "ARTWORK", "FriendsFont_Normal")
    itemHowTo:SetPoint("TOP", itemTitle, "BOTTOM", 12, -85)
    itemHowTo:SetJustifyH("LEFT")
    itemHowTo:SetJustifyV("TOP")
    itemHowTo:SetNonSpaceWrap(false)
    itemHowTo:SetSize(250, 200)
    itemHowTo:SetText("   " .. colorYello:WrapTextInColorCode("Drag ") .. "a usable " .. colorYello:WrapTextInColorCode("Item ") .. "or a " .. 
    colorYello:WrapTextInColorCode("Macro ") .. "into any of the boxes below.")

    AngleurUI_AdvancedAngling()
end