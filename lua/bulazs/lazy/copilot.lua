return {
    "zbirenbaum/copilot.lua",
    config = function()
        require("copilot").setup({
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {
                    accept = "<S-Tab>",
                    accept_word = "<C-l>",
                    accept_line = "<C-A-l>",
                    next = "<C-j>",
                    prev = "<C-k>",
                    dismiss = "<Esc>",
                },
            },
            panel = { enabled = false },
        })
        local suggestion = require("copilot.suggestion")
        vim.keymap.set("i", "<C-Right>", suggestion.accept_word)
        vim.keymap.set("i", "<CA-Right>", suggestion.accept_line)
        vim.keymap.set("i", "<C-Down>", suggestion.next)
        vim.keymap.set("i", "<C-Up>", suggestion.prev)
    end,
}
