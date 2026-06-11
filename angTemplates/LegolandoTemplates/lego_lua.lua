-- 'ang' is the angleur namespace
local addonName, ang = ...
ang.lego = {}
local lego = ang.lego



-- Shuffle Algoritm by: MHebes on stackoverflow
function lego.table_randomSort(teeburu)
    for i = #teeburu, 2, -1 do
        local j = math.random(i)
        teeburu[i], teeburu[j] = teeburu[j], teeburu[i]
    end
end