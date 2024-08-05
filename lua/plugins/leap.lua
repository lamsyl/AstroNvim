return {
  "ggandor/leap.nvim",
  commit = "f74473d23ebf60957e0db3ff8172349a82e5a442",
  lazy = false,
  config = function()
    require("leap").add_default_mappings()
  end,
}
