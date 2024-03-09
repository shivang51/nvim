local utils = {}

function utils.make_italic(groupName)
    local prev = vim.api.nvim_get_hl(0, { name = groupName })
    local options = vim.tbl_extend("force", prev, { italic = true })
    vim.api.nvim_set_hl(0, groupName, options)
end

return utils
