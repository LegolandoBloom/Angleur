if not LegolandoUtil then return end
if LegolandoUtil.UI then return end

LegolandoUtil.UI = {}

local LUI = LegolandoUtil.UI

function LUI.SetupGenericBlizzMenuDropdown(parent, savedVarTable, reference, title, defaultText, elementTable, isSelectedCallback, setSelectedCallback, onClickCallback)
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
    local dropdown = CreateFrame("DropdownButton", nil, parent, "WowStyle1DropdownTemplate")
    dropdown.elementTable = elementTable
    local function BlizzMenuDD_GeneratorFunction(dd, rootDescription)
        if not dd.elementTable or next(dd.elementTable) == nil then return end
        print("Generator function called", #(dd.elementTable))
        print("Element Table")
        DevTools_Dump(dd.elementTable)
        print("done")
        rootDescription:CreateTitle(title)
        for index = 1, #(dd.elementTable) do
            print("index:", index)
            local elementdescription = rootDescription:CreateRadio(dd.elementTable[index], BlizzMenuDD_IsSelected, BlizzMenuDD_SetSelected, index)
            elementdescription:SetOnEnter(function()
                print("hai")
            end)
            elementdescription:AddInitializer(function(button, description, menu)
            end);
        end
    end

    dropdown:SetDefaultText(defaultText)
    dropdown:SetupMenu(BlizzMenuDD_GeneratorFunction)

    function dropdown:RefreshElements(newElementTable)
        print("Refreshing Elements")
        dropdown.elementTable = newElementTable
        dropdown:SetupMenu(BlizzMenuDD_GeneratorFunction)
    end

    if onClickCallback then
        dropdown:RegisterForClicks("AnyUp", "AnyDown")
        dropdown:HookScript("PreClick", onClickCallback)
    end
    
    return dropdown
end