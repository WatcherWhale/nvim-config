
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        --"yaml",
        "go",
        "java",
        "kotlin",
        "json",
        "markdown",
        "javascript",
        "rust",
    },
    ignore_install = {
        "yaml"
    },
    auto_install = true,
    highlight = {
        enable = true
    }
}

--local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--parser_config.gotmpl = {
--    install_info = {
--        url = "https://github.com/ngalaiko/tree-sitter-go-template",
--        files = {"src/parser.c"}
--    },
--    filetype = "gotmpl",
--    used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "tpl"}
--}
--
--vim.api.nvim_create_augroup("filetypedetect", { clear = true })
--vim.api.nvim_create_autocmd(
--    {"BufNewFile","BufRead"},
--    {
--        pattern = "*.gitlab-ci.yml",
--        command = 'if search(\'{{.\\+}}\', \'nw\') | setlocal filetype=yaml | endif',
--        group = "filetypedetect"
--    }
--)

--require("headlines").setup({
--    markdown = {
--        headline_highlights = {
--            "Headline1",
--            "Headline2",
--            "Headline3",
--            "Headline4",
--            "Headline5",
--            "Headline6",
--        },
--        codeblock_highlight = "CodeBlock",
--        dash_highlight = "Dash",
--        quote_highlight = "Quote",
--        fat_headline_lower_string = "▀",
--    },
--})

