local M = {}

function M.setup()

  ---@diagnostic disable-next-line: redundant-parameter
  require('lspsaga').setup({
    ui = {
      -- Currently, only the round theme exists
      theme = "round",
      -- This option only works in Neovim 0.9
      title = true,
      -- Border type can be single, double, rounded, solid, shadow.
      border = "rounded",
      winblend = 0,
      expand = "",
      collapse = "",
      preview = " ",
      code_action = "💡",
      diagnostic = "🐞",
      incoming = " ",
      outgoing = " ",
      hover = ' ',
      kind = {},
    },
  })

  local keymap = vim.keymap.set
  keymap({ "n", "t" }, "<A-t>", "<cmd>Lspsaga term_toggle<CR>")

  -- Diagnostic jump with filter like Only jump to error
  keymap("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end)
  keymap("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  end)
end

return M
