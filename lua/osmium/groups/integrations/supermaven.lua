local combine = require("osmium.groups.utils").combine

---@param highlights HighlightGroups
---@param colors Palette
local function highlight_supermaven(highlights, colors)
    return combine(highlights, {
        SupermavenSuggestion = { fg = colors.green3, bg = colors.red0 },
    })
end

return highlight_supermaven
