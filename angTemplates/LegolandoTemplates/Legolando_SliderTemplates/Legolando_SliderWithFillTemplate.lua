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
local function handleBar(slider, isHorizontal)
    local sliderX, sliderY = slider:GetSize()
    if isHorizontal then
        slider.bar:SetSize(sliderX - THUMB_EXTENDER, sliderY)
    else
        slider.bar:SetSize(sliderX, sliderY - THUMB_EXTENDER)
    end
end
local function handleFill(slider, isHorizontal)
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
local function handleThumb(slider, isHorizontal)
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

function Legolando_SliderColorFillMixin_Angleur:Init(min, max, step, unit)
    local isHorizontal = self:GetOrientation() == "HORIZONTAL"
    handleBar(self, isHorizontal)
    handleThumb(self, isHorizontal)
    handleFill(self, isHorizontal)
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
    if not unit then unit = "" end
    self.unit = unit
    self:SetMinMaxValues(min, max)
    self:SetValueStep(step)
    self:SetObeyStepOnDrag(true)
    self:SetValue(teeburu[reference])
    self.unitText:SetText(teeburu[reference] .. " " .. unit)
    self:SetScript("OnValueChanged", function(self, value)
        self:Update(value, "Slider")
        if self.onChangedCallback then
            self.onChangedCallback(self, value)
        end
    end)
end

-- omit --> whatever type of frame that called Update, as it will already have the new value set(by itself)
function Legolando_SliderColorFillMixin_Angleur:Update(newValue, omit)
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
    print(omit)
    if omit ~= "Slider" then
        self:SetValue(newValue)
    end
    if omit ~= "EditBox" then
        self.editBox:SetText(newValue)
    end
    self.unitText:SetText(newValue .. " " .. self.unit)
end

Legolando_SliderColorFillEditBoxMixin_Angleur = {}

function Legolando_SliderColorFillEditBoxMixin_Angleur:OnLoad()
    self:SetNumericFullRange(true)
    self:SetScript("OnEvent", function(self, event, button) 
        if event ~= "GLOBAL_MOUSE_UP" then return end
        if button ~= "LeftButton" and button ~= "RightButton" then return end
        if self:IsMouseOver() == true then return end
        if self:GetParent():GetParent():IsMouseOver() == false then
            self:ClearFocus()
        end
    end)
end

function Legolando_SliderColorFillEditBoxMixin_Angleur:OnEditFocusGained()
    self:HighlightText()
    self:RegisterEvent("GLOBAL_MOUSE_UP")
end

function Legolando_SliderColorFillEditBoxMixin_Angleur:OnEditFocusLost()
    self:ClearHighlightText()
    local newValue = self:GetNumber()
    self:GetParent():Update(newValue, "EditBox")
    self:UnregisterEvent("GLOBAL_MOUSE_UP")
end