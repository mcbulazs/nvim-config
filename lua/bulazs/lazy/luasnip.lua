return {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = "rafamadriz/friendly-snippets",
    build = "make install_jsregexp",
    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
    config = function()
        --  require('luasnip').filetype_extend("ts", { "angular" })
        --  require('luasnip').filetype_extend("css", { "angular" })
        --  require('luasnip').filetype_extend("html", { "angular" })
    end
}
