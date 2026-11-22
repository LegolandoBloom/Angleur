if not LegolandoUtil then return end
if LegolandoUtil.UI then return end

LegolandoUtil.UI = {}

local LUI = LegolandoUtil.UI

function LUI.SetupGenericBlizzMenuDropdown(parent, savedVarTable, reference, title, defaultText, elementTable, isSelectedCallback, setSelectedCallback)
    if not savedVarTable or not reference then
        print("LUI.SetupGenericDropdown: Table or reference missing")
        return
    end
    if not elementTable then
        print("LUI.SetupGenericDropdown: Element table missing")
        return
    end
    
    local function BlizzMenuDD_IsSelected(index)
        local isSelected = index == savedVarTable[reference]
        if not isSelected then return false end
        if isSelectedCallback then
            isSelectedCallback(index)
        end
        return true
    end
    local function BlizzMenuDD_SetSelected(index)
        savedVarTable[reference] = index
        if setSelectedCallback then
            setSelectedCallback(index)
        end
    end
    local function BlizzMenuDD_GeneratorFunction(owner, rootDescription)
        rootDescription:CreateTitle(title)
        for index = 1, #elementTable do
            local elementdescription = rootDescription:CreateRadio(elementTable[index], BlizzMenuDD_IsSelected, BlizzMenuDD_SetSelected, index)
        end
    end
    local dropdown = CreateFrame("DropdownButton", nil, parent, "WowStyle1DropdownTemplate")
    dropdown:SetDefaultText(defaultText)
    dropdown:SetupMenu(BlizzMenuDD_GeneratorFunction)
    return dropdown
end