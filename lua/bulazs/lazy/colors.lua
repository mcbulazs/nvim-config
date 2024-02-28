local isTransparent = true

function ToggleTransparent()
    isTransparent = not isTransparent
    vim.cmd('Lazy reload ' .. vim.g.colors_name)
end

return {
    {
        'navarasu/onedark.nvim',
        name = 'onedark',
        config = function()
            require('onedark').setup {
                transparent = isTransparent,
                style = 'deep',
            }
            require('onedark').load()
            vim.cmd('colorscheme onedark')
        end
    },
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = isTransparent,
                terminal_colors = true,
                dim_inactive = false,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    --sidebar = "transparent",
                    --float = "transparent",
                },
            })
        end
    },
}
