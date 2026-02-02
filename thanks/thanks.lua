local T = Angleur_Translate

local logoTable = {
    youtube = "Interface/AddOns/Angleur/images/youtube.png",
    kofi = "Interface/AddOns/Angleur/images/kofi.png",
    patreon = "Interface/AddOns/Angleur/images/patreon.png",
    NGA = "Interface/AddOns/Angleur/images/NGALogo.png",
}
-- r = 0.94, g = 0.368, b = 0.054 --> legendary orange
-- r = 0.7, g = 0, b = 0.95 --> epic purple
-- r = 1, g = 0.843, b = 0 --> golden
-- r = 0.33, g = 0.92, b = 0.06666 --> devil's green
-- r = 0.82, g = 0.517, b = 0.195 --> coffee
-- r = 0.9, g = 0.082, b = 0.384 --> rosa
local colorWhite = CreateColor(1, 1, 1)
local names = {
    {text = "xScarlife\n", smalltext = "youtube.com/@xScarlifeGaming ", r = 0.94, g = 0.368, b = 0.054, logo = "youtube"},
    {text = "T3chnological", r = 1, g = 0.843, b = 0, logo = nil},
    {text = "Puco", r = 0.72, g = 0.25, b = 1},
    {text = "Trustyulf ", r = 0.62, g = 0.52, b = 0.38, logo = "kofi"},
    {text = "ZamestoTV\n", smalltext = "youtube.com/@ZamestoTV ", r = 0.25, g = 0.78, b = 0.92, logo = "youtube"},
    {text = "Crazyyoungs", r = 0.17, g = 0.52, b = 0.23},
    {text = "Cathtail\n", smalltext = "@cathtail", r = 0.95, g = 0.43, b = 0.59},
    {text = "明天启程 ", r = 1, g = 0.2, b = 0.2, logo = "NGA"},
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
end


local addonsTable = {
    [1] = { 
            icon = "Interface/AddOns/Angleur/images/other-addons/icon-niche.png",
            link = "https://www.curseforge.com/wow/addons/angleur-nicheoptions",
            tooltipPicture = "Interface/AddOns/Angleur/images/other-addons/tooltip-picture-niche.png",
            tooltipPictureWidth = 240,
            tooltipPictureHeight = 120,
            tooltipPictureAnchor = "BOTTOMLEFT",
            tooltipTitle = "Angleur_NicheOptions",
            tooltipText = T["Niche functionality plugin for Angleur. Adding niche user requests through this plugin!"],
    },
    [2] = { 
            icon = "Interface/AddOns/Angleur/images/other-addons/icon-ang-und.png",
            link = "https://www.curseforge.com/wow/addons/angleur-underlight",
            tooltipPicture = "Interface/AddOns/Angleur/images/other-addons/tooltip-picture-ang-und.jpg",
            tooltipPictureWidth = 240,
            tooltipPictureHeight = 120,
            tooltipPictureAnchor = "BOTTOMLEFT",
            tooltipTitle = "Angleur_Underlight",
            tooltipText = T["Automatic Aquatic Form for ALL CLASSES, ALL THE TIME!\n\nEquip Underlight_Angler when swimming, re-equip your \'Main\' Fishing Rod when not."],
    },
    [3] = { 
        icon = "Interface/AddOns/Angleur/images/other-addons/icon-thievery.png",
        link = "https://www.curseforge.com/wow/addons/thievery",
        tooltipPicture = "Interface/AddOns/Angleur/images/other-addons/tooltip-picture-thievery.jpg",
        tooltipPictureWidth = 256,
        tooltipPictureHeight = 64,
        tooltipPictureAnchor = "TOPLEFT",
        tooltipTitle = "Thievery",
        tooltipText = T["Pickpocket overhaul for Rogues!\n\nSingle player RPG-like Pickpocket Prompt System with dynamic keybind(released back when not pick pocketing)."],
    },
    [4] = { 
        icon = "Interface/AddOns/Angleur/images/other-addons/icon-trueform.png",
        link = "https://www.curseforge.com/wow/addons/true-form",
            tooltipPicture = "Interface/AddOns/Angleur/images/other-addons/tooltip-picture-trueform.jpg",
            tooltipPictureWidth = 128,
            tooltipPictureHeight = 128,
            tooltipPictureAnchor = "TOPRIGHT",
            tooltipTitle = "TrueForm",
            tooltipText = T["Two-Way Transformations to Worgens when you cast abilities or use items!\n\nFeatures a built-in drag&drop Macro Maker."],
        },
}
function MyOtherAddons_OnLoad(self)
    local gameVersion = Angleur_CheckVersion()
    if gameVersion == 1 then
        --do nothing
    elseif gameVersion == 2 or gameVersion == 3 then
        addonsTable[2].tooltipPictureAnchor = "BOTTOMLEFT"
    end
    self.title:SetText(T["My Other Addons!"])
    self.addonsTable = addonsTable
    self.lines = 1
    self.columns = 3
    self.spaceBetweenColumns = 20
    self.pageButtonsAnchor = "Bottom"
    self.pageButtonsOffsetY = 5
    self.pageButtonsTextAnchor = "Bottom"
    self.buttonSize = 36
    self:Init()
end