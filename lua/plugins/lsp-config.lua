-- LSP Configuration
-- Shift + k, to get LSP documentation for whatever we're hovering
-- g + d, for definition
-- Space + c + a for code actions
return {
  -- Mason for installing LSP's
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason-LSPconfig to configure LSP's
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- Make sure the necessary lsp's are installed
        ensure_installed = { "lua_ls", "clangd", "pyright", "jdtls", "ltex", "ts_ls", "html" },
      })
    end,
  },
  -- Nvim LSP config to connect LSP's to Neovim
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      -- Setup the necessary Lsp's
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities,
      })
      lspconfig.ltex.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- Disable LTeX for HTML files
          local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
          if filetype == "html" then
            client.stop()
          end
        end,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
