local combine = require("osmium.groups.utils").combine

---@param highlights HighlightGroups
---@param colors Palette
return function(highlights, colors)
    return combine(highlights, {
        FFFGitUntracked = { bg = colors.greenBg, fg = colors.greenFg },
        FFFGitIgnored = { bg = colors.surface3, fg = colors.foreground2 },
        FFFGitModified = { bg = colors.yellowBg, fg = colors.yellowFg },
        FFFGitDeleted = { bg = colors.redBg, fg = colors.redFg },
        FFFGitRenamed = { bg = colors.yellowBg, fg = colors.yellowFg },
        FFFGitStaged = { bg = colors.greenBg, fg = colors.greenFg },

        FFFGitSignUntracked = { bg = colors.greenBg, fg = colors.greenFg },
        FFFGitSignIgnored = { bg = colors.surface3, fg = colors.foreground2 },
        FFFGitSignModified = { bg = colors.yellowBg, fg = colors.yellowFg },
        FFFGitSignDeleted = { bg = colors.redBg, fg = colors.redFg },
        FFFGitSignRenamed = { bg = colors.yellowBg, fg = colors.yellowFg },
        FFFGitSignStaged = { bg = colors.greenBg, fg = colors.greenFg },
    })
end
