-- Options
vim.o.guicursor = ""

vim.o.termguicolors = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 1
vim.o.signcolumn = 'yes'

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

vim.o.winborder = "bold"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Colorscheme options
vim.g.nord_bold = false
vim.cmd("colorscheme kanso-mist")
vim.cmd(":hi statusline guibg=NONE")
vim.cmd(":hi statuslineNC guibg=NONE")

-- Plugins
require "mini.pick".setup({
    window = {
        config = function()
            local height = math.floor(0.618 * vim.o.lines)
            local width = math.floor(0.618 * vim.o.columns)
            return {
                anchor = 'NW',
                height = height,
                width = width,
                row = math.floor(0.5 * (vim.o.lines - height)),
                col = math.floor(0.5 * (vim.o.columns - width)),
            }
        end
    },
})
require "gitsigns".setup()

-- Keymaps
vim.keymap.set("n", "<leader>d", function() vim.diagnostic.setqflist() end)
vim.keymap.set("n", "<leader>f", "<cmd>Pick files<CR>")
vim.keymap.set("n", "<leader>s", "<cmd>Pick grep_live<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>Pick help<CR>")
vim.keymap.set("n", "<leader>e", function() MiniFiles.open() end)

vim.keymap.set("n", "<leader>gg", "<cmd>Gitsigns setqflist all<CR>")
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk_inline<CR>")
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<CR>")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-l>", "<cmd>cnewer<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>colder<CR>")

-- Lsp Options
vim.lsp.enable({ "lua_ls", "clangd", "rust_analyzer" })
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            }
        }
    }
})

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

vim.diagnostic.config({
    virtual_text = true,
    signs = false,
    update_in_insert = false,
})
