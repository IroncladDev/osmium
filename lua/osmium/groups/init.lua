local highlight_integrations = require("osmium.groups.integrations")

---@alias HighlightGroups table<string, vim.api.keyset.highlight>

---setup highlight groups
---@param configs OsmiumConfig
---@return HighlightGroups
---@nodiscard
local function setup(configs)
    local colors = configs.colors --[[@as Palette]]
    assert(colors ~= nil, "Must pass colors")

    local KEYWORD = colors.green5
    local STRING = colors.blue5
    local SPECIAL = colors.orange5
    local COMMENT = colors.foreground2
    local LITERAL = colors.green4
    local VARIABLE = colors.foreground1
    local METHOD = colors.foreground0
    local FUNCTION = colors.foreground0
    local PROPERTY = colors.orange4
    local SYMBOL = colors.purple3
    local TYPE = colors.yellow5

    local endOfBuffer = {
        fg = configs.show_end_of_buffer and colors.surface0 or colors.root,
    }

    local highlights = {
        CurSearch = { fg = colors.root, bg = colors.orange4 },
        Cursor = { reverse = true, },
        CursorColumn = { bg = colors.surface1, },
        CursorLine = { bg = colors.surface1, },
        Directory = { fg = colors.blue4, },
        DiffAdd = { bg = colors.green0, },
        DiffChange = { bg = colors.yellow0 },
        DiffDelete = { bg = colors.red0, fg = colors.red0 },
        DiffText = { fg = colors.yellow5, bg = colors.yellow1 },
        DiffTextAdd = { fg = colors.green5, bg = colors.green1 },
        EndOfBuffer = endOfBuffer,

        OkMsg = { fg = colors.green4, },
        WarningMsg = { fg = colors.yellow4, },
        ErrorMsg = { fg = colors.red4, },
        StderrMsg = { fg = colors.red4, },
        StdoutMsg = { fg = colors.foreground0, },

        WinSeparator = { fg = colors.root, },
        Folded = { fg = colors.blue5, bg = colors.blue0 },
        SignColumn = { bg = colors.surface1 },
        FoldColumn = { bg = colors.surface1 },
        IncSearch = { fg = colors.orange5, bg = colors.orange0, },
        Substitute = { fg = colors.orange5, bg = colors.orange0, },

        LineNr = { fg = colors.foreground2, bg = colors.surface1 },
        CursorLineNr = { fg = colors.foreground1, bg = colors.surface2, bold = true, },

        MatchParen = { underline = true, sp = colors.blue3 },
        ModeMsg = { fg = colors.foreground1 },
        MsgArea = { bg = colors.root },
        MoreMsg = { fg = colors.foreground1 },

        Normal = { fg = colors.foreground0, bg = colors.surface0, },
        NormalFloat = { fg = colors.foreground0, bg = colors.surface2 },

        FloatBorder = { fg = colors.surface4, bg = colors.surface1 },
        FloatShadow = { bg = colors.root },

        Pmenu = { fg = colors.foreground1, bg = colors.surface2, },
        PmenuSel = { fg = colors.foreground0, bg = colors.surface3, },
        PmenuSbar = { bg = colors.surface1, },
        PmenuThumb = { bg = colors.green4 },
        PmenuExtra = { bg = colors.surface2 },
        PmenuKindSel = { bg = colors.surface2, },
        PmenuBorder = { fg = colors.foreground2, },
        PmenuShadow = { bg = colors.root, },

        StatusLine = { fg = colors.green4, bg = colors.green0, },
        StatusLineNC = { fg = colors.foreground1, bg = colors.surface1, },
        StatusLineTerm = { fg = colors.blue4, bg = colors.blue0, },
        StatusLineTermNC = { fg = colors.foreground1, bg = colors.surface1, },

        TabLine = { fg = colors.foreground2, bg = colors.surface1 },
        TabLineSel = { fg = colors.foreground1, bg = colors.surface2 },
        TabLineFill = { bg = colors.root, },

        Visual = { bg = colors.surface2, },

        Search = { fg = colors.orange5, bg = colors.orange0, },

        Question = { fg = colors.blue4, },
        SpecialKey = { fg = colors.foreground2, },

        SpellBad = { undercurl = true, sp = colors.yellow4 },

        -- Diagnostics
        DiagnosticError = { fg = colors.red5, bg = colors.red1 },
        DiagnosticWarn = { fg = colors.yellow5, bg = colors.yellow1 },
        DiagnosticInfo = { fg = colors.blue5, bg = colors.blue1 },
        DiagnosticHint = { fg = colors.blue5, bg = colors.blue1 },
        DiagnosticUnderlineError = { undercurl = true, sp = colors.red4, },
        DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow4, },
        DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue4, },
        DiagnosticUnderlineHint = { undercurl = true, sp = colors.blue4, },

        -- Inlay Hints
        LspInlayHint = { fg = colors.blue2, },

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
        SpecialComment = { fg = colors.purple5, italic = true, },

        Underlined = { fg = colors.blue5, underline = true, },
        Error = { fg = colors.red5, },
        Todo = { fg = colors.orange5, bold = true, italic = true, },

        Added = { fg = colors.green5, bg = colors.green1 },
        Changed = { fg = colors.yellow5, bg = colors.yellow1 },
        Removed = { fg = colors.red5, bg = colors.red1 },

        -- TreeSitter
        ['@error'] = { fg = colors.red3, },
        ['@punctuation.delimiter'] = { fg = SYMBOL, },
        ['@punctuation.bracket'] = { fg = SYMBOL, },
        ['@markup.list'] = { fg = colors.blue2, },

        ['@constant'] = { fg = TYPE, },
        ['@constant.builtin'] = { fg = LITERAL, },
        ['@markup.link.label.symbol'] = { fg = SYMBOL, },

        ['@constant.macro'] = { fg = LITERAL, },
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
        ['@function.macro'] = { fg = FUNCTION, },
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
        ['@variable.builtin'] = { fg = LITERAL, },

        ['@markup'] = { fg = colors.foreground2, },
        ['@markup.strong'] = { fg = colors.orange4, bold = true, },     -- bold
        ['@markup.emphasis'] = { fg = colors.yellow4, italic = true, }, -- italic
        ['@markup.underline'] = { fg = colors.orange4, },
        ['@markup.heading'] = { fg = colors.red5, bold = true, },      -- title
        ['@markup.raw'] = { fg = colors.green4, },                     -- inline code
        ['@markup.link.url'] = { fg = colors.blue5, italic = true, }, -- urls
        ['@markup.link'] = { fg = colors.blue4, bold = true, },

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
        ['@decorator'] = { fg = colors.yellow5 },

        -- LSP Semantic (0.9+)
        ['@lsp.type.class'] = { fg = TYPE, },
        ['@lsp.type.enum'] = { fg = TYPE, },
        ['@lsp.type.decorator'] = { fg = colors.pink5 },
        ['@lsp.type.enumMember'] = { fg = PROPERTY, },
        ['@lsp.type.function'] = { fg = FUNCTION, },
        ['@lsp.type.interface'] = { fg = TYPE },
        ['@lsp.type.macro'] = { fg = colors.pink5 },
        ['@lsp.type.method'] = { fg = METHOD, },
        ['@lsp.type.namespace'] = { fg = TYPE, },
        ['@lsp.type.parameter'] = { fg = VARIABLE, },
        ['@lsp.type.property'] = { fg = PROPERTY, },
        ['@lsp.type.struct'] = { fg = TYPE },
        ['@lsp.type.type'] = { fg = TYPE },
        ['@lsp.type.variable'] = { fg = VARIABLE, },

        -- Language-specific
        ['@keyword.conditional.ternary.typescript'] = { fg = SYMBOL, },
    }

    return highlight_integrations(highlights, configs)
end

return {
    setup = setup,
}
