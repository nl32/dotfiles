return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      {
        "<leader>fw",
        function()
          require("telescope.builtin").keymaps()
        end,
        desc = "Find Keymaps",
      },
    },
  },
}
