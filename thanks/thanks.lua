-- 'ang' is the angleur namespace
local addonName, ang = ...
local lego = ang.lego

local T = Angleur_Translate

local FRAMEHEIGHT_WITH_SMALLTEXT = 36
local FRAMEHEIGHT_WITHOUT_SMALLTEXT = 28

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
    [1] = {text = "xScarlife\n", smallText = "youtube.com/@xScarlifeGaming ", r = 0.94, g = 0.368, b = 0.054, logo = "youtube"},
    [2] = {text = "T3chnological", r = 1, g = 0.843, b = 0, logo = nil},
    [3] = {text = "Puco", r = 0.72, g = 0.25, b = 1},
    [4] = {text = "Trustyulf ", r = 0.62, g = 0.52, b = 0.38, logo = "kofi"},
    [5] = {text = "ZamestoTV\n", smallText = "youtube.com/@ZamestoTV ", r = 0.25, g = 0.78, b = 0.92, logo = "youtube"},
    [6] = {text = "Crazyyoungs", r = 0.17, g = 0.52, b = 0.23},
    [7] = {text = "Cathtail\n", smallText = "@cathtail", r = 0.95, g = 0.43, b = 0.59},
    [8] = {text = "明天启程 ", r = 1, g = 0.2, b = 0.2, logo = "NGA"},
    [9] = {text = "RaemMoreay ", r = 0.54, g = 0.54, b = 0.95, logo = "kofi"},
    [10] = {text = "Moloch ", r = 1.00, g = 0.96, b = 0.41, logo = "kofi"},
    [11] = {text = "东南西北\n", smallText = "VX:bsx117733 ", r = 1.00, g = 0.76, b = 0.5},
}

local function createScrollBox(thanksFrame)
    local ScrollBox = CreateFrame("Frame", "Angleur_Thanks_ScrollBox", thanksFrame, "WowScrollBoxList")
    ScrollBox:SetPoint("TOPLEFT", thanksFrame, "TOPLEFT", 30, -78)
    ScrollBox:SetSize(230, 280)
    local ScrollBar = CreateFrame("EventFrame", "Angleur_Thanks_ScrollBar", thanksFrame, "MinimalScrollBar")
    ScrollBar:SetPoint("TOPLEFT", ScrollBox, "TOPRIGHT")
    ScrollBar:SetPoint("BOTTOMLEFT", ScrollBox, "BOTTOMRIGHT")
    local ScrollView = CreateScrollBoxListTreeListView()
    ScrollUtil.InitScrollBoxListWithScrollBar(ScrollBox, ScrollBar, ScrollView)

    ScrollView:SetElementExtentCalculator(function(dataIndex, data)
    local smallText = data.data.smallText
    if smallText then
        data.heightExtent = FRAMEHEIGHT_WITH_SMALLTEXT
    else
        data.heightExtent = FRAMEHEIGHT_WITHOUT_SMALLTEXT
    end
    return data.heightExtent
end)

    local function Initializer(frame, node)
        local data = node:GetData()
        local color, text, smallText, logo = CreateColor(data.r, data.g, data.b), data.text, data.smallText, data.logo
        local logoAnchor = frame.text
        frame.text:SetText(color:WrapTextInColorCode(text))
        if smallText then
            frame:SetSize(100, FRAMEHEIGHT_WITH_SMALLTEXT)
            frame.smallText:SetText(colorWhite:WrapTextInColorCode(smallText))
            frame.smallText:Show()
            logoAnchor = frame.smallText
        else
            frame:SetSize(100, FRAMEHEIGHT_WITHOUT_SMALLTEXT)
            frame.smallText:SetText()
            frame.smallText:Hide()
        end
        if logo then
            frame.logo:ClearAllPoints()
            frame.logo:SetTexture(logoTable[logo])
            frame.logo:SetPoint("LEFT", logoAnchor, "RIGHT")
            frame.logo:Show()
        else
            frame.logo:ClearAllPoints()
            frame.logo:SetTexture()
            frame.logo:Hide()
        end
    end
    ScrollView:SetElementInitializer("Angleur_ThanksFrame_SupporterNameTemplate", Initializer)

    local dataProvider = CreateTreeDataProvider()
    ScrollView:SetDataProvider(dataProvider)
    return dataProvider
end
-- print(color:WrapTextInColorCode("What what test what"))
local function addToScrollBox(thanksFrame, dataProvider)
    lego.table_randomSort(names)
    for i, v in pairs(names) do
        dataProvider:Insert(v)
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
    local dataProvider = createScrollBox(self.thanksFrame)
    addToScrollBox(self.thanksFrame, dataProvider)
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