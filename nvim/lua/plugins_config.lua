-- Auto format config
local prettierFmt = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
    stdin = true
  }
end
require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = {prettierFmt},
      javascriptreact = {prettierFmt},
      typescript = {prettierFmt},
      typescriptreact = {prettierFmt},
      json = {prettierFmt},
      css = {prettierFmt},
      scss = {prettierFmt},
      c = {
        function()
          return {
            exe = "clang-format",
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.c,*.lua,*.json FormatWrite
augroup END
]],
  true
)

-- vsnip config
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local check_back_space = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end
-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

local configs = require "nvim-treesitter.configs"
configs.setup {
  ensure_installed = "maintained",
  highlight = {
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

require "compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    calc = true,
    vsnip = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = false,
    tags = true,
    snippets_nvim = true,
    treesitter = true
  }
}

require "nvim-autopairs".setup()
local remap = vim.api.nvim_set_keymap
local npairs = require("nvim-autopairs")

-- skip it, if you use another global object
_G.MUtils = {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()["selected"] ~= -1 then
      vim.fn["compe#confirm"]()
      return npairs.esc("<c-y>")
    else
      vim.defer_fn(
        function()
          vim.fn["compe#confirm"]("<cr>")
        end,
        20
      )
      return npairs.esc("<c-n>")
    end
  else
    return npairs.check_break_line_char()
  end
end

remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", {expr = true, noremap = true})

require "colorizer".setup()

require("lualine").setup {
  options = {theme = "gruvbox"}
}

require "lspkind".init()

require "lspsaga".init_lsp_saga()

local lspconfig = require "lspconfig"
require "lspinstall".setup()
local servers = require "lspinstall".installed_servers()
for _, server in pairs(servers) do
  lspconfig[server].setup {}
end
