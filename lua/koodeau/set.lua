vim.opt.guicursor = ""

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.hidden = true

vim.opt.nu = true
vim.opt.rnu = true
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")

vim.opt.cursorline = true
vim.opt.prompt = true

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
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "80"

vim.filetype.on = true
vim.filetype.plugin = true
vim.filetype.indent = true

vim.opt.history = 999
vim.opt.undolevels = 999

vim.opt.sidescrolloff = 7
vim.opt.sidescroll = 1

vim.opt.backspace = "indent,eol,start"

vim.opt.iskeyword:append("-")

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

vim.g.ale_lint_delay = 0
vim.g.ale_lint_on_text_changed = "never"

vim.g.ale_linters = {
  javascript = { "eslint" },
  typescript = { "eslint" },
  html = { "tidy" },
  css = { "stylelint" },
  svelte = { "eslint" },
  scss = { "stylelint" },
  sass = { "stylelint" },
  less = { "stylelint" },
  postcss = { "stylelint" },
  json = { "jsonlint" },
  yaml = { "yamllint" },
  markdown = { "markdownlint" },
  python = { "flake8" },
  lua = { "luacheck" },
  go = { "golint" },
  rust = { "rustc" },
  php = { "phpcs" },
  ruby = { "rubocop" },
  sh = { "shellcheck" },
  swift = { "swiftlint" },
}

vim.g.ale_fixers = {
  javascript = { "eslint" },
  typescript = { "eslint" },
  html = { "tidy" },
  css = { "stylelint" },
  scss = { "stylelint" },
  sass = { "stylelint" },
  less = { "stylelint" },
  postcss = { "stylelint" },
  svelte = { "eslint" },
  json = { "prettier" },
  yaml = { "prettier" },
  markdown = { "prettier" },
  lua = { "luafmt" },
  go = { "gofmt" },
  rust = { "rustfmt" },
  ruby = { "rubocop" },
  sh = { "shfmt" },
  swift = { "swiftformat" },
}

vim.laststatus = 2

vim.g.ale_completion_enabled = 0
vim.g.ale_completion_autoimport = 0

vim.g.noshowmode = false

vim.clipboard = "unnamedplus"
vim.opt.title = true
vim.opt.lazyredraw = false
