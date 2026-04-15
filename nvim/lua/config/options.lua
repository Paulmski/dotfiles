-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Enable spell checking
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

-- WSL: open URLs in Windows browser via wslview
if vim.fn.has("wsl") == 1 then
  vim.ui.open = function(uri)
    vim.fn.jobstart({ "wslview", uri }, { detach = true })
  end
end
