-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, desc = "Select all text" })
-- vim.keymap.set("n", "<S-h>", "<C-w>h")
-- vim.keymap.set("n", "<S-j>", "<C-w>j")
-- vim.keymap.set("n", "<S-k>", "<C-w>k")
-- vim.keymap.set("n", "<S-l>", "<C-w>l")

map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

local opts = { noremap = true, silent = true }
map({ "n", "v" }, "d", [["_d]], opts)
map({ "n", "v" }, "D", [["_D]], opts)
map({ "n", "v" }, "x", [["_x]], opts)
map({ "n", "v" }, "X", [["_X]], opts)
map({ "n", "v" }, "c", [["_c]], opts)
map({ "n", "v" }, "C", [["_C]], opts)
map("n", "dd", [["_dd]], opts)

map("n", "<leader>gl", function()
  Snacks.picker.git_log()
end, { desc = "Git Log" })

map("n", "<leader>gf", function()
  Snacks.picker.git_log_file()
end, { desc = "Git Log File" })

map("n", "<leader>gL", function()
  Snacks.picker.git_log_line()
end, { desc = "Git Log Line" })
--
local function changetoeng()
  vim.fn.jobstart({ "macism", "com.apple.keylayout.ABC" })
end

-- thai to english switch for normal mode keys
map("n", "ร", function()
  changetoeng()
  return "j"
end, { expr = true, desc = "thai ร → j" })

map("n", "า", function()
  changetoeng()
  return "k"
end, { expr = true, desc = "thai า → k" })

map("n", "่", function()
  changetoeng()
  return "h"
end, { expr = true, desc = "thai ่ → h" })

map("n", "ส", function()
  changetoeng()
  return "l"
end, { expr = true, desc = "thai ส → l" })

-- Switch to English after leaving Insert / Command mode
vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
  callback = changetoeng,
})
--
return {}
