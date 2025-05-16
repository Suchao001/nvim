return {
    {
        "akinsho/bufferline.nvim",
        event = "BufWinEnter",
        config = function()
            require("bufferline").setup {

            }
        end,
    },
}