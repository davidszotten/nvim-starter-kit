local opt = vim.opt

-- Session Management
opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

 --Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 4

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true


-- bash style tab completion for finding files
opt.wildmenu = true
opt.wildmode = "list:longest"

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.list = true
opt.listchars = {tab="▸ ", trail="·"}



opt.synmaxcol=200  -- default is 3000

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

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

