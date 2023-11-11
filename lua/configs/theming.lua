-- Enable numberline and cursor highlight
vim.o.number = true
vim.wo.relativenumber = true
vim.o.cursorline = true
vim.o.list = true
--Vset listchars=tab:›\ ,trail:•,extends:#,nbsp:.
vim.o.listchars = "tab:› ,trail:•,extends:#,nbsp:."

vim.g.nord_uniform_diff_background = true
vim.g.nord_cursorline_transparent = false

-- Colorscheme
require('nord').set()

-- Status Line
require("lualine").setup({
    options = {
        theme = "nord",
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_x = {'filetype'}
    }
})

-- Command Line
--require("noice").setup({
--    lsp = {
--        override = {
--            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--            ["vim.lsp.util.stylize_markdown"] = true,
--            ["cmp.entry.get_documentation"] = true,
--        }
--    },
--    presets = {
--    }
--})
--

require("notify").setup({
    render = "compact",
    top_down = false,
})

vim.cmd([[highlight NotifyERRORBorder guifg=#bf616a]])
vim.cmd([[highlight NotifyWARNBorder guifg=#ebcb8b]])
vim.cmd([[highlight NotifyINFOBorder guifg=#5e81ac]])
vim.cmd([[highlight NotifyDEBUGBorder guifg=#81a1c1]])
vim.cmd([[highlight NotifyTRACEBorder guifg=#81a1c1]])
vim.cmd([[highlight NotifyERRORIcon guifg=#bf616a]])
vim.cmd([[highlight NotifyWARNIcon guifg=#ebcb8b]])
vim.cmd([[highlight NotifyINFOIcon guifg=#5e81ac]])
vim.cmd([[highlight NotifyDEBUGIcon guifg=#81a1c1]])
vim.cmd([[highlight NotifyTRACEIcon guifg=#81a1c1]])
vim.cmd([[highlight NotifyERRORTitle  guifg=#bf616a]])
vim.cmd([[highlight NotifyWARNTitle guifg=#ebcb8b]])
vim.cmd([[highlight NotifyINFOTitle guifg=#5e81ac]])
vim.cmd([[highlight NotifyDEBUGTitle  guifg=#81a1c1]])
vim.cmd([[highlight NotifyTRACETitle  guifg=#81a1c1]])
vim.cmd([[highlight link NotifyERRORBody Normal]])
vim.cmd([[highlight link NotifyWARNBody Normal]])
vim.cmd([[highlight link NotifyINFOBody Normal]])
vim.cmd([[highlight link NotifyDEBUGBody Normal]])
vim.cmd([[highlight link NotifyTRACEBody Normal]])
