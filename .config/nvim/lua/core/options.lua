local opt = vim.opt

-- Session Management
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- backups
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/tmp/undo/")
opt.backupdir = vim.fn.expand("~/.vim/tmp/backup/")
opt.backup = true
opt.swapfile = false

-- Skip the splash screen
opt.shortmess:append({ I = true })

--Line Numbers
-- opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 4

-- allow block selecting beyond eol
opt.virtualedit = "block"

-- Search Settings
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true
-- opt.hlsearch = false

-- Cursor Line
-- opt.cursorline = true


-- bash style tab completion for finding files
opt.wildmenu = true
opt.wildmode = "list:longest"
opt.wildignore:append("__pycache__")

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.list = true
opt.listchars = { tab = "▸ ", trail = "·" }

-- always show tab bar
opt.showtabline = 2


opt.synmaxcol = 200 -- default is 3000

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
-- opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
-- opt.iskeyword:append("-")

-- Disable the mouse while in nvim
opt.mouse = ""

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

-- i prefer full screen help
vim.cmd("cabbrev help tab help")

-- autoformat on save
vim.api.nvim_create_autocmd({ "BufWritePre", }, {
    pattern = { "*.py", "*.rs", "*.[jt]sx?", "*.lua" },
    callback = function(ev)
        vim.lsp.buf.format({ async = false })
    end
})


-- https://stackoverflow.com/questions/15429236/how-to-check-if-a-module-exists-in-lua
function isModuleAvailable(name)
    if package.loaded[name] then
        return true
    else
        for _, searcher in ipairs(package.searchers or package.loaders) do
            local loader = searcher(name)
            if type(loader) == 'function' then
                package.preload[name] = loader
                return true
            end
        end
        return false
    end
end

if isModuleAvailable("core.local_options") then require("core.local_options") end
