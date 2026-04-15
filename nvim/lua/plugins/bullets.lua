return {
  {
    "bullets-vim/bullets.vim",
    ft = { "markdown", "text", "gitcommit" },
    init = function()
      vim.g.bullets_enabled_file_types = { "markdown", "text", "gitcommit" }
      vim.g.bullets_outline_levels = { "num", "abc", "std-", "std*", "std+" }
      vim.g.bullets_set_mappings = 1
    end,
  },
}
