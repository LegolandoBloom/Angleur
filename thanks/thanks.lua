

local logoTable = {
    youtube = "Interface/AddOns/Angleur/images/youtube.png",
    kofi = "Interface/AddOns/Angleur/images/kofi.png",
    patreon = "Interface/AddOns/Angleur/images/patreon.png"
}
-- r = 0.94, g = 0.368, b = 0.054 --> legendary orange
-- r = 0.7, g = 0, b = 0.95 --> epic purple
-- r = 1, g = 0.843, b = 0 --> golden
-- r = 0.33, g = 0.92, b = 0.06666 --> devil's green
-- r = 0.82, g = 0.517, b = 0.195 --> coffee
-- r = 0.9, g = 0.082, b = 0.384 --> rosa
local names = {
    {text = "xScarlife\n", smalltext = "youtube.com/@xScarlifeGaming", r = 0.94, g = 0.368, b = 0.054, logo = "youtube"},
    {text = "T3chnological", r = 1, g = 0.843, b = 0, logo = nil}
}

local function iterateAndAdd(parent, anchorFrame)
    local nextAnchor = anchorFrame
    local colorWhite = CreateColor(1, 1, 1)
    for i, v in pairs(names) do
        local name = parent:CreateFontString(nil, "ARTWORK", "FriendsFont_Normal")
        local color = CreateColor(v.r, v.g, v.b)
        name:SetText(color:WrapTextInColorCode(v.text))
        name:SetPoint("TOPLEFT", nextAnchor, "BOTTOMLEFT", 0, -9)
        nextAnchor = name
        local logoAnchor = name

        if v.smalltext then
            local smallText = parent:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
            smallText:SetText(colorWhite:WrapTextInColorCode(v.smalltext))
            smallText:SetPoint("TOPLEFT", name, "BOTTOMLEFT", 0, 10)
            logoAnchor = smallText
        end

        if v.logo then
            local appLogo = parent:CreateTexture(nil, "ARTWORK")
            appLogo:SetSize(24, 24)
            appLogo:SetTexture(logoTable[v.logo])
            appLogo:SetPoint("LEFT", logoAnchor, "RIGHT")
        end
    end
end
--ko-fi.com/legolando
--patreon.com/Legolando
function Angleur_Thanks_OnLoad(self)
    local configPanel = self:GetParent()
    configPanel:HookScript("OnHide", function()
        self.thanksFrame:Hide()
    end)
    local colorYellow = CreateColor(1.0, 0.82, 0.0)
    self.thanksFrame.title:SetText("THANK YOU!")
    self.thanksFrame.supportMe:SetText("You can support the project\nby donating on " .. colorYellow:WrapTextInColorCode("Ko-Fi ") .. "or " .. colorYellow:WrapTextInColorCode("Patreon!"))
    self.thanksFrame.supportMe:SetJustifyH("LEFT")
    iterateAndAdd(self.thanksFrame, self.thanksFrame.supporters)
    --self.thanksFrame.supporters:SetText("T3chnological")
end
