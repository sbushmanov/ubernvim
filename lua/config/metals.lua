local M = {}

function M.setup()

  local api = vim.api
  local map = vim.keymap.set

  local status_ok, _ = pcall(require, "metals")
  if not status_ok then
    return
  end

  ----------------------------------
  -- OPTIONS -----------------------
  ----------------------------------
  -- global
  vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

  map("n", "F", function()
    vim.lsp.buf.format()
  end)

  -- all workspace diagnostics
  map("n", "<leader>aa", function()
    vim.diagnostic.setqflist()
  end)

  -- all workspace errors
  map("n", "<leader>ae", function()
    vim.diagnostic.setqflist({ severity = "E" })
  end)

  -- all workspace warnings
  map("n", "<leader>aw", function()
    vim.diagnostic.setqflist({ severity = "W" })
  end)

  -- buffer diagnostics only
  map("n", "<leader>bd", function()
    vim.diagnostic.setloclist()
  end)


  vim.fn.sign_define('DapBreakpoint', { text = "🛑", texthl = "", linehl = "", numhl = "" })
  vim.fn.sign_define('DapStopped', { text = "🐞", texthl = "", linehl = "", numhl = "" })
  vim.fn.sign_define('DapLogPoint', { text = "📝", texthl = "", linehl = "", numhl = "" })

  ----------------------------------
  -- LSP Setup ---------------------
  ----------------------------------
  local metals_config = require("metals").bare_config()

  -- Example of settings
  metals_config.settings = {
    showImplicitArguments = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
    javaHome = "/usr/lib/jvm/java-8-graalvm/"
  }

  -- *READ THIS*
  -- I *highly* recommend setting statusBarProvider to true, however if you do,
  -- you *have* to have a setting to display this in your statusline or else
  -- you'll not see any messages from metals. There is more info in the help
  -- docs about this
  metals_config.init_options.statusBarProvider = "on"

  -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
  metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- Debug settings if you're using nvim-dap
  local dap = require("dap")

  dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "Run",
      metalsRunType = "run",
      env = { JAVA_HOME = '/usr/lib/jvm/java-8-graalvm/' }
    },
    {
      type = "scala",
      request = "launch",
      name = "RunOrTest",
      metals = {
        runType = "runOrTestFile",
        --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
  }

  metals_config.on_attach = function(client, bufnr)
    require("metals").setup_dap()
  end

  -- Autocmd that will actually be in charging of starting the whole thing
  local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
  api.nvim_create_autocmd("FileType", {
    -- NOTE: You may or may not want java included here. You will need it if you
    -- want basic Java support but it may also conflict if you are using
    -- something like nvim-jdtls which also works on a java filetype autocmd.
    pattern = { "scala", "sbt", "java" },
    callback = function()
      require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
  })

end

return M
