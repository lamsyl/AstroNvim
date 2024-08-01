return {
  -- See https://github.com/chentoast/marks.nvim/issues/13#issuecomment-1127944198
  "chentoast/marks.nvim",
  lazy = false,
  config = function()
    vim.api.nvim_set_hl(0, "MarkSignNumHL", { fg = "#3553ff", bg = "#ffe135" })
    require("marks").setup({
      force_write_shada = true,
      default_mappings = false,
      mappings = {
        ["set"] = "m",
        ["delete"] = "md",
        ["toggle"] = "mm",
        ["delete_line"] = "m-",
        ["next"] = "mn",
        ["prev"] = "mp",
        -- Use :delmarks! instead
        -- ["delete_buf"] = "m<space>",
      },
    })
    vim.keymap.set("n", "m<space>", '<cmd>delmarks!<cr>')
  end
}
