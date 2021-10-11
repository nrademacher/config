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
      graphql = {prettierFmt},
      json = {prettierFmt},
      html = {prettierFmt},
      prisma = {prettierFmt},
      css = {prettierFmt},
      scss = {prettierFmt},
      svelte = {prettierFmt},
      vue = {prettierFmt},
      sh = {
        function()
          return {
            exe = "shfmt",
            stdin = true
          }
        end
      },
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
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.graphql,*.html,*.css,*.scss,*.svelte,*.prisma,*.vue,*.sh,*.c,*.lua,*.json FormatWrite
augroup END
]],
  true
)
