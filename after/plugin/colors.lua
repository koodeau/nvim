function ColorMyPencils(color)
  color = color or "xcodedark"

  vim.api.nvim_set_hl(0, "Diff", { bg = "None" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = color == "xcodedark" and "#2d2d2d" or "#1c1c1c" })
end

ColorMyPencils()
