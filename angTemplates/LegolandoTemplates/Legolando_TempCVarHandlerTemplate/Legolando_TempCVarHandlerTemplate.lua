-- This method is what I will use for handling temporary CVar changes going forward



-- local temp_CVars = {
--     colorblindSimulator = {
--         active = false, cached = nil, setTo = "3", updating = false,
--     },
--     RenderScale = {
--         active = false, cached = nil, setTo = "0.2", updating = false,
--     }
-- }

Legolando_TempCVarHandlerMixin_Angleur = {}

function Legolando_TempCVarHandlerMixin_Angleur:Init()
    local teeburu = self.tempCVarsTable
    if not teeburu or next(teeburu) == nil then 
        print("No valid Temp CVars Table")
        return 
    end
    self:RegisterEvent("CVAR_UPDATE")
    self:SetScript("OnEvent", function(self, event, unit, ...)
        local arg4 = ...
        if event ~= "CVAR_UPDATE" then return end
        local cVar = teeburu[unit]
        if not cVar then return end
        if cVar.updating == true then
            -- CVar updated by addon, dont overwrite
            return
        end
        -- CVar updated manually(or by another addon), overwrite
        cVar.cached = arg4
    end)
end

function Legolando_TempCVarHandlerMixin_Angleur:Set(key)
    local teeburu = self.tempCVarsTable
    if not teeburu or next(teeburu) == nil then 
        print("No valid Temp CVars Table")
        return
    end
    if not key or not teeburu[key] then
        print("temp CVar key or its referenced element is missing")
        return
    end
    local cVar = teeburu[key]
    if cVar.active == true then return end
    cVar.cached = C_CVar.GetCVar(key)
    cVar.updating = true
    C_CVar.SetCVar(key, cVar.setTo)
    self:SetScript("OnUpdate", function(self)
        cVar.updating = false
        self:SetScript("OnUpdate", nil)
    end)
    cVar.active = true
    -- print(GetTime())
end

function Legolando_TempCVarHandlerMixin_Angleur:Release(key)
    local teeburu = self.tempCVarsTable
    if not teeburu or next(teeburu) == nil then 
        print("No valid Temp CVars Table")
        return
    end
    if not key or not teeburu[key] then
        print("temp CVar key or its referenced element is missing")
        return
    end
    local cVar = teeburu[key]
    if cVar.active == false then return end
    cVar.updating = true
    C_CVar.SetCVar(key, cVar.cached)
    self:SetScript("OnUpdate", function(self)
        cVar.updating = false
        self:SetScript("OnUpdate", nil)
    end)
    cVar.cached = nil
    cVar.active = false
    -- print(GetTime())
end

function Legolando_TempCVarHandlerMixin_Angleur:SetAll()
    local teeburu = self.tempCVarsTable
    if not teeburu or next(teeburu) == nil then 
        print("No valid Temp CVars Table")
        return
    end
    for i, v in pairs(teeburu) do
        self:Set(i)
    end
end

function Legolando_TempCVarHandlerMixin_Angleur:ReleaseAll()
    local teeburu = self.tempCVarsTable
    if not teeburu or next(teeburu) == nil then 
        print("No valid Temp CVars Table")
        return
    end
    for i, v in pairs(teeburu) do
        self:Release(i)
    end
end

