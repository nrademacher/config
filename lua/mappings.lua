vim.g.mapleader = ' '
vim.g.user_emmet_leader_key = ','

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.cmd[[inoremap <silent><expr> <C-Space> compe#complete()]]
vim.cmd[[inoremap <silent><expr> <C-y>      compe#confirm('<CR>') ]]
vim.cmd[[inoremap <silent><expr> <C-e>     compe#close('<C-e>') ]]
vim.cmd[[inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 }) ]]
vim.cmd[[inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 }) ]]

local map = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

map('n', '<leader>.', ':PrettierAsync<CR>')

-- unmap arrow keys
map('n', '<up>', '<nop>')
map('i', '<up>', '<nop>')
map('n', '<down>', '<nop>')
map('i', '<down>', '<nop>')
map('n', '<left>', '<nop>')
map('i', '<left>', '<nop>')
map('n', '<right>', '<nop>')
map('i', '<right>', '<nop>')

-- movement in insert mode
map('i', '<C-h>', '<C-o>h')
map('i', '<C-l>', '<C-o>a')
map('i', '<C-j>', '<C-o>j')
map('i', '<C-k>', '<C-o>k')
map('i', '<C-^>', '<C-o><C-^>')

-- telescope
map('n', '<leader>s', ':lua require"telescope.builtin".find_files()<CR>')
map('n', '<leader>hs', ':lua require"telescope.builtin".find_files({hidden = true})<CR>')
map('n', '<leader>f', ':lua require"telescope.builtin".live_grep()<CR>')
map('n', '<leader>b', ':lua require"telescope.builtin".buffers()<CR>')
map('n', '<leader>g', ':lua require"telescope".extensions.git_worktree.git_worktrees()<CR>')
map('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
map('n', '<leader>fw', ':lua require"telescope.builtin".help_tags()<CR>')

-- nvimtree
map('n', '<C-n>', ':NvimTreeToggle<CR>')
map('n', '<leader>r', ':NvimTreeRefresh<CR>')
map('n', '<leader>n', ':NvimTreeFindFile<CR>')

-- git worktrees
map('n', '<leader>gw', ':lua require("git-worktree").create_worktree("')
map('n', '<leader>gwc', ':lua require("git-worktree").create_worktree("develop", "master")<CR>')
map('n', '<leader>gws', ':lua require("git-worktree").switch_worktree("develop")<CR>')
map('n', '<leader>gwd', ':lua require("git-worktree").delete_worktree("develop")<CR>')

-- harpoon
map('n', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>')
map('n', '<leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>')
map('n', '<leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>')
map('n', '<leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>')
map('n', '<leader>5', ':lua require("harpoon.term").gotoTerminal(1)<CR>')
map('t', '<leader>5', '<C-\\><C-n>')
map('n', '<leader>mm', ':lua require("harpoon.mark").add_file()<CR>')
map('n', '<leader>mc', ':lua require("harpoon.mark").clear_all()<CR>')
map('n', '<leader>m1', ':lua require("harpoon.mark").set_current_at(1)<CR>')
map('n', '<leader>m2', ':lua require("harpoon.mark").set_current_at(2)<CR>')
map('n', '<leader>m3', ':lua require("harpoon.mark").set_current_at(3)<CR>')
map('n', '<leader>m4', ':lua require("harpoon.mark").set_current_at(4)<CR>')
map('n', '<leader>mv', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
map('n', '<leader>mr1', ':lua require("harpoon.mark").rm_file(1)<CR>')
map('n', '<leader>mr2', ':lua require("harpoon.mark").rm_file(2)<CR>')
map('n', '<leader>mr3', ':lua require("harpoon.mark").rm_file(3)<CR>')
map('n', '<leader>mr4', ':lua require("harpoon.mark").rm_file(4)<CR>')

-- buffer management
map('n', 'm', ':BufferLinePick<CR>')
map('n', '<leader>x', ':bd<CR>')
map('n', '<leader>xx', ':%bd<CR>')

-- quicker saving and quitting
map('n', '<leader>w', ':update<cr>')
map('i', '<C-q>', '<esc>:q<cr>')
map('n', '<C-q>', ':q<cr>')
map('v', '<C-q>', '<esc>')
map('n', '<leader>q', ':q<cr>')
map('n', '<leader>Q', ':qa!<cr>')

-- moving lines up and down
map('n', '<leader>j', ':move+<cr>')
map('n', '<leader>k', ':move-2<cr>')

-- moving props sideways
map('n', '<leader>h', ':SidewaysLeft<cr>')
map('n', '<leader>l', ':SidewaysRight<cr>')
map('n', '<c-h>', ':SidewaysJumpRight<cr>')
map('n', '<c-l>', ':SidewaysJumpLeft<cr>')

-- hopping around
map('n', '<leader>hw', ':HopWord<cr>')
map('n', '<leader>hp', ':HopPattern<cr>')
map('n', '<leader>hc', ':HopChar1<cr>')
map('n', '<leader>h2c', ':HopChar2<cr>')
map('n', '<leader>hl', ':HopLine<cr>')

-- Open new line below and above current line
map('n', '<leader>o', 'o<esc>')
map('n', '<leader>O', 'O<esc>')

-- terminal shortcuts
map('n', '<ESC>', ':Topen<cr><c-w>wi') -- in normal mode, open term and switch to it in insert mode
map('t', '<ESC>', '<C-\\><C-n> :Ttoggle<cr>') -- from term in insert mode, exit insert mode and switch back
map('t', '<C-n>', '<C-\\><C-n>') -- for switching from the harpooned terminal

-- Copy/pasting from/to system clipboard
map('n', '<leader>y', '"*y')
map('n', '<leader>p', '"*p')
map('n', '<leader>Y', '"+y')
map('n', '<leader>P', '"+p')

