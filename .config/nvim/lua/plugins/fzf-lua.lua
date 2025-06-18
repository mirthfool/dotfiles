return {
    "ibhagwan/fzf-lua",
    keys = {
        { "<leader>pf",       function() require("fzf-lua").files() end, },

        { "<leader>ps",       function() require("fzf-lua").live_grep() end, },

        { "<leader><leader>", function() require("fzf-lua").resume() end, },
    },
    opts = {
        defaults = {
            git_icons = false,
            file_icons = false,
            color_icons = false,
        },
        lsp = {
            diagnostics = {
                previewer = false,
            }
        }
    },
}
