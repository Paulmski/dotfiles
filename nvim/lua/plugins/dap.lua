-- PHP/Xdebug DAP configuration
-- Mirrors the settings from .vscode/launch.json
return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")

      -- PHP debug adapter (installed via Mason)
      dap.adapters.php = {
        type = "executable",
        command = "php-debug-adapter",
      }

      -- Debug configurations matching .vscode/launch.json
      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug (Direct)",
          port = 9004,
          pathMappings = {
            ["/var/www/html/files"] = "${workspaceFolder}/files",
            ["/var/www/html/staticfiles"] = "${workspaceFolder}/staticfiles",
            ["/var/www/html/scripts"] = "${workspaceFolder}/scripts",
          },
        },
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug (Proxy)",
          port = 9004,
          proxy = {
            enable = true,
            host = "localhost",
            port = 9001,
            key = "d2l-cm",
          },
          pathMappings = {
            ["/var/www/html/files"] = "${workspaceFolder}/files",
            ["/var/www/html/staticfiles"] = "${workspaceFolder}/staticfiles",
            ["/var/www/html/scripts"] = "${workspaceFolder}/scripts",
          },
        },
      }
    end,
  },
}

