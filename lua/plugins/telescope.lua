-- Add .ignore in repo to restrict search space
--
-- For live grep
-- Use <C-G> to pass --no-ignore-dot
--
-- For find files
-- Use <leader>fF to find all files
local function append_no_ignore_dot(prompt_bufnr)
  local action_state = require("telescope.actions.state")
  local picker = action_state.get_current_picker(prompt_bufnr)
  local prompt = picker:_get_prompt()
  prompt = prompt .. "--no-ignore-dot"
  picker:set_prompt(prompt)
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    "folke/trouble.nvim",
  },
  cmd = "Telescope",
  opts = function()
    local actions = require "telescope.actions"
    local lga_actions = require "telescope-live-grep-args.actions"
    local trouble = require "trouble.sources.telescope"
    local get_icon = require("astronvim.utils").get_icon
    return {
      defaults = {
        git_worktrees = vim.g.git_worktrees,
        prompt_prefix = get_icon("Selected", 1),
        selection_caret = get_icon("Selected", 1),
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-t>"] = trouble.open,
          },
          n = {
            q = actions.close,
            ["<C-t>"] = trouble.open,
          },
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-F>"] = lga_actions.quote_prompt(),
              ["<C-G>"] = append_no_ignore_dot,
            },
          },
        },
      },
    }
  end,
  config = require "plugins.configs.telescope",
}
