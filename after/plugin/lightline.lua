vim.g.lightline = {
  colorscheme = 'darcula',
  active = {
    left = { { 'mode', 'paste' }, { 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' } },
    right = { { 'lineinfo' }, { 'percent' }, { 'filetype' } }
  },
  inactive = {
    left = nil,
    right = { { 'lineinfo' }, { 'percent' } }
  },
  component_function = {
    readonly = 'LightlineReadonly',
    gitbranch = 'FugitiveHead',
    cocstatus = 'coc#status'
  }
}

_G.LightlineReadonly = function()
  if vim.bo.readonly and vim.bo.filetype ~= 'help' then
    return 'RO'
  else
    return ''
  end
end

-- Use an autocmd to force lightline update
vim.cmd [[
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
]]
