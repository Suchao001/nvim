return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<leader>fE",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
    },
    window = {
      mappings = {
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path)
            vim.fn.setreg('"', path)
            vim.notify("Copied: " .. path)
          end,
          desc = "Copy absolute path",
        },
        ["gy"] = {
          function(state)
            local node = state.tree:get_node()
            local path = vim.fn.fnamemodify(node:get_id(), ":.")
            vim.fn.setreg("+", path)
            vim.fn.setreg('"', path)
            vim.notify("Copied: " .. path)
          end,
          desc = "Copy relative path",
        },
        ["gn"] = {
          function(state)
            local node = state.tree:get_node()
            local name = node.name
            vim.fn.setreg("+", name)
            vim.fn.setreg('"', name)
            vim.notify("Copied: " .. name)
          end,
          desc = "Copy filename",
        },
      },
    },
  },
}
