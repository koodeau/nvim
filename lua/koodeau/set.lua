vim.opt.guicursor = ""

vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.hidden = true

vim.opt.nu = true
vim.opt.rnu = true
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.number = true

vim.opt.cursorline = true
-- vim.opt.prompt = true

vim.opt.showmode = true

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.smarttab = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.whichwrap:append("<,>,h,l")

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.expandtab = true

vim.filetype.on = true
vim.filetype.plugin = true
vim.filetype.indent = true

vim.opt.lazyredraw = true

vim.opt.history = 999
vim.opt.undolevels = 999

vim.opt.sidescrolloff = 7
vim.opt.sidescroll = 1

vim.opt.backspace = "indent,eol,start"

vim.opt.iskeyword:append("-")

vim.NERDTreeIndicatorMapCustom = {
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

vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "═",
    renamed = "➜",
    untracked = "✭",
    deleted = "✖",
    ignored = "☒"
  },
  folder = {
    arrow_open = "▾",
    arrow_closed = "▸",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
  lsp = {
    hint = "",
    info = "",
    warning = "",
    error = "",
  }
}


vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.emph_types = 0
vim.g.emph_funcs = 1
vim.g.emph_idents = 0
vim.g.match_paren_style = 1
vim.g.dim_punctuation = 1

vim.clipboard = "unnamedplus"
vim.title = true
