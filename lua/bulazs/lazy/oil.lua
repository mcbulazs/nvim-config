return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
        require("oil").setup({
            keymaps = {
                ["<BS>"] = "actions.parent",
            },
        })
    end,
}
