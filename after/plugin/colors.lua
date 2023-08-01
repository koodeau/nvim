function ColorMyPencils(color)
  color = color or "xcodedark"
  vim.cmd.colorscheme(color)

  --  vim.api.nvim_set_hl(0, "Diff", { bg = "None" })
  --  vim.api.nvim_set_hl(0, "NormalFloat", { bg = color == "xcodedark" and "#2d2d2d" or "#1c1c1c" })
end

ColorMyPencils()
