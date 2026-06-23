local combine = require("osmium.groups.utils").combine

---@param highlights HighlightGroups
---@param colors Palette
return function(highlights, colors)
    return combine(highlights, {
        OilDir = { link = "Directory" },
        OilDirIcon = { link = "OilDir" },
        OilHidden = { link = "Comment" },
        OilDirHidden = { link = "OilHidden" },
        OilFile = { link = "Normal" },
        OilFileHidden = { link = "OilHidden" },
        OilLink = { fg = colors.purpleFg },
        OilLinkTarget = { link = "Comment" },
        OilLinkHidden = { link = "OilHidden" },
        OilLinkTargetHidden = { link = "OilHidden" },
        OilOrphanLink = { fg = colors.redFg },
        OilOrphanLinkTarget = { link = "DiagnosticError" },
        OilOrphanLinkHidden = { link = "OilHidden" },
        OilOrphanLinkTargetHidden = { link = "OilOrphanLinkTarget" },
        OilSocket = { link = "Keyword" },
        OilSocketHidden = { link = "OilHidden" },
        OilCreate = { link = "DiagnosticInfo" },
        OilDelete = { link = "DiagnosticError" },
        OilMove = { link = "DiagnosticWarn" },
        OilCopy = { link = "DiagnosticHint" },
        OilChange = { link = "Special" },
        OilRestore = { link = "OilCreate" },
        OilPurge = { link = "OilDelete" },
        OilTrash = { link = "OilDelete" },
        OilTrashSourcePath = { link = "Comment" },

        -- MiniIcons: override to prevent bg inheritance from diagnostic groups
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
