vim.g.mapleader = " "
vim.g.user_emmet_leader_key = ","

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.cmd [[inoremap <silent><expr> <C-Space> compe#complete()]]
vim.cmd [[inoremap <silent><expr> <C-y>      compe#confirm('<CR>') ]]
vim.cmd [[inoremap <silent><expr> <C-e>     compe#close('<C-e>') ]]
vim.cmd [[inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 }) ]]
vim.cmd [[inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 }) ]]

local map = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

-- format code
map("n", "<leader>,", ":Neoformat<CR>")

-- sort tailwindcss classes
-- map("n", "<leader>.", ':lua require("headwind").buf_sort_tailwind_classes()<CR>')
-- use emmet
map("n", "<leader>.", ":Emmet ")

-- switch between dark/light themes
--[[ map("n", "<leader>tl", ':lua vim.o.background = "light"<CR>')
map("n", "<leader>td", ':lua vim.o.background = "dark"<CR>') ]]
-- unmap arrow keys
map("n", "<up>", "<nop>")
map("i", "<up>", "<nop>")
map("n", "<down>", "<nop>")
map("i", "<down>", "<nop>")
map("n", "<left>", "<nop>")
map("i", "<left>", "<nop>")
map("n", "<right>", "<nop>")
map("i", "<right>", "<nop>")

-- movement in insert mode
map("i", "<C-h>", "<C-o>h")
map("i", "<C-l>", "<C-o>a")
map("i", "<C-j>", "<C-o>j")
map("i", "<C-k>", "<C-o>k")
map("i", "<C-^>", "<C-o><C-^>")

-- Copy/pasting from/to system clipboard
map("n", "<leader>y", '"*y')
map("n", "<leader>p", '"*p')
map("n", "<leader>Y", '"+y')
map("n", "<leader>P", '"+p')

-- moving lines up and down
map("n", "<leader>j", ":move+<cr>")
map("n", "<leader>k", ":move-2<cr>")

-- moving props sideways
map("n", "<leader>h", ":SidewaysLeft<cr>")
map("n", "<leader>l", ":SidewaysRight<cr>")
map("n", "<c-h>", ":SidewaysJumpRight<cr>")
map("n", "<c-l>", ":SidewaysJumpLeft<cr>")

-- hopping around
map("n", "<leader>hw", ":HopWord<cr>")
map("n", "<leader>hp", ":HopPattern<cr>")
map("n", "<leader>hc", ":HopChar1<cr>")
map("n", "<leader>h2c", ":HopChar2<cr>")
map("n", "<leader>hl", ":HopLine<cr>")
map("n", "<leader>hsl", ":HopLineStart<cr>")

-- Open new line below and above current line
map("n", "<leader>o", "o<esc>")
map("n", "<leader>O", "O<esc>")

-- buffer management
map("n", "<leader>x", ":bd<CR>")
map("n", "<leader>ax", ":%bd<CR>")

-- quicker saving and quitting
map("n", "<leader>w", ":update<cr>")
map("i", "<C-q>", "<esc>:q<cr>")
map("n", "<C-q>", ":q<cr>")
map("v", "<C-q>", "<esc>")
map("n", "<leader>q", ":q<cr>")
map("n", "<leader>Q", ":qa!<cr>")

-- telescope
map("n", "<leader>bu", ':lua require"telescope.builtin".buffers()<CR>')
map("n", "<leader>lg", ':lua require"telescope.builtin".live_grep()<CR>')
map("n", "<leader>gs", ':lua require"telescope.builtin".grep_string()<CR>')
map("n", "<leader>th", ':lua require"telescope.builtin".help_tags()<CR>')
map("n", "<leader>as", ':lua require"telescope.builtin".find_files({hidden = true})<CR>')
map("n", "<leader>s", ':lua require"telescope.builtin".find_files()<CR>')

-- lir (file explorer)
map("n", "<leader>e", ":lua require'lir.float'.toggle()<CR>:set relativenumber<CR>")

-- lsp fzf
map("n", "<leader>fde", ":Definitions<CR>")
map("n", "<leader>fdc", ":Declarations<CR>")
map("n", "<leader>ftd", ":TypeDefinitions<CR>")
map("n", "<leader>fi", ":Implementations<CR>")
map("n", "<leader>fds", ":DocumentSymbols<CR>")
map("n", "<leader>fic", ":IncomingCalls<CR>")
map("n", "<leader>foc", ":OutgoingCalls<CR>")
map("n", "<leader>fca", ":CodeActions<CR>")
map("n", "<leader>frca", ":RangeCodeActions<CR>")
map("n", "<leader>fdi", ":Diagnostics<CR>")

map("n", "<leader>fadi", ":DiagnosticsAll<CR>")

-- lsp saga
map("n", "<leader>ca", ":Lspsaga code_action<CR>")
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>")
map("n", "K", ":Lspsaga hover_doc<CR>")
map("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
map("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
map("n", "gd", ":Lspsaga preview_definition<CR>")
map("n", "gh", ":Lspsaga lsp_finder<CR>")
map("n", "gs", ":Lspsaga signature_help<CR>")
map("n", "gr", ":Lspsaga rename<CR>")
map("n", "<leader>cd", ":Lspsaga show_line_diagnostics<CR>")
map("n", "<leader>cc", "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>")
map("n", "[e", ":Lspsaga diagnostic_jump_next<CR>")
map("n", "]e", ":Lspsaga diagnostic_jump_next<CR>")
map("n", "<leader>d", ":Lspsaga open_floaterm<CR>")
map("t", "<ESC>", "<C-\\><C-n>:Lspsaga close_floaterm<CR>")

-- lsp trouble
map("n", "<leader>lt", ":TroubleToggle<CR>")
map("n", "<leader>lwt", ":TroubleToggle workspace_diagnostics<CR>")
map("n", "<leader>ldt", ":TroubleToggle document_diagnostics<CR>")
map("n", "<leader>lqt", ":TroubleToggle quickfix<CR>")
map("n", "<leader>llt", ":TroubleToggle loclist<CR>")
map("n", "gR", ":TroubleToggle lsp_references<CR>")

--git signs
map("n", "<leader>ts", ":Gitsigns toggle_current_line_blame<CR>")
map("n", "<leader>tb", ":Gitsigns toggle_signs<CR>")
map("n", "<leader>tn", ":Gitsigns toggle_numhl<CR>")
map("n", "<leader>tl", ":Gitsigns toggle_linehl<CR>")
map("n", "<leader>tw", ":Gitsigns toggle_word_diff<CR>")

-- git messenger
map("n", "<leader>tm", ":GitMessenger<CR>")

-- harpoon
map("n", "m1", ':lua require("harpoon.ui").nav_file(1)<CR>')
map("n", "m2", ':lua require("harpoon.ui").nav_file(2)<CR>')
map("n", "m3", ':lua require("harpoon.ui").nav_file(3)<CR>')
map("n", "m4", ':lua require("harpoon.ui").nav_file(4)<CR>')
map("n", "m5", ':lua require("harpoon.ui").nav_file(5)<CR>')
map("n", "m6", ':lua require("harpoon.ui").nav_file(6)<CR>')
map("n", "m7", ':lua require("harpoon.ui").nav_file(7)<CR>')
map("n", "m8", ':lua require("harpoon.ui").nav_file(8)<CR>')
map("n", "m9", ':lua require("harpoon.ui").nav_file(9)<CR>')
map("n", "m0", ':lua require("harpoon.ui").nav_file(0)<CR>')
map("n", "mt", ':lua require("harpoon.term").gotoTerminal(1)<CR>')
map("n", "<leader>mm", ':lua require("harpoon.mark").add_file()<CR>')
map("n", "<leader>mc", ':lua require("harpoon.mark").clear_all()<CR>')
map("n", "<leader>m1", ':lua require("harpoon.mark").set_current_at(1)<CR>')
map("n", "<leader>m2", ':lua require("harpoon.mark").set_current_at(2)<CR>')
map("n", "<leader>m3", ':lua require("harpoon.mark").set_current_at(3)<CR>')
map("n", "<leader>m4", ':lua require("harpoon.mark").set_current_at(4)<CR>')
map("n", "<leader>m5", ':lua require("harpoon.mark").set_current_at(5)<CR>')
map("n", "<leader>m6", ':lua require("harpoon.mark").set_current_at(6)<CR>')
map("n", "<leader>m7", ':lua require("harpoon.mark").set_current_at(7)<CR>')
map("n", "<leader>m8", ':lua require("harpoon.mark").set_current_at(8)<CR>')
map("n", "<leader>m9", ':lua require("harpoon.mark").set_current_at(9)<CR>')
map("n", "<leader>mv", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
map("n", "<leader>mr1", ':lua require("harpoon.mark").rm_file(1)<CR>')
map("n", "<leader>mr2", ':lua require("harpoon.mark").rm_file(2)<CR>')
map("n", "<leader>mr3", ':lua require("harpoon.mark").rm_file(3)<CR>')
map("n", "<leader>mr4", ':lua require("harpoon.mark").rm_file(4)<CR>')
map("n", "<leader>mr5", ':lua require("harpoon.mark").rm_file(5)<CR>')
map("n", "<leader>mr6", ':lua require("harpoon.mark").rm_file(6)<CR>')
map("n", "<leader>mr7", ':lua require("harpoon.mark").rm_file(7)<CR>')
map("n", "<leader>mr8", ':lua require("harpoon.mark").rm_file(8)<CR>')
map("n", "<leader>mr9", ':lua require("harpoon.mark").rm_file(9)<CR>')
