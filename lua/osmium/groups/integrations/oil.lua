local combine = require("osmium.groups.utils").combine

---@param highlights HighlightGroups
---@param colors Palette
return function(highlights, colors)
    return combine(highlights, {
        OilDir = { link = "Directory" },
        OilDirIcon = { link = "Directory" },
        OilHidden = { link = "Comment" },
        OilDirHidden = { link = "Comment" },
        OilFile = { link = "Normal" },
        OilFileHidden = { link = "Comment" },
        OilLink = { fg = colors.purpleFg },
        OilLinkTarget = { link = "Comment" },
        OilLinkHidden = { link = "Comment" },
        OilLinkTargetHidden = { link = "Comment" },
        OilOrphanLink = { fg = colors.redFg },
        OilOrphanLinkTarget = { link = "DiagnosticError" },
        OilOrphanLinkHidden = { link = "Comment" },
        OilOrphanLinkTargetHidden = { link = "DiagnosticError" },
        OilSocket = { link = "Keyword" },
        OilSocketHidden = { link = "Comment" },
        OilCreate = { link = "DiagnosticInfo" },
        OilDelete = { link = "DiagnosticError" },
        OilMove = { link = "DiagnosticWarn" },
        OilCopy = { link = "DiagnosticHint" },
        OilChange = { link = "Special" },
        OilRestore = { link = "DiagnosticInfo" },
        OilPurge = { link = "DiagnosticError" },
        OilTrash = { link = "DiagnosticError" },
        OilTrashSourcePath = { link = "Comment" },
    })
end
