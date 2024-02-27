vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.api.nvim_create_autocmd('filetype', {
    pattern = 'netrw',
    callback = function()
        vim.keymap.set('n', "<BS>", "-", { remap = true, buffer = true })
    end
})
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
