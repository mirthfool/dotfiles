-- Map leader to space.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Explore with project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Split panes.
vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>wh", vim.cmd.split)

-- Resize panes.
vim.keymap.set("n", "<C-w>=", [[<cmd>vertical resize +5<cr>]])

-- Stay in visual mode when indenting.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Fix edge cases when control c does not escape.
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("v", "<C-c>", "<Esc>")

-- Exit instert mode in terminal windows with control a.
vim.keymap.set("t", "<C-a>", "<C-\\><C-N>")

-- Toggle between single line and editable paragraph for note taking
vim.keymap.set("i", "<C-p>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)

    vim.cmd("normal! vip")

    local start_line = vim.fn.line("v")
    local end_line = vim.fn.line(".")
    local count = end_line - start_line + 1

    if count > 1 then
        vim.cmd("normal! J")
    else
        vim.cmd("normal! gw")
    end

    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i", true, false, true), "n", true)
end)

-- Follow obsidian style links in markdown files.
vim.keymap.set("n", "<leader>i", function()
    local word = vim.fn.expand('<cWORD>')
    local filename = word:gsub("^%[%[", ""):gsub("%]%]$", "") .. ".md"
    local filepath = "./" .. filename

    if vim.fn.filereadable(filepath) == 1 then
        vim.cmd("edit " .. filepath)
    else
        vim.cmd("edit " .. filepath)
    end
end)
