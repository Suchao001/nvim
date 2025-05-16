-- spell-check: disable
return {
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true, -- Enable Copilot to suggest automatically
          keymap = {
            accept = "<A-a>", 
            next = "<A-n>", 
            prev = "<A-p>", 
            dismiss = "<C-]>",
          },
        },
        -- spell-check: enable
      })
    end,
  }
}
