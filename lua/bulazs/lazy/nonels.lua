return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                --https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
                --lua
                null_ls.builtins.formatting.stylua,
                --go
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.goimports_reviser,
                null_ls.builtins.diagnostics.golangci_lint,
                --sql
                null_ls.builtins.diagnostics.sqlfluff.with({
                    extra_args = { "--dialect", "postgres" }, -- change to your dialect
                }),
                null_ls.builtins.formatting.sqlfmt,
                --python
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.pylint,
                --biome
                null_ls.builtins.formatting.biome,
            },
        })
    end,
}
