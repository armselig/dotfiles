--- VIM-PLUG

-- auto-install vim-plug
local plug_path = vim.fn.stdpath("data") .. "/site/autoload/plug.vim"
if vim.fn.empty(vim.fn.glob(plug_path)) > 0 then
    vim.fn.system({
        "curl",
        "-fLo",
        plug_path,
        "--create-dirs",
        "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
    })
    vim.api.nvim_exec_autocmds("VimEnter", { group = "*", modeline = false })
end

vim.cmd([[
    call plug#begin(stdpath('data') . '/plugged')
        " the pope is the man
        Plug 'tpope/vim-sensible'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-commentary'

        " base
        Plug 'Mofiqul/vscode.nvim'
        Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
        Plug 'jiangmiao/auto-pairs'             " auto-close '', (), {}...
        Plug 'christoomey/vim-tmux-navigator'

        " lit web components
        Plug 'jonsmithers/vim-html-template-literals'
        Plug 'pangloss/vim-javascript'
        Plug 'ap/vim-css-color'

        " misc
        Plug 'nvim-tree/nvim-web-devicons'      " icons for nvim-tree
        if has('nvim-0.9')
            Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlighting
        endif
        Plug 'windwp/nvim-ts-autotag'           " auto-close/-rename tags with Treesitter
        Plug 'nvim-lua/plenary.nvim'            " lua libs. required by many plugins
        Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
        Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
        Plug 'nvim-telescope/telescope-frecency.nvim'
        Plug 'nvim-tree/nvim-tree.lua'          " file browser. NOT nvim-neo-tree!
        Plug 'nvim-lualine/lualine.nvim'        " vim-airline in lua
        Plug 'akinsho/bufferline.nvim', { 'tag': '*' } " buffers on top
        Plug 'airblade/vim-gitgutter'
        Plug 'stevearc/conform.nvim'            " formatting
        Plug 'rosstang/dimit.nvim'              " dim inactive panes
        Plug 'folke/todo-comments.nvim'

        " lsp
        Plug 'neovim/nvim-lspconfig'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v4.x'}
        Plug 'williamboman/mason.nvim'
        Plug 'williamboman/mason-lspconfig.nvim'
    call plug#end()
]])

--- THEMING
-- Mofiqul/vscode.nvim
local c = require("vscode.colors").get_colors()
require("vscode").setup({
    -- Alternatively set style in setup
    -- style = 'light'

    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Underline `@markup.link.*` variants
    underline_links = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = "#FFFFFF",
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
    },
})
-- require('vscode').load()

-- catppuccin
local mocha = require("catppuccin.palettes").get_palette("mocha")

require("catppuccin").setup({
    flavour = "mocha",
    custom_highlights = function(colors)
        return {
            Normal = { bg = colors.crust },
        }
    end,
})

-- set global theme
vim.cmd.colorscheme("catppuccin")

-- Change line number color based on window focus
local line_nr_group = vim.api.nvim_create_augroup("LineNrColor", { clear = true })
vim.api.nvim_create_autocmd("WinEnter", {
    group = line_nr_group,
    pattern = "*",
    callback = function()
        vim.opt.winhighlight = "Normal:Normal,LineNr:WarningMsg"
    end,
})
vim.api.nvim_create_autocmd("WinLeave", {
    group = line_nr_group,
    pattern = "*",
    callback = function()
        vim.opt.winhighlight = "Normal:Normal,LineNr:LineNr"
    end,
})

require("nvim-ts-autotag").setup()
require("nvim-tree").setup({
    -- disable window_picker for
    -- explorer to work well with
    -- window splits
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    git = {
        ignore = false,
    },
})
require("lualine").setup({
    options = {
        theme = "catppuccin",
    },
})

--- akinsho/bufferline

--- akinsho/bufferline

require("bufferline").setup({
    options = {
        buffer_close_icon = "",
        close_command = "bdelete %d",
        close_icon = "󰅙",
        indicator = {
            style = "icon",
            icon = " ",
        },
        left_trunc_marker = "",
        modified_icon = "●",
        numbers = true,
        offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } },
        right_mouse_command = "bdelete! %d",
        right_trunc_marker = "",
        show_close_icon = false,
        show_tab_indicators = true,
        diagnostics = "nvim_lsp",
    },
    highlights = require("catppuccin.groups.integrations.bufferline").get({
        -- styles = { "italic", "bold" },
        styles = { "bold" },
        custom = {
            -- all = {
            --     fill = {
            --         bg = "#000000",
            --     },
            -- },
            mocha = {
                fill = {
                    bg = mocha.base,
                    fg = mocha.text,
                },
                buffer_selected = {
                    -- bg = mocha.surface0,
                    fg = mocha.green,
                },
            },
            latte = {
                background = { fg = "#000000" },
            },
        },
    }),
})

--- folke/todo-comments.nvim
require("todo-comments").setup()

--- TREESITTER
-- TODO: version check
require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false, -- should fix indentation of multiline comments
    },
    indent = { enable = true },
    ensure_installed = {
        "bash",
        "c",
        "css",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
    },
})

--- CONFORM
require("conform").setup({
    formatters_by_ft = {
        -- empty for ts/js so that formatting is done by lsp
        javascript = {},
        javascriptreact = {},
        typescript = {},
        typescriptreact = {},
        css = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        lua = { "stylua" },
    },
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    },
})

--- TELESCOPE & PLUGINS
require("telescope").load_extension("frecency")

-- install plugins when nvim starts
-- vim.cmd [[
--     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
-- ]]

--- rosstang/dimit.nvim
require("dimit").setup({
    bgcolor = mocha.base,
})
