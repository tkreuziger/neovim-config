local function shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

local winopts = require('config.defaults').diagnostics_options.float
local custom_float = shallowcopy(winopts)
custom_float['preview_split'] = 'right'

return {
    {
        'stevearc/oil.nvim',
        -- cmd = 'Oil', -- needed for downloading spell files
        opts = {
            view_options = {
                show_hidden = true,
            },
            float = custom_float,
            preview = winopts,
            progress = winopts,
            sseh = winopts,
            keymaps_help = winopts,
        },
    },
}
