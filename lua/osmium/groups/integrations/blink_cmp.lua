local combine = require("osmium.groups.utils").combine

---@param highlights HighlightGroups
---@param colors Palette
local function highlight_blink_cmp(highlights, colors)
    return combine(highlights, {
        BlinkCmpLabel = { fg = colors.foreground2, bg = colors.surface1 },
        BlinkCmpLabelDeprecated = { fg = colors.foreground2, bg = colors.surface1 },
        BlinkCmpLabelMatch = { fg = colors.blue2, bg = colors.surface1 },
        BlinkCmpKind = { fg = colors.foreground2, bg = colors.surface1 },
        BlinkCmpScrollBarThumb = { bg = colors.foreground1 },
        BlinkCmpScrollBarGutter = { bg = colors.surface1 },
        BlinkCmpKindFunction = { link = "@function" },
        BlinkCmpKindConstructor = { link = "@type" },
        BlinkCmpKindVariable = { link = "@variable" },
        BlinkCmpKindClass = { link = "@type" },
        BlinkCmpKindInterface = { link = "@type" },
        BlinkCmpKindModule = { link = "@module" },
        BlinkCmpKindProperty = { link = "@property" },
        BlinkCmpKindOperator = { link = "@operator" },
        BlinkCmpKindReference = { link = "@variable.parameter.reference" },
        BlinkCmpKindUnit = { link = "@variable.member" },
        BlinkCmpKindValue = { link = "@variable.member" },
        BlinkCmpKindField = { link = "@variable.member" },
        BlinkCmpKindEnum = { link = "@variable.member" },
        BlinkCmpKindKeyword = { link = "@keyword" },
        BlinkCmpKindSnippet = { link = "@markup" },
        BlinkCmpKindColor = { link = "DevIconCss" },
        BlinkCmpKindFile = { link = "TSURI" },
        BlinkCmpKindFolder = { link = "TSURI" },
        BlinkCmpKindEvent = { link = "@constant" },
        BlinkCmpKindEnumMember = { link = "@variable.member" },
        BlinkCmpKindConstant = { link = "@constant" },
        BlinkCmpKindStruct = { link = "@structure" },
        BlinkCmpKindTypeParameter = { link = "@variable.parameter" },
    })
end

return highlight_blink_cmp
