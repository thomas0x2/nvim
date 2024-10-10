return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "pyright", "ruff" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            -- Set up key binds
            local on_attach = function(client, bufnr)
                -- Set hover function
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })

                -- Go to definition
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })

                -- Show code actions
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })

                -- You can also set up 'Go to references' and 'Rename'
                vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
                vim.keymap.set("n", "rn", vim.lsp.buf.rename, { buffer = bufnr })
            end

            local function get_python_path(workspace)
                -- Assuming the virtual environment is in the 'env' folder at the workspace root
                local venv_path = workspace .. "/env/bin/python"
                if vim.fn.executable(venv_path) == 1 then
                    return venv_path
                else
                    return "/usr/local/bin/python" -- Fallback to system Python
                end
            end

            -- Configure Lua LSP
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Configure Pyright for Python
            lspconfig.pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                before_init = function(_, config)
                    config.settings.python.pythonPath = get_python_path(config.root_dir)
                end,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic", -- Can be "off", "basic", or "strict"
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                        },
                    },
                },
            })

            -- Configure Clangd for C/C++
            lspconfig.clangd.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Set key mapping for hover outside of `on_attach` to make it global (not recommended for multiple LSPs)
            -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        end,
    },
}
