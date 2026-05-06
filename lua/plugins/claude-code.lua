return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("claude-code").setup({
      window = {
        position = "botright",
        split_ratio = 0.35,
        enter_insert = true,
        hide_numbers = true,
        hide_signcolumn = true,
      },
      file_refresh = {
        enable = true,
        show_notifications = true,
      },
      git = {
        use_git_root = true,
      },
      keymaps = {
        toggle = {
          normal = "<C-,>",
          terminal = "<C-,>",
        },
      },
    })
  end,
}
