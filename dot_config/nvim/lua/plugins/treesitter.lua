return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "typescript", "tsx", "astro", "hyprlang" })
      end
      opts.autotag = {
        enable = true,
      }
    end,
  },
  { "windwp/nvim-ts-autotag" },
  { "nvim-treesitter/nvim-treesitter-context", opts = { enable = false } },
}
