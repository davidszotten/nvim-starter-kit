-- LSP Support
return {
    -- LSP Configuration
    -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
        -- LSP Management
        -- https://github.com/williamboman/mason.nvim
        { 'williamboman/mason.nvim' },
        -- https://github.com/williamboman/mason-lspconfig.nvim
        { 'williamboman/mason-lspconfig.nvim' },

        -- Useful status updates for LSP
        -- https://github.com/j-hui/fidget.nvim
        { 'j-hui/fidget.nvim',                opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        -- https://github.com/folke/neodev.nvim
        { 'folke/neodev.nvim' },
    },
    opts = {
        inlay_hints = { enabled = true },
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup({
            -- Update this list to the language servers you need installed
            ensure_installed = {
                "bashls", -- requires npm to be installed
                -- "cssls", -- requires npm to be installed
                -- "html", -- requires npm to be installed
                "lua_ls",
                -- "intelephense", -- requires npm to be installed
                -- "jsonls", -- requires npm to be installed
                "marksman",
                "pylsp",
                "quick_lint_js",
                "ruff_lsp",
                "rust_analyzer",
                "tsserver", -- requires npm to be installed
                -- "yamlls", -- requires npm to be installed
            }
        })

        local lspconfig = require('lspconfig')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lsp_attach = function(client, bufnr)
            -- Create your keybindings here...
        end

        -- Call setup on each LSP server
        require('mason-lspconfig').setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    on_attach = lsp_attach,
                    capabilities = lsp_capabilities,
                })
            end
        })

        -- Lua LSP settings
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                },
            },
        }

        -- Pylsp settings
        lspconfig.pylsp.setup {
            settings = {
                pylsp = {
                    plugins = {
                        black = { enabled = false },
                        autopep8 = { enabled = false },
                        yapf = { enabled = false },
                        pylint = { enabled = false },
                        mccabe = { enabled = false },
                        -- ruff = { enabled = true },
                        pyflakes = { enabled = false },
                        pycodestyle = { enabled = false },
                    }
                }
            }
        }

        -- Ruff LSP settings
        lspconfig.ruff_lsp.setup {
            on_attach = function(client, _bufnr)
                -- Disable hover in favor of Pyright
                client.server_capabilities.hoverProvider = false
            end,

        }
    end
}
