return {
  "AstroNvim/astrocore",
  opts = {
    mappings = {
      n = {
        -- normal mode
        ["*"]     = { "*zz", desc = "Search word under cursor forward and center" },
        ["#"]     = { "#zz", desc = "Search word under cursor backward and center" },
        ["n"]     = { "nzz", desc = "Jump to next search result and center" },
        ["N"]     = { "Nzz", desc = "Jump to previous search result and center" },
        ["<c-u>"] = { "<c-u>zz", desc = "Scroll half-page up and center cursor" },
        ["<c-d>"] = { "<c-d>zz", desc = "Scroll half-page down and center cursor" },
        ["<leader>j"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<leader>k"] = { function() require("astrocore.buffer").nav(vim.v.count1) end,  desc = "Next buffer" },
      },

      v = {
        -- visual mode
      },

      i = {
        -- insert mode
      },
    },
  },
}
