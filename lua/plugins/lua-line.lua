-- Status line on the bootom
return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require("lualine").setup({
            options = {
                theme = "codedark"
            }
        })
    end,  
    dependencies = { 'nvim-tree/nvim-web-devicons' },
}

