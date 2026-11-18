return {
  -- dap.core + lang.java di-import lewat lazyvim.json (urutan import benar)
  -- Python: pakai debugpy-adapter dari mason
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
      require("dap-python").setup("debugpy-adapter")
      local dap = require("dap")
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          -- langsung eksekusi file yang sedang aktif di buffer
          program = function()
            return vim.fn.expand("%:p")
          end,
          console = "integratedTerminal",
        },
      }
    end,
  },


  -- C / C++: codelldb
  {
    "mfussenegger/nvim-dap",
    optional = true,
    config = function()
      local dap = require("dap")

      if not dap.adapters["codelldb"] then
        dap.adapters["codelldb"] = {
          type = "server",
          host = "127.0.0.1",
          port = "${port}",
          executable = {
            command = "codelldb",
            args = { "--port", "${port}" },
          },
        }
      end

      for _, lang in ipairs({ "c", "cpp" }) do
        dap.configurations[lang] = {
          {
            type = "codelldb",
            request = "launch",
            name = "Launch file",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
          },
          {
            type = "codelldb",
            request = "attach",
            name = "Attach to process",
            pid = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
  -- Jangan tutup dapui setelah sesi debug selesai (program exit)
  {
    "rcarriga/nvim-dap-ui",
    optional = true,
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")

      -- panel bawah: console (terminal) di kiri, repl di kanan
      opts.layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          size = 40,
          position = "left",
        },
        {
          elements = { "console", "repl" },
          size = 10,
          position = "bottom",
        },
      }

      dapui.setup(opts)

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end

      -- buang handler close bawaan LazyVim
      dap.listeners.before.event_terminated["dapui_config"] = nil
      dap.listeners.before.event_exited["dapui_config"] = nil
    end,
  },
}
