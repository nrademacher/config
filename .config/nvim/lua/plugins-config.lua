require("lsp-config")

require('gitsigns').setup()

require("statusline")

require("file-explorer")

require("autocomplete")

-- treesitter
local configs = require "nvim-treesitter.configs"
configs.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  },
  autotag = {
    enable = true
  }
}

-- telescope
local telescope = require("telescope")
local telescope_actions = require "telescope.actions"
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
require("telescope").load_extension("fzf")
require("telescope").load_extension("frecency")

require("lspkind").init()

require("lspsaga").init_lsp_saga()

require("hop").setup()

require("harpoon").setup()

require("colorizer").setup()

require('bad_practices').setup()
