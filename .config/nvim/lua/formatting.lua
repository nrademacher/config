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