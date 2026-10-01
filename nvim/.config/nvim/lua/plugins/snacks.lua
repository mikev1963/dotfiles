vim.pack.add({ 
  "https://github.com/folke/snacks.nvim",
})

local snacks = require("snacks")

snacks.setup({
   picker = {
     sources = {
       projects = {
         dev = {
           "~/Docluments",
         },
       },
     },
   },
   notifier = {
     top_down = false,
     margin = { bottom = 2 },
     style = "minimal",
   },
   terminal = {
     win = { height = 0.25 },
     shell = shell,
   },
   dashboard = {
     enabled = true,
     preset = {
       pick = "telescope.nvim",
       header = require("config.herta").normal,
       keys = {
         { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
         { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
         { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
         {
           icon = " ",
           mode = "n",
           key = "B",
           desc = "File Browser",
           action = function()
             require("telescope").extensions.file_browser.file_browser()
           end,
         },
         { icon = " ", key = "s", desc = "Restore Session", section = "session" },
         {
           icon = " ",
           icon_hl = "Title",
           desc = "Home Directory",
           key = "`",
           keymap = "<M-`>",
           --action = ":lua Snacks.picker.files({ cwd = vim.env.HOME })"
           action = ":lua Snacks.explorer({ cwd = '~/Documents/Code' })"
         },
         {
           icon = " ",
           icon_hl = "Title",
           desc = "Terminal",
           key = "`",
           keymap = "<A-`>",
           action = ":lua Snacks.terminal()",
         },
         {
           icon = " ",
           key = "c",
           desc = "Config",
           action = function()
             require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
                                        end,
           },
           { icon = " ", key = "q", desc = "Quit", action = ":qa" },
           },
         },
         sections = {
           { section = "header" },
           {
             pane = 2,
             { section = "keys", gap = 1, padding = 1 },
           },
         },
        },
        styles = {
          notifier = {
            backdrop = false,
          },
        },
})
