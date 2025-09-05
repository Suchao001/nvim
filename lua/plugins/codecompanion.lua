-- Example integrating into your existing config structure
return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        opts = {
          show_defaults = true,
        },
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "claude-3.7-sonnet", -- Note: Unusual model for Copilot adapter
              },
            },
          })
        end,
      },
      strategies = {
        inline = {
          keymaps = {
            accept_change = {
              modes = { n = "<Leader>af>" },
              description = "Accept the suggested change",
            },
            reject_change = {
              modes = { n = "<Leader>ar>" },
              description = "Reject the suggested change",
            },
          },
        },
      },
      
    })

    -- Add your new keymaps here
    vim.keymap.set("n", "<leader>ai", "<CMD>CodeCompanion<CR>", { desc = "[A]i Inline Assistant Prompt" })
    vim.keymap.set("n", "<leader>ac", "<CMD>CodeCompanionChat<CR>", { desc = "[A]i [C]ommand" })
    vim.keymap.set("v", "<leader>ai", ":'<,'>CodeCompanion ", { desc = "[A]i Inline Assistant Prompt (Visual)" })

    -- Your existing <leader>aa keymap (if still needed for CodeCompanionAction)
    vim.keymap.set({ "n", "v", "x" }, "<leader>aa", "<CMD>CodeCompanionAction<CR>", { desc = "[A]i [A]ction" })
  end,
}
