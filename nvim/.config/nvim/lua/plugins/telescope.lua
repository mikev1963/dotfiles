vim.pack.add({
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-symbols.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-frecency.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-file-browser.nvim" },
  { src = "https://github.com/rachartier/tiny-code-action.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" }
})

-- Hook example for vim.pack automated builds
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'telescope-fzf-native.nvim' then
      vim.system({ 'make' }, { cwd = ev.data.path })
    end
  end
})

local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local code_action = require("tiny-code-action")

telescope.setup({
	defaults = {
		path_display = { "truncate", "filename_first" },
		mappings = {
			i = {
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
			n = {
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		frecency = {
			db_safe_mode = false,
			db_validate_threshold = 0,
			show_filter_column = false,
		},
		["ui-select"] = require("telescope.themes").get_dropdown({}),
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("frecency")

code_action.setup({
	picker = {
		"telescope",
		opts = {
			layout_strategy = "horizontal",
		},
	},
})

local function project_root()
	return vim.fs.root(0, { ".git" }) or vim.fs.root(vim.fn.getcwd(), { ".git" }) or vim.fn.getcwd()
end

vim.keymap.set("n", "<leader>sf", function()
	telescope.extensions.frecency.frecency({ cwd = project_root(), workspace = "CWD", hidden = true })
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>sF", function()
	builtin.find_files({ cwd = project_root() })
end, { desc = "Find all files" })
vim.keymap.set("n", "<leader>sg", function()
	builtin.live_grep({ cwd = project_root() })
end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>su", function()
	builtin.git_status()
end, { desc = "Search unstaged" })

vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
