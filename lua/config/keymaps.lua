-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

local function changeToEng()
  local os = vim.loop.os_uname().sysname
  if os:find("Windows_NT") then
    vim.fn.jobstart("E:\\im-select.exe 1033")
  elseif os == "Darwin" then
    vim.fn.jobstart("im-select com.apple.keylayout.ABC")
  end
end

-- Normal mode remaps
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Thai to English switch for normal mode keys
map("n", "ร", function()
  changeToEng()
  return "j"
end, { expr = true, desc = "Thai ร → j" })

map("n", "า", function()
  changeToEng()
  return "k"
end, { expr = true, desc = "Thai า → k" })

map("n", "่", function()
  changeToEng()
  return "h"
end, { expr = true, desc = "Thai ้ → h" })

map("n", "ส", function()
  changeToEng()
  return "l"
end, { expr = true, desc = "Thai ส → l" })

-- Insert mode remap to exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- AutoCmd to switch to English after leaving Insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    changeToEng()
  end,
})

-- AutoCmd to switch to English when leaving the command line mode
vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    changeToEng()
  end,
})

return {}
