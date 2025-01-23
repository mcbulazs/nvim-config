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
  tag = "0.1.8",
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
        file_ignore_patterns = { "node%_modules/.*", "package%-lock.json" },
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
    vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
    vim.keymap.set("n", "gr", openReferences, { noremap = true, silent = true })
    vim.keymap.set("n", "<C-f>", builtin.live_grep)
    vim.keymap.set("v", "<C-f>", function()
      local current_register = vim.fn.getreg('"') -- Save the current register
      vim.cmd("normal! y")                     -- Yank the selected text
      local yenkedText = vim.fn.getreg(0)
      local trimmed = string.gsub(yenkedText, "^%s*(.-)%s*$", "%1")
      builtin.live_grep({
        default_text = trimmed,
      })
      vim.fn.setreg('"', current_register) -- Restore the original register
    end, { noremap = true, silent = true })
  end,
}
