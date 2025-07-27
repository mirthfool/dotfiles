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


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)



-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { "ellisonleao/gruvbox.nvim" },
        { "echasnovski/mini.pick" },
        { "neovim/nvim-lspconfig" },
    },
    install = {},
    -- automatically check for plugin updates
    checker = { enabled = true },
})

require("mini.pick").setup()

vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d<CR>')

vim.lsp.enable({ "lua_ls", "clangd", })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.opt.completeopt = { "menu", "menuone", "popup", "noselect" }
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

vim.cmd("colorscheme gruvbox")
vim.cmd(":hi statusline guibg=NONE")

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
