local T = Angleur_Translate

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
    {text = "T3chnological", r = 1, g = 0.843, b = 0, logo = nil},
    {text = "Puco", r = 0.72, g = 0.25, b = 1},
    {text = "Trustyulf ", r = 0.62, g = 0.52, b = 0.38, logo = "kofi"},
    {text = "ZamestoTV\n", smalltext = "youtube.com/@ZamestoTV", r = 0.25, g = 0.78, b = 0.92, logo = "youtube"},
    {text = "Crazyyoungs", r = 0.17, g = 0.52, b = 0.23},
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
    local colorYello = CreateColor(1.0, 0.82, 0.0)
    self.thanksFrame.title:SetText(T["THANK YOU!"])
    self.thanksFrame.supportMe:SetText(T["You can support the project\nby donating on " .. colorYello:WrapTextInColorCode("Ko-Fi ") .. "or " .. colorYello:WrapTextInColorCode("Patreon!")])
    self.thanksFrame.supportMe:SetJustifyH("LEFT")
    iterateAndAdd(self.thanksFrame, self.thanksFrame.supporters)
    --self.thanksFrame.supporters:SetText("T3chnological")
    --self.thanksFrame.addonUnderlight.icon = "Interface/AddOns/Angleur/images/otheraddonsframe.png"
end


local addonsTable = {
    [1] = { number = 1,
            icon = "Interface/AddOns/Angleur/images/other-addons/icon-ang-und.png",
            link = "https://www.curseforge.com/wow/addons/angleur-underlight",
            tooltipPicture = "Interface/AddOns/Angleur/images/other-addons/tooltip-picture-ang-und.gif",
            tooltipPictureAnchor = "BOTTOMLEFT",
            tooltipTitle = "",
            tooltipText = "",
    },
    [2] = {number = 2, icon = nil},
    [3] = {number = 3},
    [4] = {number = 4},
    [5] = {number = 5},
    [6] = {number = 6},
    [7] = {number = 7},
    [8] = {number = 8},
    [9] = {number = 9},
    [10] = {number = 10},
    [11] = {number = 11},
    [12] = {number = 12},
    [13] = {number = 13},
    [14] = {number = 14},
    [15] = {number = 15},
    -- [16] = {number = 16},
    -- [17] = {number = 17},
    -- [18] = {number = 18},
}
function OtherAddonsTest_OnLoad(self)
    print("which one first?")
    self.addonsTable = addonsTable
    self:Init()
end