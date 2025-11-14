---@param highlights HighlightGroups
---@param highlightsToApply HighlightGroups
---@return HighlightGroups
local function combine(highlights, highlightsToApply)
    local combinedHighlights = {}

    for group, setting in pairs(highlights) do
        combinedHighlights[group] = setting
    end

    for group, setting in pairs(highlightsToApply) do
        combinedHighlights[group] = setting
    end

    return combinedHighlights
end

return {
    combine = combine,
}
