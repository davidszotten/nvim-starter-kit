return {
    -- https://github.com/tpope/vim-fugitive
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    dependencies = {
        'tpope/vim-rhubarb',
    },
    config = function()
        -- set in local_options:
        -- vim.g.github_enterprise_urls = { 'https://example.com' }
        vim.api.nvim_create_autocmd({ "BufReadPost" }, { pattern = { "fugitive://*" }, command = "set bufhidden=delete" })
    end
}
