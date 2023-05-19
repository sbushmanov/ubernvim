local M = {}

local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

function M.setup()
  require("legendary").setup({
    include_builtin = true,
    -- auto_register_which_key = true,
    keymaps = {
      { '<leader>ff', ':Telescope find_files', description = 'Find files' },
      { "<space><space>", ":lua require'telescope'.extensions.metals.commands()<cr>", description = "Metals menu" },
      { "<leader>ff", ":FzfLua files<cr>", description = "Fzf files" },
      { "<leader>fb", ":FzfLua buffers<cr>", description = "Fzf buffer" },
      { "<leader>fg", ":FzfLua live_grep<cr>", description = "Fzf grep" },
      { "<leader>fh", ":FzfLua oldfiles<cr>", description = "Fzf file history" },
      { "<leader>fv", ":FzfLua commands<cr>", description = "Fzf commands" },
      { "<leader>fl", ":FzfLua colorscheme<cr>", description = "fzf colorscheme" },
      { "dr", ":lua  require('dap').repl.toggle()<cr>", description = "DAP repl" },
      { "dc", ":lua  require('dap').continue()<cr>", description = "DAP continue" },
      { "<leader>gf", ":Lspsaga lsp_finder<CR>", description = "Lspsaga finder" },
      { "<leader>lf", ":Lspsaga lsp_finder<CR>", description = "Lspsaga finder" },
      { "<leader>ca", "<cmd>Lspsaga code_action<CR>", description = "Lspsaga code action" },
      { "<leader>la", "<cmd>Lspsaga code_action<CR>", description = "Lspsaga code action" },
      { "<leader>rn", "<cmd>Lspsaga rename<CR>", description = "Lspsaga rename" },
      { "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", description = "Lspsaga peek definition" },
      { "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", description = "Lspsaga go to definition" },
      { "<leader>gt", ":Lspsaga peek_type_definition<CR>", description = "Lspsaga peek type definition" },
      { "<leader>gT", ":Lspsaga goto_type_definition<CR>", description = "Lspsaga go to type definition" },
      { "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", description = "Lspsaga cursor diagnostic" },
      { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", description = "Lspsaga line diagnostic" },
      { "<leader>sb", "<cmd>Lspsaga show_buffer_diagnostics<CR>", description = "Lspsaga buffer diagnostic" },
      { "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", description = "Lspsaga workspace diagnostic" },
      { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", description = "Lspsaga previous diagnostic" },
      { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", description = "Lspsaga next diagnostic" },
      { "<leader>o", "<cmd>Lspsaga outline<CR>", description = "Lspsaga project outline" },
      -- { "K", "<cmd>Lspsaga hover_doc<CR>", description = "Lspsaga hover doc" },
      { "?", "<cmd>Lspsaga hover_doc<CR>", description = "Lspsaga hover doc" },
      { "<leader>K", "<cmd>Lspsaga hover_doc<CR>", description = "Lspsaga hover doc" },
      { "<leader>?", "<cmd>Lspsaga hover_doc<CR>", description = "Lspsaga hover doc" },
      { "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", description = "Lspsaga incoming calls" },
      { "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", description = "Lspsaga outgoing calls" },
      { "<A-t>", "<cmd>Lspsaga term_toggle<CR>", description = "Lspsaga toggle terminal" },
      { "gr",
        function()
          vim.lsp.buf.references()
        end,
        description = "Metals go to reference"
      },
      {
        "K",
        function()
          require('lsp_signature').toggle_float_win()
        end,
        description="Toggle function signature"
      },
    },
  })
  keymap("n", "<C-l>", "<cmd>lua require('legendary').find()<CR>", default_opts)
end

return M
