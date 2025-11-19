local combine = require("osmium.groups.utils").combine

---@param highlights HighlightGroups
---@param colors Palette
return function(highlights, colors)
    return combine(highlights, {
        GitSignsAdd = { fg = colors.greenFg, },
        GitSignsChange = { fg = colors.yellowFg, },
        GitSignsDelete = { fg = colors.redFg },
        GitSignsAddLn = { fg = colors.foreground2, bg = colors.greenBg, },
        GitSignsChangeLn = { fg = colors.foreground2, bg = colors.yellowBg, },
        GitSignsDeleteLn = { fg = colors.foreground2, bg = colors.redFg, },
        GitSignsCurrentLineBlame = { fg = colors.foreground2, },
    })
end
