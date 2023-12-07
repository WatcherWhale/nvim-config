-- Import configs
require("configs/plugins")
require("configs/theming")
require("configs/telescope")
require("configs/lsp")
require("configs/treesitter")
require("configs/cmp")
require("configs/settings")
require("configs/gen")

-- Disable case sensitivity
vim.o.ignorecase = true
-- Enable case sensitivity if search contains uppercase
vim.o.smartcase = true

-- Share Clipboard
vim.opt.clipboard = 'unnamedplus'

-- Set Tabs to 4 spaces
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Disable Mouse Actions
vim.o.mouse = ""

-- Keep cursor centered
vim.o.scrolloff=999

-- Shortcuts

-- Markdown Preview
vim.keymap.set('n', '<leader>M', ':MarkdownPreviewToggle<CR>')

vim.keymap.set('n', '<leader>m', require('treesj').toggle)

-- Window Choosing
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Window Sizing
vim.keymap.set('n', '<S-h>', '<C-w>>')
vim.keymap.set('n', '<S-l>', '<C-w><')

-- Window control
vim.keymap.set('n', '<leader>v', ':vsplit<CR>')
vim.keymap.set('n', '<leader>s', ':split<CR>')

-- Buffer
vim.keymap.set('n', '<leader>bb', ':enew<CR>')
vim.keymap.set('n', '<leader>bn', ':bnext<CR>')
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>')

vim.keymap.set("n", "<leader>tt", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tn", ":tabNext<CR>")
vim.keymap.set("n", "<leader>tp", ":tabPrevious<CR>")
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>")

-- Unbind capital Q (Ex Mode)
vim.keymap.set('n', 'Q', '<Nop>')


vim.keymap.set('v', 'p', 'pgvy', { noremap = true})

-- Nos: No Search
vim.cmd([[command Nos :call histdel('/') | :noh]])

-- Git Aliases
vim.cmd([[command! Push Git push -o merge_request.create ]])
vim.cmd([[command! Pull Git pull ]])
vim.cmd([[command! NpmSync !npm i ]])
vim.cmd([[command! Npm call jobstart('npm i') ]])

vim.cmd([[command! W w ]])
vim.cmd([[command! Wq wq ]])

-- Autobuffer
vim.cmd([[autocmd FileType helm setlocal ts=2 sts=2 sw=2 expandtab]])
vim.cmd([[autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab]])
vim.cmd([[autocmd FileType terraform setlocal ts=2 sts=2 sw=2 expandtab]])

vim.cmd([[autocmd FileType terraform command! Fmt :%!terraform fmt - ]])

vim.cmd([[au BufNewFile,BufRead,BufWrite *.tf set filetype=terraform]])
vim.cmd([[au BufNewFile,BufRead,BufWrite *.tfvars set filetype=terraform]])


vim.keymap.set("n", "<leader>xx", function() require("trouble").open() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)

vim.keymap.set('n', '<leader>lg', ':Gen Generate<CR>')
vim.keymap.set('v', '<leader>lg', ':Gen Change_Code<CR>')
