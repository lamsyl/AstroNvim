local get_icon = require("astronvim.utils").get_icon
return {
  {
    "lewis6991/gitsigns.nvim",
    enabled = vim.fn.executable "git" == 1,
    event = "User AstroGitFile",
    opts = {
      signs = {
        add = { text = get_icon "GitSign" },
        change = { text = get_icon "GitSign" },
        delete = { text = get_icon "GitSign" },
        topdelete = { text = get_icon "GitSign" },
        changedelete = { text = get_icon "GitSign" },
        untracked = { text = get_icon "GitSign" },
      },
      worktrees = vim.g.git_worktrees,
    },
  },
  {
    "akinsho/git-conflict.nvim",
    tag = "v1.1.2",
    lazy = false,
    config = function()
      vim.api.nvim_set_hl(0, "ConflictCurrent", { fg = "#ffffff", bg = "#16537e" })
      vim.api.nvim_set_hl(0, "ConflictIncoming", { fg = "#ffffff", bg = "#1a3737" })
      require("git-conflict").setup({
        debug = false,
        default_mappings = false,
        default_commands = true,
        disable_diagnostics = true,
        highlights = {
          current = "ConflictCurrent",
          incoming = "ConflictIncoming",
        }
      })
    end
  },
}
