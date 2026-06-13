local T = Angleur_Translate


-- Going with vertical-layout-category for now, might implement a canvas category later instead
-- (Canvas provides more control)
function Angleur_LoadAddonsTab()
    local category, layout = Settings.RegisterVerticalLayoutCategory("Angleur")
    
    do 
        local name = "Show Minimap Button"
        local variable = "Angleur_ShowMinimap"
        local variableKey = "show"
        local variableTbl = AngleurMinimapButton
        local defaultValue = false


        local function OnSettingChanged(setting, value)
            -- print("Setting changed:", setting:GetVariable(), value)
            Angleur_ToggleMinimapButton(value)
        end
        local setting = Settings.RegisterAddOnSetting(category, variable, variableKey, variableTbl, type(defaultValue), name, defaultValue)
        setting:SetValueChangedCallback(OnSettingChanged)

        local tooltip = "This is a tooltip for the checkbox."
        local cbox = Settings.CreateCheckbox(category, setting, tooltip)
    end

    do
        local buttonText, addSearchTags = T["Open Config Panel"], true
        local tooltip = T["You need to open the Config Panel to change Angleur's settings!"
        .. "\n\n(Hint) You can also:\n - type /ang\n - Double-Click the Angleur Visual\n - Click the Minimap/AddonCompartment Button\nto open it."]
        local function onButtonClick(self)
            local left, bottom = self:GetRect()
            Angleur.configPanel:ClearAllPoints()
            Angleur.configPanel:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left, bottom - 30)
            Angleur.configPanel:Raise()
            if not Angleur.configPanel:IsShown() then Angleur.configPanel:Show() end
        end
        layout:AddInitializer(CreateSettingsButtonInitializer("", buttonText, onButtonClick, tooltip, addSearchTags))
    end

    Settings.RegisterAddOnCategory(category)
end

-- print("Settings: ")
-- DevTools_Dump(category:GetID())
-- DevTools_Dump(Settings.GetCategory(category:GetID()))
-- DevTools_Dump(category:GetCategorySet())
-- DevTools_Dump(category:GetName())
-- DevTools_Dump(Settings.GetSetting("Angleur_ShowMinimap"))