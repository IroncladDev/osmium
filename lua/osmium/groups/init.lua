local highlight_integrations = require("osmium.groups.integrations")

---@alias HighlightGroups table<string, vim.api.keyset.highlight>

---setup highlight groups
---@param configs OsmiumConfig
---@return HighlightGroups
---@nodiscard
local function setup(configs)
    local colors = configs.colors --[[@as Palette]]
    assert(colors ~= nil, "Must pass colors")

    local KEYWORD = colors.greenFg
    local STRING = colors.purpleFg
    local SPECIAL = colors.pinkFg
    local COMMENT = colors.foreground2
    local LITERAL = colors.purpleFg
    local VARIABLE = colors.foreground0
    local METHOD = colors.greenFgDim
    local FUNCTION = colors.blueFgDim
    local PROPERTY = colors.blueFgDim
    local SYMBOL = colors.foreground2
    local TYPE = colors.yellowFg
    local MACRO = colors.pinkFg

    local highlights = {
        CurSearch = { fg = colors.root, bg = colors.orangeFgDim },
        Cursor = { reverse = true, },
        CursorColumn = { bg = colors.surface1, },
        CursorLine = { bg = colors.surface1, },
        Directory = { fg = colors.blueFgDim, },
        DiffAdd = { fg = colors.greenFg, bg = colors.greenBg },
        DiffChange = { fg = colors.yellowFg, bg = colors.yellowBg },
        DiffDelete = { fg = colors.redFg, bg = colors.redBg },
        DiffText = { fg = colors.yellowFg, bg = colors.yellowBg },
        DiffTextAdd = { fg = colors.greenFg, bg = colors.greenBg },
        EndOfBuffer = {
            fg = configs.show_end_of_buffer and colors.blueBgBright or colors.surface0,
        },

        OkMsg = { fg = colors.greenFgDim, },
        WarningMsg = { fg = colors.yellowFgDim, },
        ErrorMsg = { fg = colors.redFgDim, },
        StderrMsg = { fg = colors.redFgDim, },
        StdoutMsg = { fg = colors.foreground0, },

        WinSeparator = { fg = colors.root, },
        Folded = { fg = colors.blueFg, bg = colors.blueBg },
        SignColumn = {
            bg = configs.transparent_bg and colors.transparent or colors.surface0,
        },
        FoldColumn = { bg = colors.surface1 },
        IncSearch = { fg = colors.orangeFg, bg = colors.orangeBg, },
        Substitute = { fg = colors.orangeFg, bg = colors.orangeBg, },

        LineNr = { fg = colors.foreground2, bg = colors.surface1 },
        CursorLineNr = { fg = colors.foreground1, bg = colors.surface2, bold = true, },

        MatchParen = { underline = true },
        ModeMsg = { fg = colors.foreground1 },
        MsgArea = { bg = colors.root },
        MoreMsg = { fg = colors.foreground1 },

        Normal = {
            fg = colors.foreground0,
            bg = configs.transparent_bg and "NONE" or colors.surface0,
        },
        NormalFloat = { fg = colors.foreground0, bg = colors.surface2 },

        FloatBorder = { fg = colors.surface4, bg = colors.surface1 },
        FloatShadow = { bg = colors.root },

        Pmenu = { fg = colors.foreground1, bg = colors.surface2, },
        PmenuSel = { fg = colors.foreground0, bg = colors.surface3, },
        PmenuSbar = { bg = colors.surface1, },
        PmenuThumb = { bg = colors.greenFgDim },
        PmenuExtra = { bg = colors.surface2 },
        PmenuKindSel = { bg = colors.surface2, },
        PmenuBorder = { fg = colors.foreground2, },
        PmenuShadow = { bg = colors.root, },

        StatusLine = { fg = colors.greenFgDim, bg = colors.greenBg, },
        StatusLineNC = { fg = colors.foreground1, bg = colors.surface1, },
        StatusLineTerm = { fg = colors.greenFgDim, bg = colors.greenBg, },
        StatusLineTermNC = { fg = colors.foreground1, bg = colors.surface1, },

        TabLine = { fg = colors.foreground2, bg = colors.surface1 },
        TabLineSel = { fg = colors.foreground1, bg = colors.surface2 },
        TabLineFill = { bg = colors.root, },

        Visual = { bg = colors.surface2, },

        Search = { fg = colors.orangeFg, bg = colors.orangeBg, },

        Question = { fg = colors.blueFgDim, },
        SpecialKey = { fg = colors.foreground2, },

        SpellBad = { undercurl = true, sp = colors.yellowFgDim },

        -- Diagnostics
        DiagnosticError = { fg = colors.redFg, bg = colors.redBgBright },
        DiagnosticWarn = { fg = colors.yellowFg, bg = colors.yellowBgBright },
        DiagnosticInfo = { fg = colors.purpleFg, bg = colors.purpleBgBright },
        DiagnosticHint = { fg = colors.blueFg, bg = colors.blueBgBright },
        DiagnosticUnderlineError = { undercurl = true, sp = colors.redFgDim, },
        DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellowFgDim, },
        DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blueFgDim, },
        DiagnosticUnderlineHint = { undercurl = true, sp = colors.blueFgDim, },

        -- Inlay Hints
        LspInlayHint = { fg = colors.foreground2, italic = true, },

        -- LSP stuff
        Comment = { fg = COMMENT, italic = configs.italic_comment, },

        Constant = { fg = VARIABLE, },
        String = { fg = STRING, },
        Character = { fg = STRING, },
        Number = { fg = LITERAL, },
        Boolean = { fg = LITERAL, },
        Float = { fg = LITERAL, },

        Identifier = { fg = VARIABLE, },
        Function = { fg = VARIABLE, },

        Statement = { fg = KEYWORD, },
        Conditional = { fg = KEYWORD, },
        Repeat = { fg = KEYWORD, },
        Label = { fg = SYMBOL, },
        Operator = { fg = SYMBOL, },
        Keyword = { fg = KEYWORD, },
        Exception = { fg = KEYWORD, },

        PreProc = { fg = KEYWORD, },
        Include = { fg = KEYWORD, },
        Define = { fg = KEYWORD, },
        Macro = { fg = KEYWORD, },
        PreCondit = { fg = KEYWORD, },

        Type = { fg = TYPE, },
        StorageClass = { fg = KEYWORD, },
        Structure = { fg = KEYWORD, },
        TypeDef = { fg = KEYWORD, },

        Special = { fg = SPECIAL, italic = true },
        SpecialChar = { fg = SPECIAL, italic = true },
        Tag = { fg = colors.foreground1, },
        Delimiter = { fg = SYMBOL, },
        SpecialComment = { fg = colors.purpleFg, italic = true, },

        Underlined = { fg = colors.blueFg, underline = true, },
        Error = { fg = colors.redFg, },
        Todo = { fg = colors.orangeFg, bold = true, italic = true, },

        Added = { fg = colors.greenFg, bg = colors.greenBg },
        Changed = { fg = colors.yellowFg, bg = colors.yellowBg },
        Removed = { fg = colors.redFg, bg = colors.redBg },

        -- TreeSitter
        ['@error'] = { fg = colors.redFgDim, },
        ['@punctuation.delimiter'] = { fg = SYMBOL, },
        ['@punctuation.bracket'] = { fg = SYMBOL, },
        ['@markup.list'] = { fg = colors.blueFgDim, },

        ['@constant'] = { fg = TYPE, },
        ['@constant.builtin'] = { fg = TYPE, },
        ['@markup.link.label.symbol'] = { fg = SYMBOL, },

        ['@constant.macro'] = { fg = MACRO, },
        ['@string.regexp'] = { fg = STRING, },
        ['@string'] = { fg = STRING, },
        ['@string.escape'] = { fg = SPECIAL, },
        ['@string.special.symbol'] = { fg = SPECIAL, },
        ['@character'] = { fg = LITERAL, },
        ['@number'] = { fg = LITERAL, },
        ['@boolean'] = { fg = LITERAL, },
        ['@number.float'] = { fg = LITERAL, },
        ['@annotation'] = { fg = LITERAL, },
        ['@attribute'] = { fg = PROPERTY, },
        ['@module'] = { fg = TYPE, },

        ['@function.builtin'] = { fg = FUNCTION, },
        ['@function'] = { fg = FUNCTION, },
        ['@function.macro'] = { fg = MACRO, },
        ['@variable.parameter'] = { fg = VARIABLE, },
        ['@variable.parameter.reference'] = { fg = VARIABLE, },
        ['@function.method'] = { fg = METHOD, },
        ['@variable.member'] = { fg = VARIABLE, },
        ['@property'] = { fg = PROPERTY, },
        ['@constructor'] = { fg = METHOD, },

        ['@keyword.conditional'] = { fg = KEYWORD, },
        ['@keyword.repeat'] = { fg = KEYWORD, },
        ['@label'] = { fg = SYMBOL, },

        ['@keyword'] = { fg = KEYWORD, },
        ['@keyword.function'] = { fg = KEYWORD, },
        ['@keyword.function.ruby'] = { fg = KEYWORD, },
        ['@keyword.operator'] = { fg = KEYWORD, },
        ['@operator'] = { fg = SYMBOL, },
        ['@keyword.exception'] = { fg = KEYWORD, },
        ['@type'] = { fg = TYPE, },
        ['@type.builtin'] = { fg = TYPE, italic = true, },
        ['@type.qualifier'] = { fg = KEYWORD, },
        ['@structure'] = { fg = KEYWORD, },
        ['@keyword.include'] = { fg = KEYWORD, },

        ['@variable'] = { fg = VARIABLE, },
        ['@variable.builtin'] = { fg = VARIABLE, },

        ['@markup'] = { fg = colors.foreground2, },
        ['@markup.strong'] = { fg = colors.blueFgDim, bold = true, },
        ['@markup.emphasis'] = { fg = colors.yellowFgDim, italic = true, },
        ['@markup.underline'] = { fg = colors.orangeFgDim, },
        ['@markup.heading'] = { fg = colors.greenFg, bold = true, },
        ['@markup.raw'] = { fg = colors.orangeFg },
        ['@markup.link.url'] = { fg = colors.blueFg, italic = true, underline = true },
        ['@markup.link'] = { fg = colors.blueFg, bold = true },
        ['@markup.strikethrough'] = { fg = colors.foreground1, strikethrough = true, },
        ['@punctuation.special.markdown'] = { fg = colors.foreground1, italic = false, },
        ['@label.markdown'] = { fg = colors.orangeFg, },

        ['@tag'] = { fg = colors.foreground1, },
        ['@tag.attribute'] = { fg = PROPERTY, },
        ['@tag.delimiter'] = { fg = SYMBOL, },
        ['@tag.builtin.tsx'] = { fg = colors.foreground1, },

        -- Semantic
        ['@class'] = { fg = TYPE, },
        ['@struct'] = { fg = TYPE },
        ['@enum'] = { fg = TYPE },
        ['@enumMember'] = { fg = PROPERTY, },
        ['@event'] = { fg = PROPERTY },
        ['@interface'] = { fg = TYPE },
        ['@modifier'] = { fg = KEYWORD },
        ['@regexp'] = { fg = STRING },
        ['@typeParameter'] = { fg = TYPE },
        ['@decorator'] = { fg = MACRO },

        -- LSP Semantic (0.9+)
        ['@lsp.type.class'] = { fg = TYPE, },
        ['@lsp.type.enum'] = { fg = TYPE, },
        ['@lsp.type.decorator'] = { fg = MACRO, },
        ['@lsp.type.enumMember'] = { fg = PROPERTY, },
        ['@lsp.type.function'] = { fg = FUNCTION, },
        ['@lsp.type.interface'] = { fg = TYPE },
        ['@lsp.type.macro'] = { fg = MACRO, },
        ['@lsp.type.method'] = { fg = METHOD, },
        ['@lsp.type.namespace'] = { fg = TYPE, },
        ['@lsp.type.parameter'] = { fg = VARIABLE, },
        ['@lsp.type.property'] = { fg = PROPERTY, },
        ['@lsp.type.struct'] = { fg = TYPE },
        ['@lsp.type.type'] = { fg = TYPE },
        ['@lsp.type.variable'] = { fg = VARIABLE, },

        -- Language-specific
        ['@keyword.conditional.ternary.typescript'] = { fg = SYMBOL, },
        ['@markup.heading.html'] = { fg = colors.foreground0 },
        ['@markup.heading.1.html'] = { fg = colors.foreground0 },
        ['@markup.heading.2.html'] = { fg = colors.foreground0 },
        ['@markup.heading.3.html'] = { fg = colors.foreground0 },
        ['@markup.heading.4.html'] = { fg = colors.foreground0 },
        ['@markup.heading.5.html'] = { fg = colors.foreground0 },
        ['@markup.heading.6.html'] = { fg = colors.foreground0 },
    }

    return highlight_integrations(highlights, configs)
end

return {
    setup = setup,
}
