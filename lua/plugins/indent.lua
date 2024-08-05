return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User AstroFile",
    main = "ibl",
    opts = {
      indent = { char = "▏" },
      scope = { show_start = false, show_end = false },
      exclude = {
        buftypes = {
          "nofile",
          "terminal",
        },
        filetypes = {
          "help",
          "startify",
          "aerial",
          "alpha",
          "dashboard",
          "lazy",
          "neogitstatus",
          "NvimTree",
          "neo-tree",
          "Trouble",
        },
      },
    },
  },
  {
    "ntpeters/vim-better-whitespace",
    lazy = false,
  },
  {
    "Darazaki/indent-o-matic",
    lazy = false,
    opts = {
      max_lines = 2048,
      standard_widths = { 2, 4 },
    },
  },
}
