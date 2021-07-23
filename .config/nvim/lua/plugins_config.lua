require("formatting")

require("autocomplete")

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

require("git-worktree").setup()
require("telescope").load_extension("git_worktree")

require("harpoon").setup()

require("toggleterm").setup()

require("statusline")

require("colorizer").setup()

require("lspkind").init()

require("lspsaga").init_lsp_saga()

local function setup_servers()
  require "lspinstall".setup()
  local servers = require "lspinstall".installed_servers()
  for _, server in pairs(servers) do
    require "lspconfig"[server].setup {}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require "lspconfig".cssls.setup {
  capabilities = capabilities
}
