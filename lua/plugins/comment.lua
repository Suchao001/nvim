return{
  {
  "JoosepAlviste/nvim-ts-context-commentstring",
  event = "VeryLazy",
},
  {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  opts = {
    pre_hook = function(ctx)
      return require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()(ctx)
    end,
  },
  lazy = false,
}
}