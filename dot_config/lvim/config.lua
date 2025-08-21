-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.g.python3_host_prog = '/users/valz/.config/lvim/.venv/bin/python'
vim.o.timeoutlen = 150
vim.o.relativenumber = true

lvim.colorscheme = "lunar"

lvim.keys.normal_mode["*"] = "*zz"
lvim.keys.normal_mode["#"] = "#zz"
lvim.keys.normal_mode["n"] = "nzz"
lvim.keys.normal_mode["n"] = "nzz"
lvim.keys.normal_mode["<c-u>"] = "<c-u>zz"
lvim.keys.normal_mode["<c-d>"] = "<c-d>zz"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- install plugins
lvim.plugins = {
--)   "ChristianChiarulli/swenv.nvim",
--)   "stevearc/dressing.nvim",
--)   "mfussenegger/nvim-dap-python",
--)   {
--)     "nvim-neotest/neotest",
--)     dependencies = {
--)       "nvim-neotest/nvim-nio",
--)       "nvim-lua/plenary.nvim",
--)       "antoinemadec/FixCursorHold.nvim",
--)       "nvim-treesitter/nvim-treesitter",
--)       "microsoft/debugpy",
--)     }
--)   },
--)   "nvim-neotest/neotest-python",
--)   {
--)     "Exafunction/codeium.vim",
--)     config = function()
--)       -- Change '<C-g>' here to any keycode you like.
--)       vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
--)       vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
--)         { expr = true, silent = true })
--)       vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
--)         { expr = true, silent = true })
--)       vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
--)     end
--)   },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
      require("venv-selector").setup()
    end,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
  },
}
--) 
--) -- automatically install python syntax highlighting
--) lvim.builtin.treesitter.ensure_installed = {
--)   "python",
--) }
--) 
--) -- setup formatting
--) local formatters = require "lvim.lsp.null-ls.formatters"
--) formatters.setup { { name = "ruff" }, }
--) lvim.format_on_save.enabled = true
--) -- lvim.format_on_save.pattern = { "*.py" }
--) 
--) -- setup linting
--) -- local linters = require "lvim.lsp.null-ls.linters"
--) -- linters.setup { { command = "flake8", filetypes = { "python" } } }
--) 
--) -- setup debug adapter
--) lvim.builtin.dap.active = true
--) local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
--) pcall(function()
--)   require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
--) end)
--) 
--) -- setup testing
--) require("neotest").setup({
--)   adapters = {
--)     require("neotest-python")({
--)       -- Extra arguments for nvim-dap configuration
--)       -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
--)       dap = {
--)         justMyCode = false,
--)         console = "integratedTerminal",
--)       },
--)       args = { "--log-level", "DEBUG", "--quiet" },
--)       runner = "pytest",
--)     })
--)   }
--) })
--) 
--) lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
--)   "Test Method" }
--) lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
--)   "Test Method DAP" }
--) lvim.builtin.which_key.mappings["df"] = {
--)   "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
--) lvim.builtin.which_key.mappings["dF"] = {
--)   "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
--) lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }
--) 
--) 
--
-- binding for switching
lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}
