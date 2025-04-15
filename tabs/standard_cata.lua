local T = Angleur_Translate
local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

AngleurStandardPanelCata = {}
local cata = AngleurStandardPanelCata

local function DropDown_CreateTitle(self, titleText)
    local info = UIDropDownMenu_CreateInfo()
    info.text = titleText
    info.isTitle = true
    UIDropDownMenu_AddButton(info)
end

local function BaitDropDownOnClick(self)
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.baitEnable.dropDown, self:GetID())
    AngleurConfig.chosenBait.dropDownID = self:GetID()
    --AngleurConfig.chosenBait.name = angleurItems.ownedBait[self:GetID()].name --> Changed into the below for localisation
    AngleurConfig.chosenBait.itemID = angleurItems.ownedBait[self:GetID()].itemID
    Angleur_SetSelectedItem(angleurItems.selectedBaitTable, angleurItems.ownedBait, AngleurConfig.chosenBait.itemID)
end

local baitTitleSet = false
local function InitializeDropDownBait(self, level)
    if not baitTitleSet then
        DropDown_CreateTitle(self, T["Bait"])
        baitTitleSet = true
        return
    end
    Angleur_CheckOwnedItems(angleurItems.selectedBaitTable, angleurItems.ownedBait, angleurItems.baitPossibilities)
    Angleur_SetSelectedItem(angleurItems.selectedBaitTable, angleurItems.ownedBait, AngleurConfig.chosenBait.itemID)
    --Contents
    for i, bait in pairs(angleurItems.ownedBait) do
        info = UIDropDownMenu_CreateInfo()
        info.text = bait.name
        info.value = bait.name
        info.func = BaitDropDownOnClick
        UIDropDownMenu_AddButton(info)
    end
    UIDropDownMenu_SetSelectedID(Angleur.configPanel.tab1.contents.baitEnable.dropDown, angleurItems.selectedBaitTable.dropDownID)
end

function cata:ExtraButtons(tab1contents)
    tab1contents.baitEnable.text:SetText(T["Bait"])
    tab1contents.baitEnable:reposition()
    tab1contents.baitEnable.disabledText:SetText(T["Couldn't find any bait \n in your bags, feature disabled"])
    tab1contents.baitEnable:SetScript("OnClick", function(self)
        if self:GetChecked() then
            AngleurConfig.baitEnabled = true
            self.dropDown:Show()
        elseif self:GetChecked() == false then
            AngleurConfig.baitEnabled = false
            self.dropDown:Hide()
        end
    end)

    UIDropDownMenu_Initialize(tab1contents.baitEnable.dropDown, InitializeDropDownBait)
    UIDropDownMenu_SetWidth(tab1contents.baitEnable.dropDown, 100)
    UIDropDownMenu_SetButtonWidth(tab1contents.baitEnable.dropDown, 124)
    UIDropDownMenu_SetSelectedID(tab1contents.baitEnable.dropDown, 1)
    UIDropDownMenu_JustifyText(tab1contents.baitEnable.dropDown, "LEFT")
    if AngleurConfig.baitEnabled == true then
        tab1contents.baitEnable:SetChecked(true)
        tab1contents.baitEnable.dropDown:Show()
    end
    DropDown_CreateTitle(tab1contents.baitEnable.dropDown, T["Bait"])
end