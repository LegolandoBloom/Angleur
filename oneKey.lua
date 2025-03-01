angleurOneKey = {
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

function Angleur_KeyGetterOnUp(self, key)
    if angleurOneKey.modifiedListening == key then
        angleurOneKey.modifiedListening = nil
        self.disclaimer:SetText("The next key you press\nwill be set as Angleur Key")
        self:SetText(AngleurConfig.angleurKey)
        self:SetScript("OnKeyUp", nil)
        self:SetScript("OnKeyDown", Angleur_KeyGetterModified)
        self:SetScript("OnMouseWheel", Angleur_KeyGetterWheel)
        self:SetScript("OnGamePadButtonDown", Angleur_KeyGetterGamePad)
    end
end

--[[
    function Angleur_KeyGetter(self, key)
        if key == "ESCAPE" then
            return
        elseif angleurOneKey.modifierKeys[key] then
            self:SetText(key .. "-" .. "?")
            angleurOneKey.modifiedListening = key
            self.disclaimer:SetText("Modifier key " .. key .. "down,\nawaiting additional key press.")
            self:SetScript("OnKeyUp", Angleur_KeyGetterOnUp)
            self:SetScript("OnKeyDown", Angleur_KeyGetterModified)
            self:SetScript("OnMouseWheel", Angleur_KeyGetterWheel)
            self:SetScript("OnGamePadButtonDown", Angleur_KeyGetterGamePad)
        else
            self:SetScript("OnKeyUp", nil)
            self:SetScript("OnKeyDown", nil)
            self:SetScript("OnMouseWheel", nil)
            self:SetScript("OnGamePadButtonDown", nil)
            self.disclaimer:Hide()
            self:SetSelected(false)
            self.selected = false
            AngleurConfig.angleurKey = key
            self:SetText(AngleurConfig.angleurKey)
            print("OneKey set to: " .. AngleurConfig.angleurKey)
        end
    end
]]--

function Angleur_KeyGetterGamePad(self, button)
    self:SetScript("OnKeyUp", nil)
    self:SetScript("OnKeyDown", nil)
    self:SetScript("OnMouseWheel", nil)
    self:SetScript("OnGamePadButtonDown", nil)
    self.disclaimer:Hide()
    self:SetSelected(false)
    self.selected = false
    AngleurConfig.angleurKey = button
    AngleurConfig.angleurKeyModifier = nil
    AngleurConfig.angleurKeyMain = nil
    self:SetText(AngleurConfig.angleurKey)
    print("OneKey set to: " .. AngleurConfig.angleurKey)
end

function Angleur_KeyGetterWheel(self, delta)
    local scroll
    if delta == 1 then
        scroll = "MOUSEWHEELUP"
    elseif delta == -1 then
        scroll = "MOUSEWHEELDOWN"
    end

    if angleurOneKey.modifiedListening then
        local colorBlu = CreateColor(0.61, 0.85, 0.92)
        local colorWhite = CreateColor(1, 1, 1)
        local colorGrae = CreateColor(0.5, 0.5, 0.5)
        local colorYello = CreateColor(1.0, 0.82, 0.0)
        AngleurConfig.angleurKey = angleurOneKey.modifiedListening .. "-" .. scroll
        AngleurConfig.angleurKeyModifier = angleurOneKey.modifiedListening
        AngleurConfig.angleurKeyMain = scroll
        angleurOneKey.modifiedListening = nil
        print("OneKey set to: " .. AngleurConfig.angleurKey)
        print(colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Modifier Keys ") 
        .. "won't be recognized when the game is in the " .. colorGrae:WrapTextInColorCode("background. ") 
        .. "If you are using the scroll wheel for that purpose. Just bind the wheel alone instead, without modifiers.")
    else
        AngleurConfig.angleurKey = scroll
        AngleurConfig.angleurKeyModifier = nil
        AngleurConfig.angleurKeyMain = nil
        print("OneKey set to: " .. AngleurConfig.angleurKey)
    end
    self.disclaimer:Hide()
    self:SetSelected(false)
    self.selected = false
    self:SetScript("OnKeyUp", nil)
    self:SetScript("OnKeyDown", nil)
    self:SetScript("OnMouseWheel", nil)
    self:SetScript("OnGamePadButtonDown", nil)
    self:SetText(AngleurConfig.angleurKey)
end

function Angleur_KeyGetterModified(self, key)
    if key == "ENTER" then

    elseif key == "ESCAPE" then
        Angleur_KeyGetterStopWatching()
    elseif angleurOneKey.modifierKeys[key] then
        self:SetText(key .. "-" .. "?")
        angleurOneKey.modifiedListening = key
        self.disclaimer:SetText("Modifier key " .. key .. "down,\nawaiting additional key press.")
        self:SetScript("OnKeyUp", Angleur_KeyGetterOnUp)
        self:SetScript("OnKeyDown", Angleur_KeyGetterModified)
        self:SetScript("OnMouseWheel", Angleur_KeyGetterWheel)
    elseif angleurOneKey.modifiedListening then
        self:SetScript("OnKeyUp", nil)
        self:SetScript("OnKeyDown", nil)
        self:SetScript("OnMouseWheel", nil)
        self:SetScript("OnGamePadButtonDown", nil)
        self.disclaimer:Hide()
        self:SetSelected(false)
        self.selected = false
        AngleurConfig.angleurKey = angleurOneKey.modifiedListening .. "-" .. key
        AngleurConfig.angleurKeyModifier = angleurOneKey.modifiedListening
        AngleurConfig.angleurKeyMain = key
        self:SetText(AngleurConfig.angleurKey)
        print("OneKey set to: " .. AngleurConfig.angleurKeyMain .. ", with modifier " .. AngleurConfig.angleurKeyModifier)
        angleurOneKey.modifiedListening = nil
    else
        self:SetScript("OnKeyUp", nil)
        self:SetScript("OnKeyDown", nil)
        self:SetScript("OnMouseWheel", nil)
        self:SetScript("OnGamePadButtonDown", nil)
        self.disclaimer:Hide()
        self:SetSelected(false)
        self.selected = false
        AngleurConfig.angleurKey = key
        AngleurConfig.angleurKeyModifier = nil
        AngleurConfig.angleurKeyMain = nil
        self:SetText(AngleurConfig.angleurKey)
        print("OneKey set to: " .. AngleurConfig.angleurKey)
    end 
end

function Angleur_KeyGetterStopWatching()
    angleurOneKey.secondPressListening = false
    angleurOneKey.modifiedListening = nil
    local angleurKeyFrameHolder = Angleur.configPanel.tab1.contents.fishingMethod.oneKey.contents.angleurKey
    angleurKeyFrameHolder:SetScript("OnKeyUp", nil)
    angleurKeyFrameHolder:SetScript("OnKeyDown", nil)
    angleurKeyFrameHolder:SetScript("OnMouseWheel", nil)
    angleurKeyFrameHolder:SetScript("OnGamePadButtonDown", nil)
    angleurKeyFrameHolder:SetText(AngleurConfig.angleurKey)
    angleurKeyFrameHolder.disclaimer:Hide()
    angleurKeyFrameHolder.selected = false
    angleurKeyFrameHolder:SetSelected(false)
end

function Angleur_Unbind(self)
    AngleurConfig.angleurKey = nil
    AngleurConfig.angleurKeyModifier = nil
    AngleurConfig.angleurKeyMain = nil
    Angleur.visual.texture:SetTexture(nil)
    ClearOverrideBindings(Angleur)
    self:SetText(AngleurConfig.angleurKey)
    print("OneKey removed")
end