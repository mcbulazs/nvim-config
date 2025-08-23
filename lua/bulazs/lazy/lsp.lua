return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "j-hui/fidget.nvim",
  },

  config = function()
    --local cmp_lsp = require("cmp_nvim_lsp")
    -- local capabilities = vim.tbl_deep_extend(
    --   "force",
    --   {},
    --   vim.lsp.protocol.make_client_capabilities(),
    --   cmp_lsp.default_capabilities()
    -- )

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    require("fidget").setup()
    --Biome
    require("lspconfig").biome.setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "gopls",
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim", "it", "describe", "before_each", "after_each" },
                },
              },
            },
          })
        end,
      },
    })
    vim.diagnostic.config({
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        --if vim.bo.filetype ~= "markdown" then
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        --end
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({
            async = false,
            filter = function(client)
              --DONT USE FOR FORMATTING
              return client.name ~= "jsonls"
            end,
          })
          vim.cmd("write")
          print("Formatted and Saved")
        end, opts)
      end,
    })
  end,
}
