require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  -- ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },
  ensure_installed = "all",
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.g.NERDTreeIndicatorMapCustom = {
  Modified = "✹",
  Staged = "✚",
  Untracked = "✭",
  Renamed = "➜",
  Unmerged = "═",
  Deleted = "✖",
  Dirty = "✗",
  Ignored = "☒",
  Clean = "✔︎",
  Unknown = "?"
}

vim.NERDTreeShowHidden = 1
vim.NERDTreeShowBookmarks = 0
vim.NERDTreeHighlightCursorline = 1

vim.NERDTreeMinimalUI = 1

vim.NERDTreeDirArrowExpandable = '▸'
vim.NERDTreeDirArrowCollapsible = '▾'
vim.NERDTreeGitStatusUseNerdFonts = 1
vim.NERDTreeIgnore = { 'node_modules', '.DS_Store' }

vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1
vim.g.NERDCustomDelimiters = { html = { left = '' } }

-- Align comment delimiters to the left instead of following code indentation
-- vim.g.NERDDefaultAlign = 'left'

function NERDCommenter_before()
  if vim.bo.filetype == 'html' or vim.bo.filetype == 'svelte' then
    vim.g.ft = vim.bo.filetype
    local cfts = vim.fn['context_filetype#get_filetypes']()
    if #cfts > 0 then
      local cft
      if cfts[1] == 'svelte' then
        cft = 'html'
      elseif cfts[1] == 'scss' then
        cft = 'css'
      else
        cft = cfts[1]
      end
      vim.cmd('setf ' .. cft)
    end
  end
end

function NERDCommenter_after()
  if vim.g.ft == 'html' or vim.g.ft == 'svelte' then
    vim.cmd('setf ' .. vim.g.ft)
    vim.g.ft = ''
  end
end

