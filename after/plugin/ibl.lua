require("ibl").setup()

local highlight = {
  -- "CursorColumn",
  "Whitespace",
}
require("ibl").setup {
  -- char = '┊',
  indent = { highlight = highlight, char = "" },
  whitespace = {
    highlight = highlight,
    remove_blankline_trail = true,
  },
  scope = { enabled = false },
}
