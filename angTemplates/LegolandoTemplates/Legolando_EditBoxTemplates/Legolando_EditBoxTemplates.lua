

Legolando_NumericInputBoxWithForceNegativeMixin_Angleur = {}

function Legolando_NumericInputBoxWithForceNegativeMixin_Angleur:Update()
	local teeburu = self.savedVarTable
	local reference = self.reference
	local value = teeburu[reference]
	print("Update value:", value)
	self:SetNumber(value)
end

function Legolando_NumericInputBoxWithForceNegativeMixin_Angleur:SaveToTable()
	local teeburu = self.savedVarTable
	local reference = self.reference
	local privateRegistry = self.privateRegistry
	local privateRegistryString = self.privateRegistryString
	if not teeburu or not reference or not teeburu[reference] then
		print("Table or Reference missing for EditBoxes")
		return
	end
	teeburu[reference] = self:GetNumber()
	if privateRegistry and privateRegistryString then
		privateRegistry:TriggerEvent(privateRegistryString, self)
	end
	if self.onSaveCallback then
		self.onSaveCallback(self, teeburu[reference], teeburu)
	end
end

function Legolando_NumericInputBoxWithForceNegativeMixin_Angleur:RemoveLeftZeroes()
	-- We do Get() -> Set() to get rid of zeroes on the left side
	local number = self:GetNumber()
	self:SetNumber(number)
	-- add back '-' if forceNegative and the number value ISN'T 0
	if self.forceNegative and number ~= 0 then
		self:InsertMinus()
	end
end

function Legolando_NumericInputBoxWithForceNegativeMixin_Angleur:CheckMinMax()
	local min = self.min
	local max = self.max
	if not min or not max then return end
	local number = self:GetNumber()
	print("CheckMinMax number: ", number)
	if number < min then
		self:SetNumber(min)
	elseif number > max then
		self:SetNumber(max)
	end
end

function Legolando_NumericInputBoxWithForceNegativeMixin_Angleur:InsertMinus()
	self:SetCursorPosition(0)
	self:Insert("-")
	local letters = self:GetNumLetters()
	self:SetCursorPosition(letters)
end

function Legolando_NumericInputBoxWithForceNegativeMixin_Angleur:OnEditFocusGained()
	if self.forceNegative == true then
		-- Done to remove the '0' we replace the '-' with in OnEditFocusLost
		if self:GetNumber() == 0 then
			self:SetText("")
		end
		self:InsertMinus()
		self:HighlightText(1)
	else
		self:HighlightText()
	end
end

function Legolando_NumericInputBoxWithForceNegativeMixin_Angleur:OnEditFocusLost()
	self:ClearHighlightText()
	self:UnregisterEvent("GLOBAL_MOUSE_UP")
	self:RemoveLeftZeroes()
	self:CheckMinMax()
	self:SaveToTable()
end

------------------------------------------------------------------------------------------
----------------------- For Visual Consistency when Force Negative -----------------------
------------------------------------------------------------------------------------------
function Legolando_NumericInputBoxWithForceNegativeMixin_Angleur:OnCursorChanged(...)
	if not self.forceNegative then return end
	print("wobaam")
	-- need to call GetCursorPosition because OnCursorChanged's parameters are REAL COORDINATE based(for whatever reason)
	local pos = self:GetCursorPosition()
	if pos == 0 then 
		local firstCharacter = string.sub(self:GetText(), 1, 1)
		if firstCharacter ~= "-" then
			self:InsertMinus()
		end
		self:SetCursorPosition(1)
	end
end
function Legolando_NumericInputBoxWithForceNegativeMixin_Angleur:OnTextChanged(userInput)
	if not userInput then return end
	if not self.forceNegative then return end
	local entry = self:GetNumber()
	print("entry:", entry)
	if entry > 0 then
		self:InsertMinus()
	end
end
------------------------------------------------------------------------------------------


function Legolando_NumericInputBoxWithForceNegativeMixin_Angleur:SetForcePositive()
	-- just need to call this to remove numericFullRange
	self:SetNumeric(true)
end

function Legolando_NumericInputBoxWithForceNegativeMixin_Angleur:SetForceNegative()
	print("setting force negative")
	self.forceNegative = true
	local newMax = self:GetMaxLetters() + 1
	self:SetMaxLetters(newMax)
end


function Legolando_NumericInputBoxWithForceNegativeMixin_Angleur:Init(min, max)
	local teeburu = self.savedVarTable
	local reference = self.reference
	if not teeburu or not reference or not teeburu[reference] then
		print("Table or Reference missing for EditBoxes")
		return
	end
	local privateRegistry = self.privateRegistry
	local privateRegistryString = self.privateRegistryString
	if privateRegistry and privateRegistryString then
		privateRegistry:RegisterCallback(privateRegistryString, function(_, caller)
			if caller and caller == self then return end
			print("höh")
			self:Update()
		end)
	end
	if min and max then
		self.min = min
		self.max = max
		if min < 0 and max <= 0 then
			self:SetForceNegative()
		elseif min >= 0 and max > 0 then
			self:SetForcePositive()
		end
	end
	self:Update()
end



-- This template doesn't have an Init() function, it's kept ultra simple, meant to be used with "Legolando_MinSecEditBoxesTemplate"
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
end

-- Uses "Legolando_EditBoxNoTextureMixinTemplate"
Legolando_MinSecEditBoxesMixin_Angleur = {}

function Legolando_MinSecEditBoxesMixin_Angleur:debugPrint(...)
	if not self.debug then return end
	print(...)
end

-- Good idea to force update every time it's shown
-- to clear leftovers force when table values are changed from outside sources 
function Legolando_MinSecEditBoxesMixin_Angleur:OnShow()
	if not self.initiated then return end
	self:Update()
end

-- Only need to call if table value is changed by outside source(ie: not the editbox itself)
-- :Show() will also call :Update() and can be used as a replacement
function Legolando_MinSecEditBoxesMixin_Angleur:Update()
	self:SeparateValues()
	self:FillBoxes()
end

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
	self:debugPrint("Saved value: ", teeburu[reference], "Separating...")
	self.separateValues.minutes = math.floor(value / 60)
	self.separateValues.seconds = value % 60
end

local function combineValues(minutes, seconds)
	local combined = minutes * 60 + seconds
	return combined
end
-- No need for parameters to SaveToTable since it will use self.separateValues for setting
function Legolando_MinSecEditBoxesMixin_Angleur:SaveToTable()
	local teeburu = self.savedVarTable
	local reference = self.reference
	local privateRegistry = self.privateRegistry
	local privateRegistryString = self.privateRegistryString
	if not teeburu or not reference or not teeburu[reference] then
		print("Table or Reference missing for EditBoxes")
		return
	end
	teeburu[reference] = combineValues(self.separateValues.minutes, self.separateValues.seconds)
	self:debugPrint("Time set to: ", self.separateValues.minutes, " minutes, ", self.separateValues.seconds, " seconds")
	self:debugPrint("Total time in seconds: ", teeburu[reference])
	if privateRegistry and privateRegistryString then
		privateRegistry:TriggerEvent(privateRegistryString, self)
	end
	if self.onSaveCallback then
		-- Table is returned in case the original code wants to alter other indexes if & when value changes(used in Angleur'self items_base.lua)
		self.onSaveCallback(self, teeburu[reference], teeburu)
	end
end

function Legolando_MinSecEditBoxesMixin_Angleur:Init()
	local teeburu = self.savedVarTable
	local reference = self.reference
	if not teeburu or not reference or not teeburu[reference] then
		print("Table or Reference missing for EditBoxes")
		return
	end
	local privateRegistry = self.privateRegistry
	local privateRegistryString = self.privateRegistryString
	if privateRegistry and privateRegistryString then
		privateRegistry:RegisterCallback(privateRegistryString, function(_, caller)
			if caller and caller == self then return end
			self:Update()
		end)
	end
	self.initiated = true
	self.separateValues = {}
	self:Update()
	self.minutes.callback = function(editBox, value) 
		self.separateValues.minutes = value
		addZeroesToEditBox(editBox)
		self:SaveToTable()
	end
	self.seconds.callback = function(editBox, value) 
		self.separateValues.seconds = value
		addZeroesToEditBox(editBox)
		self:SaveToTable()
	end
end

