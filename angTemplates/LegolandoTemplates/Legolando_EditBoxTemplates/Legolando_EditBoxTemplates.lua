
Legolando_EditBoxNoTextureMixin_Angleur = {}


function Legolando_EditBoxNoTextureMixin_Angleur:OnLoad()
	if self.showDebugBorder == true then self.debugBorder:Show() end
	self:SetScript("OnEvent", function(self, event, button) 
		if event ~= "GLOBAL_MOUSE_UP" then return end
		if button ~= "LeftButton" and button ~= "RightButton" then return end
		if self:IsMouseOver() == true then return end
	end)
end
function Legolando_EditBoxNoTextureMixin_Angleur:OnEditFocusGained()
	-- self:GetParent():Show()
	self:HighlightText()
	self:RegisterEvent("GLOBAL_MOUSE_UP")
end
function Legolando_EditBoxNoTextureMixin_Angleur:OnEditFocusLost()
	self:ClearHighlightText()
	self:UnregisterEvent("GLOBAL_MOUSE_UP")
	if self.callback then
		self.callback(self, self:GetNumber())
	end
	-- Angleur_FillEditBox(self)
end



Legolando_MinSecEditBoxesMixin_Angleur = {}

local function addZeroesToEditBox(editBox)
    local number = editBox:GetNumber()
    if number > 10 then return end
    editBox:SetCursorPosition(0)
    editBox:Insert(0)
    if number > 0 then return end
    editBox:SetCursorPosition(0)
    editBox:Insert(0)
end
function Legolando_MinSecEditBoxesMixin_Angleur:FillBoxes()
	self.minutes:SetNumber(self.separateValues.minutes)
	addZeroesToEditBox(self.minutes)
	self.seconds:SetNumber(self.separateValues.seconds)
	addZeroesToEditBox(self.seconds)
end

function Legolando_MinSecEditBoxesMixin_Angleur:SeparateValues()
	local teeburu = self.savedVarTable
	local reference = self.reference

	local value = teeburu[reference]
	print("Saved value: ", teeburu[reference], "Separating...")
	self.separateValues.minutes = math.floor(value / 60)
	self.separateValues.seconds = value % 60
end

function Legolando_MinSecEditBoxesMixin_Angleur:CombineAndSaveToTable()
	local combined = self.separateValues.minutes * 60 + self.separateValues.seconds
	local teeburu = self.savedVarTable
	local reference = self.reference
	if not teeburu or not reference or not teeburu[reference] then
		print("Table or Reference missing for EditBoxes")
		return
	end
	teeburu[reference] = combined
	print("Time set to: ", self.separateValues.minutes, " minutes, ", self.separateValues.seconds, " seconds")
	print("Total time in seconds: ", teeburu[reference])
	if self.onSaveCallback then
		self.onSaveCallback(self, teeburu)
	end
end

function Legolando_MinSecEditBoxesMixin_Angleur:Init()
	local teeburu = self.savedVarTable
	local reference = self.reference
	if not teeburu or not reference or not teeburu[reference] then
		print("Table or Reference missing for EditBoxes")
		return
	end
	self.separateValues = {}
	self:SeparateValues()
	self:FillBoxes()
	self.minutes.callback = function(editBox, value) 
		self.separateValues.minutes = value
		addZeroesToEditBox(editBox)
		self:CombineAndSaveToTable()
	end
	self.seconds.callback = function(editBox, value) 
		self.separateValues.seconds = value
		addZeroesToEditBox(editBox)
		self:CombineAndSaveToTable()
	end
end