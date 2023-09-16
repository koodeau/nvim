vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
keymap.set("i", "<C-c>", "<Esc>")

keymap.set("n", "Q", "<nop>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap.set("n", "<leader>ff", vim.lsp.buf.format, { silent = true })

keymap.set("i", "jk", "<Esc>")
keymap.set("i", "jj", "<Esc>")
keymap.set("i", "kk", "<Esc>")
keymap.set("i", "kj", "<Esc>")
keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>")

keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap.set("n", "<leader>pl", "<C-w>v<C-w><Right>")
keymap.set("n", "<leader>pj", "<C-w>v<C-w><Down>")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/koodeau/packer.lua<CR>");
keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Strip trailing whitespace
keymap.set("n", "<leader>sw", [[:%s/\s\+$//e<CR>]])

keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- Noice
-- keymap.set("n", "<leader>nn", ":NoiceDismiss<CR>", {noremap=true})
