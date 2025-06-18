local state = {
    floating = {
        buf = -1,
        win = -1,
    }
}

local function create_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.4)
    local height = opts.height or math.floor(vim.o.lines * 0.4)

    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded",
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end

local function toggle_menu()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_window { buf = state.floating.buf }
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

vim.api.nvim_create_user_command("Markmenu", toggle_menu, {})
vim.keymap.set("n", "<leader>m", toggle_menu)

local function add_file()
    local file_path = vim.fn.expand("%:.")
    toggle_menu()
    toggle_menu()
    vim.api.nvim_buf_set_lines(state.floating.buf, -1, -1, false, { file_path })
end

vim.keymap.set("n", "<leader>a", add_file)

for i = 1, 9 do
    vim.keymap.set("n", "<C-" .. i .. ">", function()
        local marked_file = (vim.api.nvim_buf_get_lines(state.floating.buf, i, i + 1, false))[1]
        if not marked_file or marked_file == "" then
            return
        end
        vim.cmd("edit " .. vim.fn.fnameescape(marked_file))
    end)
end
