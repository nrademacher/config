require("lsp-config")

require("statusline")

require("file-explorer")

require("autocomplete")

require("formatter-config")

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
  }
}

require("lspkind").init()

require("lspsaga").init_lsp_saga()

require("hop").setup()

require("harpoon").setup()

require("colorizer").setup()
