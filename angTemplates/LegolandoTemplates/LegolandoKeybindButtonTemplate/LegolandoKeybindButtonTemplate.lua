
-- NOTE: See exampleUsage.lua to see how to use the library

-- ____________________________________[1]______________________________________________
--  Templates Mixins Ported directly from Blizzard's FrameXML, just in case it changes later on
-- ____________________________________[1]______________________________________________


-- ____________________________________[1]______________________________________________
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



-- ____________________________________[2]______________________________________________
--  Generalized Templates made by Legolando, to be used in this library
-- ____________________________________[2]______________________________________________


-- ____________________________________[2]______________________________________________
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




-- ____________________________________[3]______________________________________________
--  Templates made by Legolando, specifically for this lib
-- ____________________________________[3]______________________________________________

Legolando_KeybindButtonMixin = {}

Legolando_KeybindButtonMixin.Modifiers = {
    modifiedListening = nil,
    modifierKeys = {
        LSHIFT = {"LSHIFT"},
        RSHIFT = {"RSHIFT"},
        LALT = {"LALT"},
        RALT = {"RALT"},
        LCTRL = {"LCTRL"},
        RCTRL = {"RCTRL"}
    }
}

function Legolando_KeybindButtonMixin:CallOnBindFunction()
    if self.onBindFunction then
        self.onBindFunction()
    end
end

function Legolando_KeybindButtonMixin:checkTableAndReference()
    local teeburu = self.savedVarTable
    if not teeburu then
        print("no saved variable table linked to keybind frame")
        return false
    end
    local key = self.savedVarKey
    if not self.savedVarKey then
        print("no reference key for the saved var table")
        return false
    end
    return true
end

function Legolando_KeybindButtonMixin.OnClick(self, button, down)
    if self:checkTableAndReference() == false then return end
    if InCombatLockdown() then return end
    if button == "LeftButton" then
        if self.selected then
            self:StopWatching()
        else
            self.selected = true
            self:SetSelected(true)
            self:SetScript("OnKeyDown", Legolando_KeybindFrame_Modified)
            self:SetScript("OnMouseWheel", Legolando_KeybindFrame_MouseWheel)
            self:SetScript("OnMouseDown", Legolando_KeybindFrame_Mouse)
            self:SetScript("OnGamePadButtonDown", Legolando_KeybindFrame_GamePad)
            self:SetPropagateKeyboardInput(false)
            if self.disclaimerText then 
                self.disclaimer:Show()
                self.disclaimer:SetText(self.disclaimerText)
            end
            self.warning:Hide()
        end
    elseif button == "RightButton" then
        self:Unbind(self)
    end
end

function Legolando_KeybindFrame_OnUp(self, key)
    if self.Modifiers.modifiedListening == key then
        self.Modifiers.modifiedListening = nil
        if self.disclaimerText then 
            self.disclaimer:SetText(self.disclaimerText)
        end
        self:SetText(self.savedVarTable[self.savedVarKey])
        self:SetScript("OnKeyUp", nil)
        self:SetScript("OnKeyDown", Legolando_KeybindFrame_Modified)
        self:SetScript("OnMouseWheel", Legolando_KeybindFrame_MouseWheel)
        self:SetScript("OnMouseDown", Legolando_KeybindFrame_Mouse)
        self:SetScript("OnGamePadButtonDown", Legolando_KeybindFrame_GamePad)
    end
end

local mouseButtons = {
    ["MiddleButton"] = "BUTTON3",
    ["Button4"] = "BUTTON4",
    ["Button5"] = "BUTTON5",
}
function Legolando_KeybindFrame_Mouse(self, button)
    if button == "LeftButton" or button =="RightButton" then
        --nothing
    else
        local buttonName = mouseButtons[button]
        local teeburu = self.savedVarTable
        local refKey = self.savedVarKey
        if not buttonName then
            print("Unregistered mouse button, please contact the addon author")
        end
        if self.Modifiers.modifiedListening then
            self.savedVarTable[self.savedVarKey] = self.Modifiers.modifiedListening .. "-" .. buttonName
            self.Modifiers.modifiedListening = nil
            print("Key set to: " .. teeburu[refKey])
        else
            teeburu[refKey] = buttonName
            print("Key set to: " .. teeburu[refKey])
        end
        self.disclaimer:Hide()
        self:SetSelected(false)
        self.selected = false
        self:SetScript("OnKeyUp", nil)
        self:SetScript("OnKeyDown", nil)
        self:SetScript("OnMouseWheel", nil)
        self:SetScript("OnMouseDown", nil)
        self:SetScript("OnGamePadButtonDown", nil)
        self:SetText(teeburu[refKey])
        self:CallOnBindFunction()
    end
end

function Legolando_KeybindFrame_GamePad(self, button)
    local teeburu = self.savedVarTable
    local refKey = self.savedVarKey
    self:SetScript("OnKeyUp", nil)
    self:SetScript("OnKeyDown", nil)
    self:SetScript("OnMouseWheel", nil)
    self:SetScript("OnMouseDown", nil)
    self:SetScript("OnGamePadButtonDown", nil)
    self.disclaimer:Hide()
    self:SetSelected(false)
    self.selected = false
    teeburu[refKey] = button
    self:SetText(teeburu[refKey])
    print("Key set to: " .. teeburu[refKey])
    self:CallOnBindFunction()
end

function Legolando_KeybindFrame_MouseWheel(self, delta)
    local scroll
    if delta == 1 then
        scroll = "MOUSEWHEELUP"
    elseif delta == -1 then
        scroll = "MOUSEWHEELDOWN"
    end
    local teeburu = self.savedVarTable
    local refKey = self.savedVarKey
    if self.Modifiers.modifiedListening then
        local colorBlu = CreateColor(0.61, 0.85, 0.92)
        local colorWhite = CreateColor(1, 1, 1)
        local colorGrae = CreateColor(0.5, 0.5, 0.5)
        local colorYello = CreateColor(1.0, 0.82, 0.0)
        teeburu[refKey] = self.Modifiers.modifiedListening .. "-" .. scroll
        self.Modifiers.modifiedListening = nil
        print("Key set to: " .. teeburu[refKey])
        print(colorBlu:WrapTextInColorCode("Note: ") .. colorYello:WrapTextInColorCode("Modifier Keys ") 
        .. "won't be recognized when the game is in the " .. colorGrae:WrapTextInColorCode("background. ") 
        .. "If you are using the scroll wheel for that purpose. Just bind the wheel alone instead, without modifiers.")
    else
        teeburu[refKey] = scroll
        print("Key set to: ".. teeburu[refKey])
    end
    self.disclaimer:Hide()
    self:SetSelected(false)
    self.selected = false
    self:SetScript("OnKeyUp", nil)
    self:SetScript("OnKeyDown", nil)
    self:SetScript("OnMouseWheel", nil)
    self:SetScript("OnMouseDown", nil)
    self:SetScript("OnGamePadButtonDown", nil)
    self:SetText(teeburu[refKey])
    self:CallOnBindFunction()
end

function Legolando_KeybindFrame_Modified(self, key)
    local teeburu = self.savedVarTable
    local refKey = self.savedVarKey
    if key == "ENTER" then

    elseif key == "ESCAPE" then
        self:StopWatching()
    elseif self.Modifiers.modifierKeys[key] then
        self:SetText(key .. "-" .. "?")
        self.Modifiers.modifiedListening = key
        if self.disclaimerTextModified then
            self.disclaimer:SetText(self.disclaimerTextModified .. key)
        end
        self:SetScript("OnKeyUp", Legolando_KeybindFrame_OnUp)
        self:SetScript("OnKeyDown", Legolando_KeybindFrame_Modified)
        self:SetScript("OnMouseWheel", Legolando_KeybindFrame_MouseWheel)
        self:SetScript("OnMouseDown", Legolando_KeybindFrame_Mouse)
    elseif self.Modifiers.modifiedListening then
        self:SetScript("OnKeyUp", nil)
        self:SetScript("OnKeyDown", nil)
        self:SetScript("OnMouseWheel", nil)
        self:SetScript("OnMouseDown", nil)
        self:SetScript("OnGamePadButtonDown", nil)
        self.disclaimer:Hide()
        self:SetSelected(false)
        self.selected = false
        teeburu[refKey] = self.Modifiers.modifiedListening .. "-" .. key
        self:SetText(teeburu[refKey])
        print("Key set to: " .. key .. ", with modifier " .. self.Modifiers.modifiedListening)
        self.Modifiers.modifiedListening = nil
        self:CallOnBindFunction()
    else
        self:SetScript("OnKeyUp", nil)
        self:SetScript("OnKeyDown", nil)
        self:SetScript("OnMouseWheel", nil)
        self:SetScript("OnMouseDown", nil)
        self:SetScript("OnGamePadButtonDown", nil)
        self.disclaimer:Hide()
        self:SetSelected(false)
        self.selected = false
        teeburu[refKey] = key
        self:SetText(teeburu[refKey])
        print("Key set to: " .. teeburu[refKey])
        self:CallOnBindFunction()
    end 
end

function Legolando_KeybindButtonMixin:StopWatching()
    local teeburu = self.savedVarTable
    local refKey = self.savedVarKey
    self.Modifiers.secondPressListening = false
    self.Modifiers.modifiedListening = nil
    self:SetScript("OnKeyUp", nil)
    self:SetScript("OnKeyDown", nil)
    self:SetScript("OnMouseWheel", nil)
    self:SetScript("OnMouseDown", nil)
    self:SetScript("OnGamePadButtonDown", nil)
    self:SetText(teeburu[refKey])
    self.disclaimer:Hide()
    self.selected = false
    self:SetSelected(false)
end

function Legolando_KeybindButtonMixin:Unbind(self)
    local teeburu = self.savedVarTable
    local refKey = self.savedVarKey
    teeburu[refKey] = nil
    self:SetText(self.savedVarTable[self.savedVarKey])
    self:CallOnBindFunction()
    print("Keybind removed")
end

-- ____________________________________[3]______________________________________________
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

