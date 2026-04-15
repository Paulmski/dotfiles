-- Use intelephense as the PHP LSP
vim.g.lazyvim_php_lsp = "intelephense"

return {
  -- Add phpstan to Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "phpstan",
        "php-debug-adapter",
      },
    },
  },

  -- Add phpstan linting
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpcs", "phpstan" },
      },
    },
  },
}
