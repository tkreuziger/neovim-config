local function harpoon_select(num)
    require('harpoon'):list():select(num)
end

return {
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        config = function ()
            local harpoon = require('harpoon')
            harpoon:setup({})

            local map = function(keys, func, opts)
                vim.keymap.set('n', keys, func, opts)
            end

            map('<leader>ha', function() harpoon:list():add() end, { desc = 'Add harpoon buffer' })
            map('<leader>hh', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = 'Toggle harpoon menu' })

            map('<leader>h1', function() harpoon_select(1) end, { desc = 'Buffer 1' })
            map('<leader>h2', function() harpoon_select(2) end, { desc = 'Buffer 2' })
            map('<leader>h3', function() harpoon_select(3) end, { desc = 'Buffer 3' })
            map('<leader>h4', function() harpoon_select(4) end, { desc = 'Buffer 4' })
            map('<leader>h5', function() harpoon_select(5) end, { desc = 'Buffer 5' })
            map('<leader>h6', function() harpoon_select(6) end, { desc = 'Buffer 6' })
            map('<leader>h7', function() harpoon_select(7) end, { desc = 'Buffer 7' })
            map('<leader>h8', function() harpoon_select(8) end, { desc = 'Buffer 8' })
            map('<leader>h9', function() harpoon_select(9) end, { desc = 'Buffer 9' })

            -- basic telescope configuration
            local conf = require('telescope.config').values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                local count = 0
                for _, item in ipairs(harpoon_files.items) do
                    count = count + 1
                    table.insert(file_paths, item.value)
                end

                require('telescope.pickers').new({}, {
                    prompt_title = 'Harpoon',
                    finder = require('telescope.finders').new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            map('<leader>ht', function() toggle_telescope(harpoon:list()) end,
            { desc = 'Open harpoon window' })
        end,
    },
}

