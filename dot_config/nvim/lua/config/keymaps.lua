-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Session keymaps (persistence.nvim)
vim.keymap.set('n', '<leader>ss', function() require('persistence').save() vim.notify('Session saved') end, { desc = 'Save session' })
vim.keymap.set('n', '<leader>sl', function()
  local sessions = require('persistence').list()
  vim.ui.select(sessions, { prompt = 'Select session:' }, function(choice)
    if choice then require('persistence').load({ session = choice }) end
  end)
end, { desc = 'List sessions' })
