local combine = require("osmium.groups.utils").combine

---@param highlights HighlightGroups
---@param colors Palette
return function(highlights, colors)
    return combine(highlights, {
        MiniIconsAzure = { fg = colors.blueFg },
        MiniIconsBlue = { fg = colors.blueFg },
        MiniIconsCyan = { fg = colors.blueFg },
        MiniIconsGreen = { fg = colors.greenFg },
        MiniIconsGrey = { fg = colors.foreground2 },
        MiniIconsOrange = { fg = colors.orangeFg },
        MiniIconsPurple = { fg = colors.purpleFg },
        MiniIconsRed = { fg = colors.redFg },
        MiniIconsYellow = { fg = colors.yellowFg },
    })
end
