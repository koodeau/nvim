require("koodeau.set")
require("koodeau.remap")

local augroup = vim.api.nvim_create_augroup
local koodeau = augroup('koodeau', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end


autocmd({'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter'}, {
    group = koodeau,
    pattern = "*",
    command = [[if &nu && mode() != "i" | set rnu | endif]],
})

autocmd({'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave'}, {
    group = koodeau,
    pattern = "*",
    command = [[if &nu | set nornu | endif]],
})

--autocmd({'SignifySetup'}, {
--  group = koodeau,
--  pattern = "*",
--  command = [[ autocmd! signify | autocmd signify TextChanged,TextChangedI * call sy#start() ]]
--})
        --    \ execute 'autocmd! signify' |
         --   \ autocmd signify TextChanged,TextChangedI * call sy#start()

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

autocmd({"BufWritePre"}, {
    group = koodeau,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


--autocmd({"BufWritePre"}, {
--    group = koodeau,
--    pattern = "*",
--    command = [[%s/\n\+\%$//e]],
--})

-- change cursor shape in different modes
--autocmd({"InsertEnter"}, {
--    group = koodeau,
--    pattern = "*",
--    command = [[set cul]],
--})

--autocmd({"InsertLeave"}, {
--    group = koodeau,
--    pattern = "*",
--    command = [[set nocul]],
--})


-- comment out the line when you press CMD + /
autocmd({"BufEnter"}, {
  group = koodeau,
  pattern = "*",
  command = [[nnoremap <D-/> :CommentToggle<CR>]],
})


--autocmd({"BufEnter", "FocusGained", "InsertLeave", "WinEnter"}, {
--    group = numbertoggle,
--    pattern = "*",
--    command = [[if &nu && mode() != "i" | set rnu | endif]],
--})
