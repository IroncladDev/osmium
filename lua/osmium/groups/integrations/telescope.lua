local combine = require("osmium.groups.utils").combine

---@param highlights HighlightGroups
---@param colors Palette
return function(highlights, colors)
    return combine(highlights, {
        TelescopePromptBorder = { fg = colors.foreground2, },
        TelescopeResultsBorder = { fg = colors.foreground2, },
        TelescopePreviewBorder = { fg = colors.foreground2, },
        TelescopeSelection = { bg = colors.surface1 },
        TelescopeNormal = { fg = colors.foreground0, },
        TelescopeMatching = { fg = colors.orangeFg, bg = colors.orangeBg, },
        TelescopeResultsDiffDelete = { fg = colors.redFg, bg = colors.redBg },
        TelescopeResultsDiffChange = { fg = colors.yellowFg, bg = colors.yellowBg },
        TelescopeResultsDiffAdd = { fg = colors.greenFg, bg = colors.greenBg },
    })
end
