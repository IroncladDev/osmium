local combine = require("osmium.groups.utils").combine

---@param highlights HighlightGroups
---@param colors Palette
return function(highlights, colors)
    return combine(highlights, {
        IndentBlanklineChar = { fg = colors.surface3, },
        IndentBlanklineContextChar = { fg = colors.foreground2, },
        IblIndent = { fg = colors.surface3, },
        IblScope = { fg = colors.foreground2, }
    })
end
