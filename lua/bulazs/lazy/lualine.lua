return {
    "AndreM222/copilot-lualine",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lualine/lualine.nvim", "folke/trouble.nvim" },
    config = function()
        local lualine = require("lualine")

        lualine.setup({
            options = {
                theme = "onedark",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "copilot", "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = { "trouble" },
        })
    end,
}
