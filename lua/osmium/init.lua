---@class Integrations
---@field blink_cmp? boolean
---@field gitsigns? boolean
---@field telescope? boolean

---@class OsmiumConfig
---@field italic_comment? boolean
---@field transparent_bg? boolean
---@field show_end_of_buffer? boolean
---@field colors? Palette
---@field theme? string?
---@field integrations? Integrations
---@field overrides? HighlightGroups | fun(colors: Palette): HighlightGroups
local DEFAULT_CONFIG = {
    italic_comment = false,
    transparent_bg = false,
    show_end_of_buffer = false,
    colors = require("osmium.palette"),
    overrides = {},
    integrations = {},
    theme = 'osmium'
}

local TRANSPARENTS = {
    "Normal",
    "SignColumn",
    "NvimTreeNormal",
    "NvimTreeVertSplit",
    "NeoTreeNormal",
    "NeoTreeNormalNC"
}

---@param colors Palette
local function apply_term_colors(colors)
    vim.g.terminal_color_0 = colors.foreground2
    vim.g.terminal_color_1 = colors.red4
    vim.g.terminal_color_2 = colors.green4
    vim.g.terminal_color_3 = colors.yellow4
    vim.g.terminal_color_4 = colors.purple4
    vim.g.terminal_color_5 = colors.pink4
    vim.g.terminal_color_6 = colors.blue4
    vim.g.terminal_color_7 = colors.foreground1
    vim.g.terminal_color_8 = colors.foreground2
    vim.g.terminal_color_9 = colors.red5
    vim.g.terminal_color_10 = colors.green5
    vim.g.terminal_color_11 = colors.yellow5
    vim.g.terminal_color_12 = colors.blue5
    vim.g.terminal_color_13 = colors.pink5
    vim.g.terminal_color_14 = colors.blue5
    vim.g.terminal_color_15 = colors.foreground0
    vim.g.terminal_color_background = colors.root
    vim.g.terminal_color_foreground = colors.foreground1
end

--- override colors with colors
---@param groups HighlightGroups
---@param overrides HighlightGroups
---@return HighlightGroups
local function override_groups(groups, overrides)
    for group, setting in pairs(overrides) do
        groups[group] = setting
    end
    return groups
end

---@param configs OsmiumConfig
local function apply(configs)
    local colors = configs.colors
    apply_term_colors(
        colors --[[@as Palette]]
    )
    local groups = require("osmium.groups").setup(configs)

    -- apply transparents
    if configs.transparent_bg then
        for _, group in ipairs(TRANSPARENTS) do
            if groups[group] then
                groups[group].bg = nil
            else
                groups[group] = { bg = nil }
            end
        end
    end

    if type(configs.overrides) == "table" then
        groups = override_groups(groups, configs.overrides --[[@as HighlightGroups]])
    elseif type(configs.overrides) == "function" then
        groups = override_groups(groups, configs.overrides(
            colors --[[@as Palette]]
        ))
    end

    -- set defined highlights
    for group, setting in pairs(groups) do
        vim.api.nvim_set_hl(0, group, setting)
    end
end

---@type OsmiumConfig
local user_configs = {}

--- get osmium configs
---@return OsmiumConfig
local function get_configs()
    local configs = DEFAULT_CONFIG

    configs = vim.tbl_deep_extend("force", configs, user_configs)

    return configs
end

---setup osmium colorscheme
---@param configs OsmiumConfig?
local function setup(configs)
    if type(configs) == "table" then
        user_configs = configs --[[@as OsmiumConfig]]
    end
end

local function load()
    if vim.fn.has("nvim-0.7") ~= 1 then
        vim.notify("osmium.nvim: neovim >= 0.7 required")
        return
    end

    -- reset colors
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.g.colors_name = 'osmium'

    apply(get_configs())
end

return {
    load = load,
    setup = setup,
    configs = get_configs,
    colors = function() return get_configs().colors end,
}
