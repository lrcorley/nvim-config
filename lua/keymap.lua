local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { noremap = true })
end

-- Exit insert mode
map('i', 'jj', '<Esc>')

-- Window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<Leader>c', ':tabc<CR>')

-- Use system clipboard
map({'n', 'v'}, '<Leader>y', '"+y')
map({'n', 'v'}, '<Leader>p', '"+p')

-- Open config directory
map('n', '<C-,>', function()
  vim.cmd('tabe ' .. vim.fn.stdpath('config'))
end)

-- Diff current window
map('n', '<Leader>d', '<Cmd>windo diffthis<CR>')

-- Toggle list mode
map('n', '<Leader>l', function()
  vim.o.list = not vim.o.list
end)
