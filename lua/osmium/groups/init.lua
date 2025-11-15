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
    local STRING = colors.green4
    local STRING_ESCAPE = colors.purple4
    local COMMENT = colors.foreground2
    local LITERAL = colors.green4
    local VARIABLE = colors.foreground1
    local METHOD = colors.foreground0
    local PROPERTY = colors.foreground1
    local SYMBOL = colors.purple3
    local TYPE = colors.blue5

    local endOfBuffer = {
        fg = configs.show_end_of_buffer and colors.surface0 or colors.root,
    }

    local highlights = {
        CurSearch = { fg = colors.root, bg = colors.orange4 },
        Cursor = { reverse = true, },
        CursorColumn = { bg = colors.surface1, },
        CursorLine = { bg = colors.surface1, },
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
        IncSearch = { fg = colors.orange5, bg = colors.orange0, },
        Substitute = { fg = colors.orange5, bg = colors.orange0, },

        LineNr = { fg = colors.foreground2, bg = colors.surface1 },
        CursorLineNr = { fg = colors.foreground1, bg = colors.surface2, bold = true, },

        MatchParen = { underline = true, sp = colors.blue3 },
        ModeMsg = { fg = colors.foreground1 },
        MsgArea = { bg = colors.root },
        MoreMsg = { fg = colors.foreground1 },

        Normal = { fg = colors.foreground0, bg = colors.surface0, },
        NormalFloat = { fg = colors.foreground0, },

        FloatBorder = { fg = colors.foreground2, },
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

        -- LSP stuff
        Comment = { fg = COMMENT, italic = configs.italic_comment, },

        Constant = { fg = colors.foreground0, },
        String = { fg = STRING, },
        Character = { fg = STRING, },
        Number = { fg = LITERAL, },
        Boolean = { fg = LITERAL, },
        Float = { fg = LITERAL, },

        Identifier = { fg = colors.foreground1, },
        Function = { fg = colors.foreground1, },

        Statement = { fg = KEYWORD, },
        Conditional = { fg = colors.green4, },
        Repeat = { fg = colors.pink2, },
        Label = { fg = colors.blue2, },
        Operator = { fg = colors.foreground2, },
        Keyword = { fg = KEYWORD, },
        Exception = { fg = colors.purple2, },

        PreProc = { fg = colors.yellow2, },
        Include = { fg = KEYWORD, },
        Define = { fg = KEYWORD, },
        Title = { fg = colors.blue2, },
        Macro = { fg = colors.purple2, },
        PreCondit = { fg = colors.blue2, },

        Type = { fg = TYPE, },
        StorageClass = { fg = colors.pink2, },
        Structure = { fg = colors.yellow2, },
        TypeDef = { fg = colors.yellow2, },

        Special = { fg = colors.green2, italic = true },
        SpecialChar = { fg = colors.green2, italic = true },
        SpecialComment = { fg = COMMENT, italic = true, },

        Underlined = { fg = colors.blue2, underline = true, },
        Error = { fg = colors.red3, },
        Todo = { fg = COMMENT, bold = true, italic = true, },

        Added = { fg = colors.green4, bg = colors.green1 },
        Changed = { fg = colors.yellow4, bg = colors.yellow1 },
        Removed = { fg = colors.red4, bg = colors.red1 },

        -- TreeSitter
        ['@error'] = { fg = colors.red3, },
        ['@punctuation.delimiter'] = { fg = colors.foreground1, },
        ['@punctuation.bracket'] = { fg = SYMBOL, },
        ['@markup.list'] = { fg = colors.blue2, },

        ['@constant'] = { fg = TYPE, },
        ['@constant.builtin'] = { fg = LITERAL, },
        ['@markup.link.label.symbol'] = { fg = colors.purple2, },

        ['@constant.macro'] = { fg = LITERAL, },
        ['@string.regexp'] = { fg = STRING, },
        ['@string'] = { fg = STRING, },
        ['@string.escape'] = { fg = STRING_ESCAPE, },
        ['@string.special.symbol'] = { fg = STRING_ESCAPE, },
        ['@character'] = { fg = LITERAL, },
        ['@number'] = { fg = LITERAL, },
        ['@boolean'] = { fg = LITERAL, },
        ['@number.float'] = { fg = LITERAL, },
        ['@annotation'] = { fg = LITERAL, },
        ['@attribute'] = { fg = PROPERTY, },
        ['@module'] = { fg = TYPE, },

        ['@function.builtin'] = { fg = LITERAL, },
        ['@function'] = { fg = VARIABLE, },
        ['@function.macro'] = { fg = VARIABLE, },
        ['@variable.parameter'] = { fg = VARIABLE, },
        ['@variable.parameter.reference'] = { fg = VARIABLE, },
        ['@function.method'] = { fg = METHOD, },
        ['@variable.member'] = { fg = VARIABLE, },
        ['@property'] = { fg = PROPERTY, },
        ['@constructor'] = { fg = METHOD, },

        ['@keyword.conditional'] = { fg = KEYWORD, },
        ['@keyword.repeat'] = { fg = KEYWORD, },
        ['@label'] = { fg = colors.blue2, },

        ['@keyword'] = { fg = KEYWORD, },
        ['@keyword.function'] = { fg = KEYWORD, },
        ['@keyword.function.ruby'] = { fg = KEYWORD, },
        ['@keyword.operator'] = { fg = KEYWORD, },
        ['@operator'] = { fg = SYMBOL, },
        ['@keyword.exception'] = { fg = KEYWORD, },
        ['@type'] = { fg = TYPE, },
        ['@type.builtin'] = { fg = TYPE, italic = true, },
        ['@type.qualifier'] = { fg = colors.pink2, },
        ['@structure'] = { fg = colors.purple2, },
        ['@keyword.include'] = { fg = KEYWORD, },

        ['@variable'] = { fg = VARIABLE, },
        ['@variable.builtin'] = { fg = LITERAL, },

        ['@markup'] = { fg = colors.orange2, },
        ['@markup.strong'] = { fg = colors.orange2, bold = true, },     -- bold
        ['@markup.emphasis'] = { fg = colors.yellow2, italic = true, }, -- italic
        ['@markup.underline'] = { fg = colors.orange2, },
        ['@markup.heading'] = { fg = colors.pink2, bold = true, },      -- title
        ['@markup.raw'] = { fg = colors.yellow2, },                     -- inline code
        ['@markup.link.url'] = { fg = colors.yellow2, italic = true, }, -- urls
        ['@markup.link'] = { fg = colors.orange2, bold = true, },

        ['@tag'] = { fg = colors.blue2, },
        ['@tag.attribute'] = { fg = colors.green2, },
        ['@tag.delimiter'] = { fg = colors.blue2, },

        -- Semantic
        ['@class'] = { fg = TYPE, },
        ['@struct'] = { fg = TYPE },
        ['@enum'] = { fg = TYPE },
        ['@enumMember'] = { fg = PROPERTY, },
        ['@event'] = { fg = colors.blue2 },
        ['@interface'] = { fg = TYPE },
        ['@modifier'] = { fg = colors.blue2 },
        ['@regexp'] = { fg = STRING },
        ['@typeParameter'] = { fg = TYPE },
        ['@decorator'] = { fg = colors.blue2 },

        -- LSP Semantic (0.9+)
        ['@lsp.type.class'] = { fg = TYPE, },
        ['@lsp.type.enum'] = { fg = TYPE, },
        ['@lsp.type.decorator'] = { fg = colors.green2 },
        ['@lsp.type.enumMember'] = { fg = PROPERTY, },
        ['@lsp.type.function'] = { fg = VARIABLE, },
        ['@lsp.type.interface'] = { fg = TYPE },
        ['@lsp.type.macro'] = { fg = colors.blue2 },
        ['@lsp.type.method'] = { fg = METHOD, },
        ['@lsp.type.namespace'] = { fg = TYPE, },
        ['@lsp.type.parameter'] = { fg = VARIABLE, },
        ['@lsp.type.property'] = { fg = PROPERTY, },
        ['@lsp.type.struct'] = { fg = TYPE },
        ['@lsp.type.type'] = { fg = TYPE },
        ['@lsp.type.variable'] = { fg = VARIABLE, },

        -- HTML
        htmlArg = { fg = colors.green2, },
        htmlBold = { fg = colors.yellow2, bold = true, },
        htmlEndTag = { fg = colors.blue2, },
        htmlH1 = { fg = colors.pink2, },
        htmlH2 = { fg = colors.pink2, },
        htmlH3 = { fg = colors.pink2, },
        htmlH4 = { fg = colors.pink2, },
        htmlH5 = { fg = colors.pink2, },
        htmlH6 = { fg = colors.pink2, },
        htmlItalic = { fg = colors.purple2, italic = true, },
        htmlLink = { fg = colors.purple2, underline = true, },
        htmlSpecialChar = { fg = colors.yellow2, },
        htmlSpecialTagName = { fg = colors.blue2, },
        htmlTag = { fg = colors.blue2, },
        htmlTagN = { fg = colors.blue2, },
        htmlTagName = { fg = colors.blue2, },
        htmlTitle = { fg = colors.foreground2, },

        -- Markdown
        markdownBlockquote = { fg = colors.yellow2, italic = true, },
        markdownBold = { fg = colors.orange2, bold = true, },
        markdownCode = { fg = colors.green2, },
        markdownCodeBlock = { fg = colors.orange2, },
        markdownCodeDelimiter = { fg = colors.red2, },
        markdownH2 = { link = "rainbow2" },
        markdownH1 = { link = "rainbow1" },
        markdownH3 = { link = "rainbow3" },
        markdownH4 = { link = "rainbow4" },
        markdownH5 = { link = "rainbow5" },
        markdownH6 = { link = "rainbow6" },
        markdownHeadingDelimiter = { fg = colors.red2, },
        markdownHeadingRule = { fg = colors.foreground2, },
        markdownId = { fg = colors.purple2, },
        markdownIdDeclaration = { fg = colors.blue2, },
        markdownIdDelimiter = { fg = colors.purple2, },
        markdownItalic = { fg = colors.yellow2, italic = true, },
        markdownLinkDelimiter = { fg = colors.purple2, },
        markdownLinkText = { fg = colors.pink2, },
        markdownListMarker = { fg = colors.blue2, },
        markdownOrderedListMarker = { fg = colors.red2, },
        markdownRule = { fg = colors.foreground2, },
        ['@markup.heading.1.markdown'] = { link = 'rainbowcol1' },
        ['@markup.heading.2.markdown'] = { link = 'rainbowcol2' },
        ['@markup.heading.3.markdown'] = { link = 'rainbowcol3' },
        ['@markup.heading.4.markdown'] = { link = 'rainbowcol4' },
        ['@markup.heading.5.markdown'] = { link = 'rainbowcol5' },
        ['@markup.heading.6.markdown'] = { link = 'rainbowcol6' },

        --  Diff
        diffAdded = { fg = colors.green2, },
        diffRemoved = { fg = colors.red2, },
        diffFileId = { fg = colors.yellow2, bold = true, reverse = true, },
        diffFile = { fg = colors.foreground2, },
        diffNewFile = { fg = colors.green2, },
        diffOldFile = { fg = colors.red2, },

        debugPc = { bg = colors.surface1, },
        debugBreakpoint = { fg = colors.red2, reverse = true, },

        -- Diagnostics
        DiagnosticError = { fg = colors.red5, bg = colors.red1 },
        DiagnosticWarn = { fg = colors.yellow5, bg = colors.yellow1 },
        DiagnosticInfo = { fg = colors.blue5, bg = colors.blue1 },
        DiagnosticHint = { fg = colors.blue5, bg = colors.blue1 },
        DiagnosticUnderlineError = { undercurl = true, sp = colors.red4, },
        DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow4, },
        DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue4, },
        DiagnosticUnderlineHint = { undercurl = true, sp = colors.blue4, },
        DiagnosticSignError = { fg = colors.red5, bg = colors.red1 },
        DiagnosticSignWarn = { fg = colors.yellow5, bg = colors.yellow1 },
        DiagnosticSignInfo = { fg = colors.blue5, bg = colors.blue1 },
        DiagnosticSignHint = { fg = colors.blue5, bg = colors.blue1 },
        DiagnosticFloatingError = { fg = colors.red5, bg = colors.red1 },
        DiagnosticFloatingWarn = { fg = colors.yellow5, bg = colors.yellow1 },
        DiagnosticFloatingInfo = { fg = colors.blue5, bg = colors.blue1 },
        DiagnosticFloatingHint = { fg = colors.blue5, bg = colors.blue1 },
        DiagnosticVirtualTextError = { fg = colors.red5, bg = colors.red1 },
        DiagnosticVirtualTextWarn = { fg = colors.yellow5, bg = colors.yellow1 },
        DiagnosticVirtualTextInfo = { fg = colors.blue5, bg = colors.blue1 },
        DiagnosticVirtualTextHint = { fg = colors.blue5, bg = colors.blue1 },

        LspDiagnosticsDefaultError = { fg = colors.red5, bg = colors.red1 },
        LspDiagnosticsDefaultWarning = { fg = colors.yellow5, bg = colors.yellow1 },
        LspDiagnosticsDefaultInformation = { fg = colors.blue5, bg = colors.blue1 },
        LspDiagnosticsDefaultHint = { fg = colors.blue5, bg = colors.blue1 },
        LspDiagnosticsUnderlineError = { fg = colors.red5, bg = colors.red0, undercurl = true, },
        LspDiagnosticsUnderlineWarning = { fg = colors.yellow5, bg = colors.yellow0, undercurl = true, },
        LspDiagnosticsUnderlineInformation = { fg = colors.blue5, bg = colors.blue0, undercurl = true, },
        LspDiagnosticsUnderlineHint = { fg = colors.blue5, bg = colors.blue0, undercurl = true, },

        LspReferenceText = { fg = colors.orange2, },
        LspReferenceRead = { fg = colors.orange2, },
        LspReferenceWrite = { fg = colors.orange2, },
        LspCodeLens = { fg = colors.blue2, },
        LspInlayHint = { fg = colors.foreground2, },

        -- IndentBlankLine
        IndentBlanklineContextChar = { fg = colors.red3, nocombine = true, },

        -- Cmp
        CmpItemAbbr = { fg = colors.foreground2, bg = colors.root },
        CmpItemKind = { fg = colors.foreground2, bg = colors.root },
        CmpItemKindMethod = { link = "@function.method" },
        CmpItemKindText = { link = "@markup" },
        CmpItemKindFunction = { link = "@function" },
        CmpItemKindConstructor = { link = "@type" },
        CmpItemKindVariable = { link = "@variable" },
        CmpItemKindClass = { link = "@type" },
        CmpItemKindInterface = { link = "@type" },
        CmpItemKindModule = { link = "@module" },
        CmpItemKindProperty = { link = "@property" },
        CmpItemKindOperator = { link = "@operator" },
        CmpItemKindReference = { link = "@variable.parameter.reference" },
        CmpItemKindUnit = { link = "@variable.member" },
        CmpItemKindValue = { link = "@variable.member" },
        CmpItemKindField = { link = "@variable.member" },
        CmpItemKindEnum = { link = "@variable.member" },
        CmpItemKindKeyword = { link = "@keyword" },
        CmpItemKindSnippet = { link = "@markup" },
        CmpItemKindColor = { link = "DevIconCss" },
        CmpItemKindFile = { link = "TSURI" },
        CmpItemKindFolder = { link = "TSURI" },
        CmpItemKindEvent = { link = "@constant" },
        CmpItemKindEnumMember = { link = "@variable.member" },
        CmpItemKindConstant = { link = "@constant" },
        CmpItemKindStruct = { link = "@structure" },
        CmpItemKindTypeParameter = { link = "@variable.parameter" },
    }

    return highlight_integrations(highlights, configs)
end

return {
    setup = setup,
}
