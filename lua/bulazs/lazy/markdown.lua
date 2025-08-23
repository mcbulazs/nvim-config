return {
  {
    "epwalsh/obsidian.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    version = "*",
    lazy = true,
    ft = "markdown",
    config = function()
      require("obsidian").setup({
        ui = { enable = false },
        workspaces = {
          {
            name = "personal",
            path = "~/Sync/obsidian/Personal",
          },
        },
        completion = {
          nvim_cmp = true,
          min_chars = 1,
        },
        mappings = {
          ["gr"] = {
            action = function()
              vim.cmd("ObsidianBacklinks")
            end,
            opts = { noremap = true, silent = true },
          },
          ["gd"] = {
            action = function()
              return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
          },
        },
        note_id_func = function(title)
          if title ~= nil then
            return title                                                    --if title is give use the name
          else
            return tostring(os.time()) .. "_" .. string.char(math.random(65, 90)) --time_random 4 letter
          end
        end,
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = "markdown",
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    ft = "markdown",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
}
