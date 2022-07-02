require("lsp-config")

require('gitsigns').setup()

require("statusline")

require("file-explorer")

require("autocomplete")

-- treesitter
local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = "all",
  highlight = {
    enable = true
  },
  autotag = {
    enable = true
  }
}

-- telescope
local telescope = require("telescope")
local telescope_actions = require("telescope.actions")
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = telescope_actions.move_selection_previous,
        ["<C-j>"] = telescope_actions.move_selection_next
      }
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- more opts
      }
    }
  }
}
telescope.load_extension("fzf")
telescope.load_extension("frecency")

require("harpoon").setup()
require("hop").setup()
require("colorizer").setup()
require('bad_practices').setup()
