return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim",
    },
    -- cmd = { "VenvSelect", "VenvSelectCached"},
    ft = "python",
    opts = { },
    keys = {
        { ",v", "<cmd>VenvSelect<cr>" },
    },
}

