local combine = require("osmium.groups.utils").combine

---@param highlights HighlightGroups
---@param colors Palette
local function highlight_telescope(highlights, colors)
    return combine(highlights, {
        TelescopePromptBorder = { fg = colors.foreground0, },
        TelescopeResultsBorder = { fg = colors.red2, },
        TelescopePreviewBorder = { fg = colors.red3, },
        TelescopeSelection = { fg = colors.foreground2, bg = colors.surface0, },
        TelescopeMultiSelection = { fg = colors.purple2, bg = colors.surface0, },
        TelescopeNormal = { fg = colors.foreground1, bg = colors.root, },
        TelescopeMatching = { fg = colors.green2, },
        TelescopePromptPrefix = { fg = colors.purple2, },
        TelescopeResultsDiffDelete = { fg = colors.red2 },
        TelescopeResultsDiffChange = { fg = colors.blue2 },
        TelescopeResultsDiffAdd = { fg = colors.green2 },
    })
end

return highlight_telescope
