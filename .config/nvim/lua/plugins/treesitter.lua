return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "javascript", "html", "java", "gdscript", "godot_resource", "gdshader", "markdown", "markdown_inline"},
        sync_install = false,
        highlight = { enable = true },
        autotab = { enable = true },
        indent = { enable = true },
    },
}
