local builtin = require('telescope.builtin')
local fb_actions = require "telescope._extensions.file_browser.actions"
local actions = require "telescope.actions"

--create_worktree = function()
--    require('telescope').extensions.git_worktree.create_git_worktree()
--end

vim.keymap.set('n', '<leader>fr', builtin.resume, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})

--vim.keymap.set('n', '<leader>fw', require('telescope').extensions.git_worktree.git_worktrees, {})
--vim.keymap.set('n', '<leader>fa', create_worktree, {})
vim.api.nvim_set_keymap("n", "<leader>fv", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
vim.keymap.set('n', '<leader>u', "<cmd>Telescope undo<cr>")


require("telescope").setup{
    defaults = {
        mappings = {
            --["i"] = {
            --    ["<C-o>"] = function(prompt_bufnr) require("telescope.actions").select_default(prompt_bufnr) require("telescope.builtin").resume() end,
            --    ["<C-q>"] = actions.send_to_qflist,
            --}
        },
        sorting_strategy = "ascending",
        theme = "ivy",
        file_ignore_patterns = {
            "node_modules/",
            "build/",
            "dist/",
            "yarn.lock",
            "package-lock.json",
            "crds/",
            ".bare/**",
            ".git/",
            ".trash/",
            ".obsidian/",
        }
    },
    pickers = {
        find_files = {
            theme = "ivy",
            hidden = true
        },
        buffers = {
            theme = "ivy",
        },
        git_branches = {
            theme = "ivy"
        },
        live_grep = {
            theme = "ivy"
        },
        oldfiles = {
            theme = "ivy"
        }
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            cwd_to_path = true,
            mappings = {
                ["i"] = {
                    ["<C-a>"] = fb_actions.create,
                    ["<C-CR>"] = fb_actions.create_from_prompt,
                    ["<C-r>"] = fb_actions.rename,
                    ["<C-m>"] = fb_actions.move,
                    ["<C-y>"] = fb_actions.copy,
                    ["<C-d>"] = fb_actions.remove,
                    ["<C-o>"] = fb_actions.open,
                    ["<C-g>"] = fb_actions.goto_parent_dir,
                    ["<C-e>"] = fb_actions.goto_home_dir,
                    ["<C-w>"] = fb_actions.goto_cwd,
                    ["<C-t>"] = fb_actions.change_cwd,
                    ["<C-f>"] = fb_actions.toggle_browser,
                    ["<C-h>"] = fb_actions.toggle_hidden,
                    ["<C-s>"] = fb_actions.toggle_all,
                    --["<bs>"] = fb_actions.backspace,
                },
                ["n"] = {
                    ["<C-a>"] = fb_actions.create,
                    ["a"] = fb_actions.create,
                    ["r"] = fb_actions.rename,
                    ["m"] = fb_actions.move,
                    ["y"] = fb_actions.copy,
                    ["d"] = fb_actions.remove,
                    ["o"] = fb_actions.open,
                    ["g"] = fb_actions.goto_parent_dir,
                    ["e"] = fb_actions.goto_home_dir,
                    ["w"] = fb_actions.goto_cwd,
                    ["t"] = fb_actions.change_cwd,
                    ["f"] = fb_actions.toggle_browser,
                    ["h"] = fb_actions.toggle_hidden,
                    ["s"] = fb_actions.toggle_all,
                },
            }
        },
        --git_worktree = {
        --    theme = "ivy",
        --    path_display = { "shorten" },
        --    items = {
        --        {"branch"},
        --        {"sha"}
        --    },
        --    mappings = {
        --        ["i"] = {
        --            ["<C-a>"] = create_worktree,
        --            ["<C-d>"] = require("telescope").extensions.git_worktree.actions.delete_worktree,
        --            ["<C-f>"] = require("telescope").extensions.git_worktree.actions.toggle_forced_deletion,
        --        },
        --        ["n"] = {
        --            ["<C-a>"] = create_worktree,
        --            ["<C-d>"] = require("telescope").extensions.git_worktree.actions.delete_worktree,
        --            ["<C-f>"] = require("telescope").extensions.git_worktree.actions.toggle_forced_deletion,
        --        }
        --    }
        --},
        undo = {
            theme = "ivy",
        }
    }
}

pcall(require('telescope').load_extension, 'fzf')

--require('git-worktree').setup({
--    base_directory = "../",
--    after_create_commands = {
--        "npx husky install"
--    }
--})
--require('telescope').load_extension('git_worktree')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('undo')

local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy())
end, { desc = '[/] Fuzzily search in current buffer' })

nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
