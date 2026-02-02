-- 'ang' is the angleur namespace
local addonName, ang = ...

-- 0: All
-- 1: Angleur.lua & Angleur.xml(+ Classic variants)
-- 2: toys
-- 3: items 
-- 4: eqMan + General Templates(CombatWeaponSwap portion)
-- 5: tabs
-- 6: doubleClick
-- 7: bobberScanner


-- 20: Angleur_Underlight
-- 21: Angleur_NicheOptions

-- Can also be combined as a table, like: ang.debugLevel = {1, 2, 5}

ang.debugLevel = 0

local debugLevels = {
    [0] = "All",
    [1] = "Main Action Handler",
    [2] = "Toys",
    [3] = "Items",
    [4] = "Equipment Manager",
    [5] = "UI Tabs",
    [6] = "Double Click",
    [7] = "Bobber Scanner",
}

function Angleur_SetupDebugUI(debugCheckboxFrame)
    local function isSelected(index) 
        local isSelected = index == Angleur_TinyOptions.debugLevel
        if not isSelected then return false end

        return true
    end
    local function setSelected(index)
        Angleur_TinyOptions.debugLevel = index
        ang.debugLevel = index
        print("Debug Level: ", debugLevels[index], "has been selected")
    end
    local function generatorFunction(owner, rootDescription)
        rootDescription:CreateTitle("Debug Level")
        for index = 0, 7 do
            local elementdescription = rootDescription:CreateRadio(debugLevels[index], isSelected, setSelected, index)
        end
    end
    debugCheckboxFrame.dropdown = CreateFrame("DropdownButton", nil, debugCheckboxFrame, "WowStyle1DropdownTemplate")
    debugCheckboxFrame.dropdown:SetDefaultText("Debug Level")
    debugCheckboxFrame.dropdown:SetSize(100, 30)
    debugCheckboxFrame.dropdown:SetPoint("LEFT", debugCheckboxFrame.checkbox, "RIGHT", 0, 0)
    debugCheckboxFrame.dropdown:SetupMenu(generatorFunction)
    debugCheckboxFrame.dropdown:SetScale(0.8)
    debugCheckboxFrame.dropdown:Hide()
end