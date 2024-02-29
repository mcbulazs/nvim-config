return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("trouble").setup({
            icons = true,
        })
        vim.keymap.set("n", "<leader>t", function()
            require("trouble").toggle()
        end)

    end,
}
