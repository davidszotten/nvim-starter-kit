-- Ack to invoke ripgrep
return {
    -- https://github.com/mileszs/ack.vim
    'mileszs/ack.vim',
    -- cmd =  "Ack" ,
    build = ":Ack",
    init = function()
        vim.g.ackprg =  'rg --vimgrep --no-heading --smart-case --hidden --follow --glob "!.git/*"'
    end,
}
