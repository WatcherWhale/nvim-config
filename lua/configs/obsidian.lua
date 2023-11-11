return {
    -- Required, the path to your vault directory.
    dir = "/home/watcherwhale/Documents/Notes",

    completion = {
        nvim_cmp = true,

        -- Trigger completion at 2 chars
        min_chars = 2,

        -- Where to put new notes created from completion. Valid options are
        --  * "current_dir" - put new notes in same directory as the current buffer.
        --  * "notes_subdir" - put new notes in the default notes subdirectory.
        new_notes_location = "notes_subdir",
    },

    -- Optional, key mappings.
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = require("obsidian.mapping").gf_passthrough(),
      ["gd"] = require("obsidian.mapping").gf_passthrough(),
    },

    finder = "telescope.nvim",

    open_notes_in = "current"
}
