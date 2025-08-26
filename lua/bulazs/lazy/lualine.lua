return {
  "AndreM222/copilot-lualine",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    "folke/trouble.nvim",
    "stevearc/oil.nvim",
  },
  config = function()
    local lualine = require("lualine")
    local function getOilPath()
      return require("oil").get_current_dir()
    end

    lualine.setup({
      options = {
        theme = "onedark",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          {
            getOilPath,
            cond = function()
              return require("oil").get_current_dir() ~= nil
            end,
          },
          {
            "filename",
            cond = function()
              return require("oil").get_current_dir() == nil
            end,
          },
        },
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
