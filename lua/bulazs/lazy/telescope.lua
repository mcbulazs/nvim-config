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
    },
    config = function()
        require("telescope").setup({
            defaults = {
                path_display = { "truncate" },
            },
        })

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>g", builtin.find_files, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "gr", openReferences, { noremap = true, silent = true })
        vim.keymap.set("n", "<C-f>", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end,
}
