vim.o.guicursor = ""

vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 1
vim.o.signcolumn = 'yes:1'

vim.o.wrap = false
vim.o.scrolloff = 999
vim.o.sidescrolloff = 10

vim.o.swapfile = false
vim.o.backup = false

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.smartindent = true
vim.o.breakindent = true

vim.o.timeoutlen = 1000
vim.o.updatetime = 200

vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.winborder = "rounded"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd("colorscheme sonokai")
vim.opt.path = { ".", "**" }

vim.keymap.set("n", "<leader>s", [[:vimgrep // **<left><left><left><left>]])
vim.keymap.set("n", "<leader>f", ":find ")
vim.keymap.set("n", "<leader>d", function() vim.diagnostic.setqflist({}) end)

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<M-j>", ":cnext<CR>")
vim.keymap.set("n", "<M-k>", ":cprev<CR>")
vim.keymap.set("n", "<M-l>", ":cnewer<CR>")
vim.keymap.set("n", "<M-h>", ":colder<CR>")

vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')

require('lspconfig').gdscript.setup({
    cmd = { "nc", "127.0.0.1", "6005" },
    filetypes = { "gd", "gdscript" },
    root_dir = require('lspconfig').util.root_pattern("project.godot", ".git"),
})
vim.lsp.enable({ "lua_ls", "clangd", })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

vim.cmd(":hi statusline guibg=NONE")
vim.cmd(":hi NormalFloat guibg=NONE")
vim.cmd(":hi FloatBorder guibg=NONE")

vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
    update_in_insert = false,
})

vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
        vim.diagnostic.show()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.path = { ".", "**" }
  end,
})
