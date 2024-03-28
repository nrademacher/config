require("lsp-config")

require("gitsigns").setup()

require("lualine").setup {
    options = {
        component_separators = "",
        section_separators = ""
    }
}

require("file-explorer")

require("autocomplete")

-- treesitter
local configs = require("nvim-treesitter.configs")
configs.setup {
    highlight = {
        enable = true
    },
    autotag = {
        enable = true
    },
    ensure_installed = {}
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
            require("telescope.themes").get_dropdown {}
        }
    }
}
telescope.load_extension("fzf")
telescope.load_extension("frecency")

require("harpoon").setup()
require("hop").setup()
require("colorizer").setup()
