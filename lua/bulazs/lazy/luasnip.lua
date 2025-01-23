return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  build = "make install_jsregexp",
  opts = { history = true, updateevents = "TextChanged,TextChangedI" },
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })
      print(vim.fn.stdpath("log"))
    end,
  },
}
