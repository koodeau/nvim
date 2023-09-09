require("koodeau.set")
require("koodeau.remap")

local augroup = vim.api.nvim_create_augroup
local koodeau = augroup('koodeau', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
  require("plenary.reload").reload_module(name)
end

autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
  group = koodeau,
  pattern = "*",
  command = [[if &nu && mode() != "i" | set rnu | endif]],
})

autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
  group = koodeau,
  pattern = "*",
  command = [[if &nu | set nornu | endif]],
})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

-- Diagnostic signs
-- https://github.com/folke/trouble.nvim/issues/52
local signs = {
  Error = " ",
  Warning = " ",
  Hint = " ",
  Information = " "
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
