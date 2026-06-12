local category = Settings.RegisterVerticalLayoutCategory("Angleur")

local function OnSettingChanged(setting, value)
	-- This callback will be invoked whenever a setting is modified.
	print("Setting changed:", setting:GetVariable(), value)
    Angleur_ToggleMinimapButton(value)
end

function Angleur_LoadAddonsTab()
    
    do 
        -- RegisterAddOnSetting example. This will read/write the setting directly
        -- to `MyAddOn_SavedVars.toggle`.

        local name = "Show Minimap Button"
        local variable = "Angleur_ShowMinimap"
        local variableKey = "show"
        local variableTbl = AngleurMinimapButton
        local defaultValue = false

        local setting = Settings.RegisterAddOnSetting(category, variable, variableKey, variableTbl, type(defaultValue), name, defaultValue)
        setting:SetValueChangedCallback(OnSettingChanged)

        local tooltip = "This is a tooltip for the checkbox."
        local cbox = Settings.CreateCheckbox(category, setting, tooltip)
        print(cbox)
    end

    -- do
    --     -- RegisterProxySetting example. This will run the GetValue and SetValue
    --     -- callbacks whenever access to the setting is required.

    --     local name = "Test Slider"
    --     local variable = "MyAddOn_Slider"
    --     local defaultValue = 180
    --     local minValue = 90
    --     local maxValue = 360
    --     local step = 10 

    --     local function GetValue()
    --         return MyAddOn_SavedVars.slider or defaultValue
    --     end

    --     local function SetValue(value)
    --         MyAddOn_SavedVars.slider = value
    --     end

    --     local setting = Settings.RegisterProxySetting(category, variable, type(defaultValue), name, defaultValue, GetValue, SetValue)
    --     setting:SetValueChangedCallback(OnSettingChanged)

    --     local tooltip = "This is a tooltip for the slider."
    --     local options = Settings.CreateSliderOptions(minValue, maxValue, step)
    --     options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
    --     Settings.CreateSlider(category, setting, options, tooltip)
    -- end

    Settings.RegisterAddOnCategory(category)
end
