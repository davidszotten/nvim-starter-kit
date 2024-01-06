-- Navigate large json files

vim.api.nvim_create_user_command(
    'JsonPath',
    "lua print(require('jsonpath').get())",
    {})


return {
    -- https://github.com/phelipetls/jsonpath.nvim
    'phelipetls/jsonpath.nvim',
    ft = "json",
}
