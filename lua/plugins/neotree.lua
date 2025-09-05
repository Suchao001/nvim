return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },

  -- 🔧 ตรงนี้ override keymap
  keys = {
    -- ปิด keymap เดิมที่ LazyVim ผูกไว้
    { "<leader>e", false },

    -- เพิ่ม keymap ใหม่ให้ Neo-tree ทำงาน
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
  },
}
