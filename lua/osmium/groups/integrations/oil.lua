local combine = require("osmium.groups.utils").combine

---@param highlights HighlightGroups
---@param colors Palette
return function(highlights, colors)
    return combine(highlights, {
        OilDir = { fg = colors.blueFg, bold = true },
        OilDirIcon = { fg = colors.blueFg },
        OilLink = { fg = colors.purpleFg },
        OilLinkTarget = { fg = colors.purpleFgDim },
        OilOrphanLink = { fg = colors.redFg },
        OilOrphanLinkTarget = { fg = colors.redFgDim },
        OilFile = { fg = colors.foreground1 },
        OilHidden = { fg = colors.foreground2 },
        OilDirHidden = { fg = colors.blueFgDim },
        OilFileHidden = { fg = colors.foreground2 },
        OilLinkHidden = { fg = colors.purpleFgDim },
        OilLinkTargetHidden = { fg = colors.foreground2 },
        OilOrphanLinkHidden = { fg = colors.redFgDim },
        OilOrphanLinkTargetHidden = { fg = colors.foreground2 },
        OilSocket = { fg = colors.pinkFg },
        OilSocketHidden = { fg = colors.pinkFgDim },
        OilCreate = { fg = colors.greenFg, bg = colors.greenBg },
        OilDelete = { fg = colors.redFg, bg = colors.redBg },
        OilMove = { fg = colors.yellowFg, bg = colors.yellowBg },
        OilCopy = { fg = colors.blueFg, bg = colors.blueBg },
        OilChange = { fg = colors.orangeFg, bg = colors.orangeBg },
        OilRestore = { fg = colors.greenFg },
        OilPurge = { fg = colors.redFg },
        OilTrash = { fg = colors.foreground2 },
        OilTrashSourcePath = { fg = colors.foreground2 },
    })
end
