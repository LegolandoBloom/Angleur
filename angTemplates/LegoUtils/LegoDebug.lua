if not LegolandoUtil then return end
if LegolandoUtil.Debug then return end

LegolandoUtil.Debug = {}
local LD = LegolandoUtil.Debug


-- __ ! DO NOT call with COLON ! __
--  LD.CreateDebugHandler 🗸(GOOD)
--  LD:CreateDebugHandler ✗(BAD)
-- ________________________________
function LD.CreateDebugHandler(debugging)
    local debugHandler = {}
    debugHandler.debugging = debugging
    function debugHandler.toggleDebug(enable)
        debugHandler.debugging = enable
    end

    function debugHandler.print(...)
        if not debugHandler.debugging then return end
        print(...)
    end
    
    function debugHandler.dump(toDump)
        if not debugHandler.debugging then return end
        DevTools_Dump(toDump)
    end
    
    function debugHandler.tableToString(tbl)
        if not debugHandler.debugging then return end
        local tableToString = ""
        for i, v in pairs(tbl) do
            local element = "[" .. tostring(i) .. ":" .. tostring(v) .. "]"
            tableToString = tableToString .. "  " .. element
        end
        print(tableToString)
    end
	return debugHandler;
end
