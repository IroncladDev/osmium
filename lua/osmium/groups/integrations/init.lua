local combine = require("osmium.groups.utils").combine

---@param highlights HighlightGroups
---@param configs OsmiumConfig
local function highlight_integrations(highlights, configs)
    local combined = combine(highlights, {})

    if configs.integrations.blink_cmp then
        combined = require("osmium.groups.integrations.blink_cmp")(combined, configs.colors)
    end

    if configs.integrations.gitsigns then
        combined = require("osmium.groups.integrations.gitsigns")(combined, configs.colors)
    end

    if configs.integrations.telescope then
        combined = require("osmium.groups.integrations.telescope")(combined, configs.colors)
    end

    return combined
end

return highlight_integrations
