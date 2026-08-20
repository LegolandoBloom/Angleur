local function getFolderPath()
    local stack = debugstack()
    local _, _, luafilepath = string.find(stack, "[%[](.-)[%]]")
    -- print("lue file's path: ", luafilepath)
    local i = 1
    local lastPart
    while string.find(luafilepath, "([/].+)", i) do
        local startPoint, endPoint
        startPoint, endPoint, lastPart = string.find(luafilepath, "([/].+)", i)
        i = startPoint + 1
        -- print(s, startPoint, endPoint, "\n")
    end
    -- print("part to remove: ", lastPart)
    local afterRemoval = string.gsub(luafilepath, lastPart, "")
    -- print("After removal: ", afterRemoval)
    return afterRemoval
end
local folderPath = getFolderPath()
local borderPath =  folderPath .. "/UI-SliderBar-Border"
local thumbHorizontalPath = folderPath .. "/UI-SliderBar-Button-Horizontal-CROPPED.png"
local thumbVerticalPath = folderPath .. "/UI-SliderBar-Button-Vertical-CROPPPED.png"

Legolando_ResizableSliderBarMixin_Angleur = {}

function Legolando_ResizableSliderBarMixin_Angleur:OnLoad()
    self.TopLeftCorner:SetTexture(borderPath)
    self.TopRightCorner:SetTexture(borderPath)
    self.TopEdge:SetTexture(borderPath)
    self.BottomLeftCorner:SetTexture(borderPath)
    self.BottomRightCorner:SetTexture(borderPath)
    self.BottomEdge:SetTexture(borderPath)
    self.LeftEdge:SetTexture(borderPath)
    self.RightEdge:SetTexture(borderPath)
end



Legolando_SliderColorFillMixin_Angleur = {}

-- To reduce the border texture size so that thumb can reach "further"
local THUMB_EXTENDER = 7
-- the width of the visible part of the border lines so that fill doesn't go over them
local FILL_BORDEROFFSET = 3

-- I can ride my bike with no:
local function _handleBar(slider, isHorizontal)
    local sliderX, sliderY = slider:GetSize()
    if isHorizontal then
        slider.bar:SetSize(sliderX - THUMB_EXTENDER, sliderY)
    else
        slider.bar:SetSize(sliderX, sliderY - THUMB_EXTENDER)
    end
end
local function _handleFill(slider, isHorizontal)
    -- Need to clear all points because textures are automatically given a point anyway, even if not specified
    slider.bar.fill:ClearAllPoints()
    if isHorizontal then
        if slider.fillFromStart then
            -- slider.bar.fill:SetSize(0, barY - FILL_BORDEROFFSET)
            slider.bar.fill:SetPoint("LEFT", slider.bar, "LEFT", FILL_BORDEROFFSET, 0)
            slider.bar.fill:SetPoint("RIGHT", slider.thumb, "CENTER")
            slider.bar.fill:SetPoint("TOP", slider.bar, "TOP", 0, - FILL_BORDEROFFSET)
            slider.bar.fill:SetPoint("BOTTOM", slider.bar, "BOTTOM", 0, FILL_BORDEROFFSET)
        else
            -- slider.bar.fill:SetSize(barX - FILL_BORDEROFFSET, barY - FILL_BORDEROFFSET)
            slider.bar.fill:SetPoint("RIGHT", - FILL_BORDEROFFSET, 0)
            slider.bar.fill:SetPoint("LEFT", slider.thumb, "CENTER")
            slider.bar.fill:SetPoint("TOP", slider.bar, "TOP", 0, - FILL_BORDEROFFSET)
            slider.bar.fill:SetPoint("BOTTOM", slider.bar, "BOTTOM", 0, FILL_BORDEROFFSET)
        end
    else
        if slider.fillFromStart then
            -- slider.bar.fill:SetSize(barX - FILL_BORDEROFFSET, barY - FILL_BORDEROFFSET)
            slider.bar.fill:SetPoint("TOP", 0, - FILL_BORDEROFFSET)
            slider.bar.fill:SetPoint("BOTTOM", slider.thumb, "CENTER")
            slider.bar.fill:SetPoint("LEFT", slider.bar, "LEFT", FILL_BORDEROFFSET, 0)
            slider.bar.fill:SetPoint("RIGHT", slider.bar, "RIGHT", - FILL_BORDEROFFSET, 0)
        else
            -- slider.bar.fill:SetSize(barX - FILL_BORDEROFFSET, barY - FILL_BORDEROFFSET)
            slider.bar.fill:SetPoint("BOTTOM", 0, FILL_BORDEROFFSET)
            slider.bar.fill:SetPoint("TOP", slider.thumb, "CENTER")
            slider.bar.fill:SetPoint("LEFT", slider.bar, "LEFT", FILL_BORDEROFFSET, 0)
            slider.bar.fill:SetPoint("RIGHT", slider.bar, "RIGHT", - FILL_BORDEROFFSET, 0)
        end
    end
end
local function _handleThumb(slider, isHorizontal)
    if isHorizontal then
        slider.thumb:SetTexture(thumbHorizontalPath)
        local x, y = slider.thumb:GetSize()
        slider.thumb:SetSize(x * slider.thumbWidthScaler, y * slider.thumbHeightScaler)
    else
        slider.thumb:SetTexture(thumbVerticalPath)
        local x, y = slider.thumb:GetSize()
        slider.thumb:SetSize(y * slider.thumbHeightScaler, x * slider.thumbWidthScaler)
    end
end

function Legolando_SliderColorFillMixin_Angleur:UpdateUnitText(value)
    self.unitText:SetText(value .. " " .. self.unit)
end

function Legolando_SliderColorFillMixin_Angleur:Update()
    local teeburu = self.savedVarTable
    local reference = self.reference
    local tableValue = teeburu[reference]
    self:SetValue(tableValue)
    self:UpdateUnitText(tableValue)
end

function Legolando_SliderColorFillMixin_Angleur:SaveToTable(newValue)
    local teeburu = self.savedVarTable
    if not teeburu then
        print("Slider doesn't have a saved variable table attached")
        return
    end
    local reference = self.reference
    if not reference then 
        print("no slider reference string")
        return
    end
    teeburu[reference] = newValue
    -- Also need to call this here too because :Update() for self wont be called when slider value is manually changed
    self:UpdateUnitText(newValue)
    local privateRegistry = self.privateRegistry
	local privateRegistryString = self.privateRegistryString
    if privateRegistry and privateRegistryString then
		privateRegistry:TriggerEvent(privateRegistryString, self)
	end
    if self.onSaveCallback then
		self.onSaveCallback(self, teeburu[reference], teeburu)
	end
end

function Legolando_SliderColorFillMixin_Angleur:SetDesaturated(desaturate)
    local changeState = desaturate ~= self.desaturated
    if not changeState then return end
    if desaturate then
        self.desaturated = true
        self:Disable()
        self.editBox:Disable()
        self:DesaturateHierarchy(5)
        self.bar.fill:SetColorTexture(0.8, 0.8, 0.8)
        self.unitText:Hide()
        self.desaturatedText:Show()
    else
        self.desaturated = false
        self:Enable()
        self.editBox:Enable()
        self:DesaturateHierarchy(0)
        self.bar.fill:SetColorTexture(1, 0.82, 0)
        self.unitText:Show()
        self.desaturatedText:Hide()
    end
end

-- Only call after Init() has been called once
function Legolando_SliderColorFillMixin_Angleur:ReAdjust(min, max, step, unit)
    if not unit then unit = "" end
    self.unit = unit
    self:SetMinMaxValues(min, max)
    self:SetValueStep(step)
    self:SetObeyStepOnDrag(true)
    self:Update()
    if self.showEditBox == true then 
        self.editBox:ReAdjust(min, max)    
    end
end

function Legolando_SliderColorFillMixin_Angleur:Init(min, max, step, unit)
    local privateRegistry = self.privateRegistry
	local privateRegistryString = self.privateRegistryString
    local isHorizontal = self:GetOrientation() == "HORIZONTAL"
    _handleBar(self, isHorizontal)
    _handleThumb(self, isHorizontal)
    _handleFill(self, isHorizontal)
    local teeburu = self.savedVarTable
    if not teeburu then
        print("Slider doesn't have a saved variable table attached")
        return
    end
    local reference = self.reference
    if not reference then 
        print("no slider reference string")
        return
    end
    -- __________________________________________ Special Case __________________________________________
    --                SliderColorFill MUST communicate with childframe ForceNegativeBox 
    --                      Thus requires an arbitrary registry and eventString 
    --                even if there is no external frame they need to work together with
    --                                     --------------------------
    --         If a private registry and/or string is not given, create one and set the string to
    --  the frame's debug name(if not given during creation it will have a unique string of random chars)
    --___________________________________________________________________________________________________
    if not privateRegistry then
        privateRegistry = CreateFromMixins(CallbackRegistryMixin)
        privateRegistry:OnLoad()
        privateRegistry:SetUndefinedEventsAllowed(true)
        self.privateRegistry = privateRegistry
    end
    if not privateRegistryString then
        privateRegistryString = self:GetDebugName() .. "SliderValueChanged"
        self.privateRegistryString = privateRegistryString
    end
    --___________________________________________________________________________________________________
    privateRegistry:RegisterCallback(privateRegistryString, function(_, caller)
        if caller and caller == self then return end
        self:Update()
    end)

    if not unit then unit = "" end
    self.unit = unit
    self:SetMinMaxValues(min, max)
    self:SetValueStep(step)
    self:SetObeyStepOnDrag(true)
    if self.disabledMessage then self.desaturatedText:SetText(self.disabledMessage) end
    self.desaturated = false
    self:Update()
    self:SetScript("OnValueChanged", function(self, newValue, userInput)
        if not userInput then return end
        self:SaveToTable(newValue)
    end)

    if self.showEditBox == false then return end
    -----------------------------------
    -- Init() process of the EditBox --
    -----------------------------------
    self.editBox.savedVarTable = teeburu
    self.editBox.reference = reference
    self.editBox.onSaveCallback = self.onSaveCallback
    self.editBox.privateRegistry = privateRegistry
	self.editBox.privateRegistryString = privateRegistryString
    self.editBox:Init(min, max)
    self.editBox:Show()
    -----------------------------------
end
