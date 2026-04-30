return {
	"ThePrimeagen/99",
	config = function()
		local _99 = require("99")
    local cwd = vim.uv.cwd()
    local basename = vim.fs.basename(cwd)

		_99.setup({
      provider = _99.Providers.ClaudeCodeProvider,
			logger = {
				level = _99.DEBUG,
				path = "/tmp/" .. basename .. ".99.debug",
				print_on_error = true,
			},
      tmp_dir = "/tmp/claude",

      --- Completions: #rules and @files in the prompt buffer
      completion = {
        -- I am going to disable these until i understand the
        -- problem better.  Inside of cursor rules there is also
        -- application rules, which means i need to apply these
        -- differently
        -- cursor_rules = "<custom path to cursor rules>"

        --- A list of folders where you have your own SKILL.md
        custom_rules = {
          "~/Documents/perso/skills/",
        },

        --- Configure @file completion (all fields optional, sensible defaults)
        files = {
          -- enabled = true,
          -- max_file_size = 102400,     -- bytes, skip files larger than this
          -- max_files = 5000,            -- cap on total discovered files
          -- exclude = { ".env", ".env.*", "node_modules", ".git", ... },
        },
        --- File Discovery:
        --- - In git repos: Uses `git ls-files` which automatically respects .gitignore
        --- - Non-git repos: Falls back to filesystem scanning with manual excludes
        --- - Both methods apply the configured `exclude` list on top of gitignore

        --- What autocomplete engine to use. Defaults to native (built-in) if not specified.
        source = "native", -- "native" (default), "cmp", or "blink"
      },

      --- WARNING: if you change cwd then this is likely broken
      --- ill likely fix this in a later change
      ---
      --- md_files is a list of files to look for and auto add based on the location
      --- of the originating request.  That means if you are at /foo/bar/baz.lua
      --- the system will automagically look for:
      --- /foo/bar/AGENT.md
      --- /foo/AGENT.md
      --- assuming that /foo is project root (based on cwd)
			md_files = {
				"AGENT.md",
			},
		})

		vim.keymap.set("v", "<leader>9v", function()
			_99.visual()
		end)

    --- if you have a request you dont want to make any changes, just cancel it
		vim.keymap.set("n", "<leader>9x", function()
			_99.stop_all_requests()
		end)

		vim.keymap.set("n", "<leader>9s", function()
			_99.search()
		end)
	end,
}
