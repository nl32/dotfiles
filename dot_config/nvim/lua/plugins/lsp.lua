return {
  { "marilari88/twoslash-queries.nvim" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
      },
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- disable tsserver because I use typescript-tools
        tsserver = function(_, opts)
          return true
        end,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "typescript-language-server",
        "json-lsp",
        "prisma-language-server",
        "eslint-lsp",
        "prettier",
      },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      on_attach = function(client, bufnr)
        require("twoslash-queries").attach(client, bufnr)
      end,
    },
    event = "LazyFile",
  },
}
