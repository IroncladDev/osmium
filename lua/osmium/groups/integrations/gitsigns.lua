local combine = require("osmium.groups.utils").combine

---@param highlights HighlightGroups
---@param colors Palette
local function highlight_gitsigns(highlights, colors)
    return combine(highlights, {
        GitSignsAdd = { fg = colors.green3, },
        GitSignsChange = { fg = colors.blue2, },
        GitSignsDelete = { fg = colors.red3, },
        GitSignsAddLn = { fg = colors.foreground2, bg = colors.green3, },
        GitSignsChangeLn = { fg = colors.foreground2, bg = colors.blue2, },
        GitSignsDeleteLn = { fg = colors.foreground2, bg = colors.red3, },
        GitSignsCurrentLineBlame = { fg = colors.foreground2, },
        BlinkCmpKindTypeParameter = { link = "@variable.parameter" },
    })
end

return highlight_gitsigns
