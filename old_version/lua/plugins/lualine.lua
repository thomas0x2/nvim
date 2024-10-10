return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require("lualine").setup({
            options = {
                theme = "codedark"
            }
        })
    end,  -- Added missing end for the config function
    dependencies = { 'nvim-tree/nvim-web-devicons' },
}
