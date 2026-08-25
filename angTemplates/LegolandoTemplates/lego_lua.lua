-- 'ang' is the angleur namespace
local addonName, ang = ...
ang.lego = {}
local lego = ang.lego


-- Grid Tex Coords:
-- GetTexCoordsByGrid(nthRow, , nthColumn, textureHeight, cellWidth, cellHeight)

-- Pixel by Pixel Tex Coords:
-- TextureBase:SetTextureSliceMargins(left, top, right, bottom)
-- also: <TextureSliceMargins left="" right="" top="" bottom=""/>


-- Shuffle Algoritm by: MHebes on stackoverflow
function lego.table_randomSort(teeburu)
    for i = #teeburu, 2, -1 do
        local j = math.random(i)
        teeburu[i], teeburu[j] = teeburu[j], teeburu[i]
    end
end

function lego.debugStack(includeCaller)
    local depth = 3
    if includeCaller then depth = 2 end
    local trace = debugstack(depth, 5, 5)
    -- debugstack puts a newline(\n) for each function, so we can split them like this
    local split = strsplittable("\n", trace)
    -- do get rid of the empty string after the last newline
    if split[#split] == "" then
        split[#split] = nil
    end
    print("\nCall stack: \n");
    DevTools_Dump(split)
end
