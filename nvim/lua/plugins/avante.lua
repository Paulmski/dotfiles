return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    opts = {
      provider = "copilot",
      providers = {
        copilot = {
          model = "gpt-4o", -- run :AvanteModels to see all available models and switch to Claude
          extra_request_body = {
            max_tokens = 4096, -- limit response size to save output tokens
            temperature = 0.7,
          },
        },
      },
      override_prompt_dir = vim.fn.expand("~/.config/avante/rules"), -- global prompt directory
      mode = "agentic", -- keep agentic mode but trim unused tools below
      behaviour = {
        auto_suggestions = false, -- copilot.lua handles inline completions
        auto_add_current_file = false, -- don't auto-add current file; use @file or <Leader>ac when needed
        enable_token_counting = true, -- keep this so you can see token usage
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "zbirenbaum/copilot.lua",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
