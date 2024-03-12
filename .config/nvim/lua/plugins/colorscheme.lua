-- Theme/Colorscheme
-- Solarized


-- highlight other matches with underlines to not lose track of the cursor
-- TODO: somewhere better to do this?
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        -- vim.api.nvim_set_hl(0, "Search", {})
        vim.api.nvim_set_hl(0, "CurSearch", { underline = true })
        vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })
    end
})


return {
    -- https://github.com/maxmx03/solarized.nvim
    'maxmx03/solarized.nvim',
    --'altercation/vim-colors-solarized',
    -- 'lifepillar/vim-solarized8',
    lazy = false,    -- We want the colorscheme to load immediately when starting Neovim
    priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
    config = function()
        vim.o.background = 'dark'
        vim.cmd("colorscheme solarized")
    end,
}
