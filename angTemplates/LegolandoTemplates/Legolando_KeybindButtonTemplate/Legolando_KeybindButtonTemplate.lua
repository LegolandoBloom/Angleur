
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

Legolando_KeybindButtonMixin_Angleur = {}

Legolando_KeybindButtonMixin_Angleur.Modifiers = {
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

function Legolando_KeybindButtonMixin_Angleur:CallOnBindFunction()
    if self.onBindFunction then
        self.onBindFunction()
    end
end

function Legolando_KeybindButtonMixin_Angleur:checkTableAndReference()
    local teeburu = self.savedVarTable
    local keybindRef = self.keybindRef
    if not teeburu then
        print("no saved variable table linked to keybind frame")
        return false
    end
    if not keybindRef then
        print("no reference key for keybind in the saved var table")
        return false
    end
    return true
end

function Legolando_KeybindButtonMixin_Angleur:UpdateSavedVariables(base, modifier)
    local teeburu = self.savedVarTable
    if not self.keybindRef then return end
    if modifier then
        teeburu[self.keybindRef] = modifier .. "-" .. base
        if self.modifierRef then teeburu[self.modifierRef] = modifier end
        if self.baseRef then teeburu[self.baseRef] = base end
        EventRegistry:TriggerEvent("Lego-KeyBound-Angleur-" .. self:GetParentKey(), base, modifier)
    elseif base then
        teeburu[self.keybindRef] = base
        if self.modifierRef then teeburu[self.modifierRef] = nil end
        if self.baseRef then teeburu[self.baseRef] = nil end
        EventRegistry:TriggerEvent("Lego-KeyBound-Angleur-" .. self:GetParentKey(), base)
    else
        teeburu[self.keybindRef] = nil
        if self.modifierRef then teeburu[self.modifierRef] = nil end
        if self.baseRef then teeburu[self.baseRef] = nil end
        EventRegistry:TriggerEvent("Lego-KeyUnbound-Angleur-" .. self:GetParentKey())
    end
end

function Legolando_KeybindButtonMixin_Angleur.OnClick(self, button, down)
    if self:checkTableAndReference() == false then return end
    if InCombatLockdown() then return end
    if button == "LeftButton" then
        if self.selected then
            self:StopWatching()
        else
            self.selected = true
            self:SetSelected(true)
            self:SetScript("OnKeyDown", self.Modified)
            self:SetScript("OnMouseWheel", self.MouseWheel)
            self:SetScript("OnMouseDown", self.Mouse)
            self:SetScript("OnGamePadButtonDown", self.GamePad)
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

function Legolando_KeybindButtonMixin_Angleur.OnUp(self, key)
    if self.Modifiers.modifiedListening == key then
        local teeburu = self.savedVarTable
        local keybindRef = self.keybindRef
        self.Modifiers.modifiedListening = nil
        if self.disclaimerText then
            self.disclaimer:SetText(self.disclaimerText)
        end
        self:SetText(teeburu[keybindRef])
        self:SetScript("OnKeyUp", nil)
        self:SetScript("OnKeyDown", self.Modified)
        self:SetScript("OnMouseWheel", self.MouseWheel)
        self:SetScript("OnMouseDown", self.Mouse)
        self:SetScript("OnGamePadButtonDown", self.GamePad)
    end
end

local mouseButtons = {
    ["MiddleButton"] = "BUTTON3",
    ["Button4"] = "BUTTON4",
    ["Button5"] = "BUTTON5",
}
function Legolando_KeybindButtonMixin_Angleur.Mouse(self, button)
    if button == "LeftButton" or button =="RightButton" then
        --nothing
    else
        local buttonName = mouseButtons[button]
        local teeburu = self.savedVarTable
        local keybindRef = self.keybindRef
        if not buttonName then
            print("Unregistered mouse button, please contact the addon author")
        end
        if self.Modifiers.modifiedListening then
            self:UpdateSavedVariables(buttonName, self.Modifiers.modifiedListening)
            self.Modifiers.modifiedListening = nil
            print("Key set to: " .. teeburu[keybindRef])
        else
            self:UpdateSavedVariables(buttonName, nil)
            print("Key set to: " .. teeburu[keybindRef])
        end
        self.disclaimer:Hide()
        self:SetSelected(false)
        self.selected = false
        self:SetScript("OnKeyUp", nil)
        self:SetScript("OnKeyDown", nil)
        self:SetScript("OnMouseWheel", nil)
        self:SetScript("OnMouseDown", nil)
        self:SetScript("OnGamePadButtonDown", nil)
        self:SetText(teeburu[keybindRef])
        self:CallOnBindFunction()
    end
end

function Legolando_KeybindButtonMixin_Angleur.GamePad(self, button)
    local teeburu = self.savedVarTable
    local keybindRef = self.keybindRef
    self:SetScript("OnKeyUp", nil)
    self:SetScript("OnKeyDown", nil)
    self:SetScript("OnMouseWheel", nil)
    self:SetScript("OnMouseDown", nil)
    self:SetScript("OnGamePadButtonDown", nil)
    self.disclaimer:Hide()
    self:SetSelected(false)
    self.selected = false
    self:UpdateSavedVariables(button, nil)
    self:SetText(teeburu[keybindRef])
    print("Key set to: " .. teeburu[keybindRef])
    self:CallOnBindFunction()
end

function Legolando_KeybindButtonMixin_Angleur.MouseWheel(self, delta)
    local scroll
    if delta == 1 then
        scroll = "MOUSEWHEELUP"
    elseif delta == -1 then
        scroll = "MOUSEWHEELDOWN"
    end
    local teeburu = self.savedVarTable
    local keybindRef = self.keybindRef
    if self.Modifiers.modifiedListening then
        local colorBlu = CreateColor(0.61, 0.85, 0.92)
        local colorWhite = CreateColor(1, 1, 1)
        local colorGrae = CreateColor(0.5, 0.5, 0.5)
        local colorYello = CreateColor(1.0, 0.82, 0.0)
        self:UpdateSavedVariables(scroll, self.Modifiers.modifiedListening)
        self.Modifiers.modifiedListening = nil
        print("Key set to: " .. teeburu[keybindRef])
        print(colorBlu:WrapTextInColorCode("Note: ") .. colorYello:WrapTextInColorCode("Modifier Keys ") 
        .. "won't be recognized when the game is in the " .. colorGrae:WrapTextInColorCode("background. ") 
        .. "If you are using the scroll wheel for that purpose. Just bind the wheel alone instead, without modifiers.")
    else
        self:UpdateSavedVariables(scroll, nil)
        print("Key set to: ".. teeburu[keybindRef])
    end
    self.disclaimer:Hide()
    self:SetSelected(false)
    self.selected = false
    self:SetScript("OnKeyUp", nil)
    self:SetScript("OnKeyDown", nil)
    self:SetScript("OnMouseWheel", nil)
    self:SetScript("OnMouseDown", nil)
    self:SetScript("OnGamePadButtonDown", nil)
    self:SetText(teeburu[keybindRef])
    self:CallOnBindFunction()
end

function Legolando_KeybindButtonMixin_Angleur.Modified(self, key)
    local teeburu = self.savedVarTable
    local keybindRef = self.keybindRef
    if key == "ENTER" then

    elseif key == "ESCAPE" then
        self:StopWatching()
    elseif self.Modifiers.modifierKeys[key] then
        self:SetText(key .. "-" .. "?")
        self.Modifiers.modifiedListening = key
        if self.disclaimerTextModified then
            self.disclaimer:SetText(self.disclaimerTextModified .. key)
        end
        self:SetScript("OnKeyUp", self.OnUp)
        self:SetScript("OnKeyDown", self.Modified)
        self:SetScript("OnMouseWheel", self.MouseWheel)
        self:SetScript("OnMouseDown", self.Mouse)
    elseif self.Modifiers.modifiedListening then
        self:SetScript("OnKeyUp", nil)
        self:SetScript("OnKeyDown", nil)
        self:SetScript("OnMouseWheel", nil)
        self:SetScript("OnMouseDown", nil)
        self:SetScript("OnGamePadButtonDown", nil)
        self.disclaimer:Hide()
        self:SetSelected(false)
        self.selected = false
        self:UpdateSavedVariables(key, self.Modifiers.modifiedListening)
        self:SetText(teeburu[keybindRef])
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
        self:UpdateSavedVariables(key, nil)
        self:SetText(teeburu[keybindRef])
        print("Key set to: " .. teeburu[keybindRef])
        self:CallOnBindFunction()
    end 
end

function Legolando_KeybindButtonMixin_Angleur:StopWatching()
    local teeburu = self.savedVarTable
    local keybindRef = self.keybindRef
    self.Modifiers.secondPressListening = false
    self.Modifiers.modifiedListening = nil
    self:SetScript("OnKeyUp", nil)
    self:SetScript("OnKeyDown", nil)
    self:SetScript("OnMouseWheel", nil)
    self:SetScript("OnMouseDown", nil)
    self:SetScript("OnGamePadButtonDown", nil)
    self:SetText(teeburu[keybindRef])
    self.disclaimer:Hide()
    self.selected = false
    self:SetSelected(false)
end

function Legolando_KeybindButtonMixin_Angleur:Unbind(self)
    local teeburu = self.savedVarTable
    local keybindRef = self.keybindRef
    self:UpdateSavedVariables(nil, nil)
    self:SetText(teeburu[keybindRef])
    self:CallOnBindFunction()
    print("Keybind removed")
end

-- ____________________________________[3]______________________________________________
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

