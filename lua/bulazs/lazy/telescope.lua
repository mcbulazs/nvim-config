local function openReferences()
    require("telescope.builtin").lsp_references({
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.6,
            height = 0.5,
            prompt_position = "bottom",
        },
        sorting_strategy = "ascending",
        ignore_filename = false,
        show_line = false,
        trim_text = true,
        include_declaration = false,
        include_current_line = false,
    })
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },

    config = function()
        require("telescope").setup({
            defaults = {
                path_display = { "truncate", "smart" },
            },
            pickers = {
                live_grep = {
                    additional_args = {
                        "--fixed-strings",
                        "--ignore-case",
                    },
                },
            },
        })
        require("telescope").load_extension("fzf")
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>g", builtin.find_files, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "gr", openReferences, { noremap = true, silent = true })
        vim.keymap.set("n", "<C-f>", builtin.live_grep)
        vim.keymap.set("n", "/", function()
            builtin.current_buffer_fuzzy_find({
                layout_config = {
                    width = 0.3,
                    height = 0.4,
                    anchor = "NE",
                    prompt_position = "top",
                },
                sorting_strategy = "ascending",
                previewer = false,
                fuzzy = false,
            })
        end, {
            noremap = true,
            silent = true,
        })
        vim.keymap.set("v", "/", function()
            local current_register = vim.fn.getreg('"') -- Save the current register
            vim.cmd("normal! y")               -- Yank the selected text
            local yenkedText = vim.fn.getreg(0)
            local trimmed = string.gsub(yenkedText, "^%s*(.-)%s*$", "%1")
            builtin.current_buffer_fuzzy_find({
                layout_config = {
                    width = 0.3,
                    height = 0.4,
                    anchor = "NE",
                    prompt_position = "top",
                },
                sorting_strategy = "ascending",
                previewer = false,
                fuzzy = false,
                default_text = trimmed,
            })
            vim.fn.setreg('"', current_register) -- Restore the original register
        end, {
            noremap = true,
            silent = true,
        })
        vim.keymap.set("v", "<C-f>", function()
            local current_register = vim.fn.getreg('"') -- Save the current register
            vim.cmd("normal! y")               -- Yank the selected text
            local yenkedText = vim.fn.getreg(0)
            local trimmed = string.gsub(yenkedText, "^%s*(.-)%s*$", "%1")
            builtin.live_grep({
                default_text = trimmed,
            })
            vim.fn.setreg('"', current_register) -- Restore the original register
        end, { noremap = true, silent = true })

        -- if gitdiff doesnt work for some reason, and you are too lazy to use fugitive
        --  vim.keymap.set("n", "<C-g>", function()
        --      local repo_path = vim.fn.system("git rev-parse --show-toplevel"):gsub("\n", "")
        --      builtin.git_status({
        --          layout_strategy = "horizontal",
        --          previewer = require("telescope.previewers").new_termopen_previewer({
        --              get_command = function(entry)
        --                  return { "git", "diff", repo_path .. "/" .. entry.value }
        --              end,
        --          }),
        --      })
        --  end)
    end,
}
