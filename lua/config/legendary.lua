local M = {}

local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

function M.setup()
  require("legendary").setup({
    include_builtin = true,
    -- auto_register_which_key = true,
    keymaps = {
      { "<space><space>", ":lua require'telescope'.extensions.metals.commands()<cr>", description = "Metals menu" },
      { "tg", ":Telescope live_grep<cr>", description="Telescope live grep"},
      { "tc", ":Telescope command_history<cr>", description="Telescope command history"},
      { "th", ":Telescope oldfiles<cr>", description="Telescope file history"},
      { "tf", ":Telescope find_files<cr>", description="Telescope find files"},
      { "tr", ":Telescope reloader<cr>", description="Telescope reloader"},
      { "tb", ":Telescope current_buffer_fuzzy_find<cr>", description="Telescope buffer find"},
      { "tn", ":Telescope buffers<cr>", description="Telescope buffers"},
      { "ts", ":Telescope lsp_document_symbols<cr>", description="Telescope lsp document symbol"},
      { "tp", ":Telescope projects<cr>", description="Telescope choose project"},
      { "tv", ":Telescope commands<cr>", description="Telescope vim commands"},
      { "td", ":Telescope diagnostics<cr>", description="Telescope diagnostics"},
      { "<leader>ff", ":FzfLua files<cr>", description = "Fzf files" },
      { "ff", ":FzfLua files<cr>", description = "Fzf files" },
      { "<leader>fb", ":FzfLua buffers<cr>", description = "Fzf buffer" },
      { "fb", ":FzfLua buffers<cr>", description = "Fzf buffer" },
      { "<leader>fg", ":FzfLua live_grep<cr>", description = "Fzf live grep" },
      { "fg", ":FzfLua live_grep<cr>", description = "Fzf live grep" },
      { "<leader>fh", ":FzfLua oldfiles<cr>", description = "Fzf file history" },
      { "fh", ":FzfLua oldfiles<cr>", description = "Fzf file history" },
      { "<leader>fv", ":FzfLua commands<cr>", description = "Fzf commands" },
      { "fv", ":FzfLua commands<cr>", description = "Fzf vim commands" },
      { "<leader>fl", ":FzfLua colorscheme<cr>", description = "fzf colorscheme" },
      { "fl", ":FzfLua colorscheme<cr>", description = "fzf colorscheme" },
      { "dr", ":lua  require('dap').repl.toggle()<cr>", description = "DAP repl" },
      { "dc", ":lua  require('dap').continue()<cr>", description = "DAP continue" },
      { "<leader>gf", ":Lspsaga lsp_finder<CR>", description = "Lspsaga finder" },
      { "gf", ":Lspsaga lsp_finder<CR>", description = "Lspsaga finder" },
      { "lf", ":Lspsaga lsp_finder<CR>", description = "Lspsaga finder" },
      { "<leader>ca", ":Lspsaga code_action<CR>", description = "Lspsaga code action" },
      { "ca", ":Lspsaga code_action<CR>", description = "Lspsaga code action" },
      { "la", ":Lspsaga code_action<CR>", description = "Lspsaga code action" },
      { "<leader>rn", ":Lspsaga rename<CR>", description = "Lspsaga rename" },
      { "lr", ":Lspsaga rename<CR>", description = "Lspsaga rename" },
      { "<leader>gd", ":Lspsaga peek_definition<CR>", description = "Lspsaga peek definition" },
      { "ld", ":Lspsaga peek_definition<CR>", description = "Lspsaga peek definition" },
      { "gd", ":Lspsaga peek_definition<CR>", description = "Lspsaga peek definition" },
      { "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", description = "Lspsaga go to definition" },
      { "gD", "<cmd>Lspsaga goto_definition<CR>", description = "Lspsaga go to definition" },
      { "lD", "<cmd>Lspsaga goto_definition<CR>", description = "Lspsaga go to definition" },
      { "<leader>gt", ":Lspsaga peek_type_definition<CR>", description = "Lspsaga peek type definition" },
      { "gt", ":Lspsaga peek_type_definition<CR>", description = "Lspsaga peek type definition" },
      { "lt", ":Lspsaga peek_type_definition<CR>", description = "Lspsaga peek type definition" },
      { "<leader>gT", ":Lspsaga goto_type_definition<CR>", description = "Lspsaga go to type definition" },
      { "gT", ":Lspsaga goto_type_definition<CR>", description = "Lspsaga go to type definition" },
      { "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", description = "Lspsaga cursor diagnostic" },
      { "lc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", description = "Lspsaga cursor diagnostic" },
      { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", description = "Lspsaga line diagnostic" },
      { "ll", "<cmd>Lspsaga show_line_diagnostics<CR>", description = "Lspsaga line diagnostic" },
      { "<leader>sb", "<cmd>Lspsaga show_buffer_diagnostics<CR>", description = "Lspsaga buffer diagnostic" },
      { "lb", "<cmd>Lspsaga show_buffer_diagnostics<CR>", description = "Lspsaga buffer diagnostic" },
      { "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", description = "Lspsaga workspace diagnostic" },
      { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", description = "Lspsaga previous diagnostic" },
      { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", description = "Lspsaga next diagnostic" },
      { "<leader>o", "<cmd>Lspsaga outline<CR>", description = "Lspsaga project outline" },
      -- { "K", "<cmd>Lspsaga hover_doc<CR>", description = "Lspsaga hover doc" },
      { "?", "<cmd>Lspsaga hover_doc<CR>", description = "Lspsaga hover doc" },
      { "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", description = "Lspsaga incoming calls" },
      { "ci", "<cmd>Lspsaga incoming_calls<CR>", description = "Lspsaga incoming calls" },
      { "li", "<cmd>Lspsaga incoming_calls<CR>", description = "Lspsaga incoming calls" },
      { "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", description = "Lspsaga outgoing calls" },
      { "co", "<cmd>Lspsaga outgoing_calls<CR>", description = "Lspsaga outgoing calls" },
      { "lo", "<cmd>Lspsaga outgoing_calls<CR>", description = "Lspsaga outgoing calls" },
      { "<A-t>", "<cmd>Lspsaga term_toggle<CR>", description = "Lspsaga toggle terminal" },
      { "gr",
        function()
          vim.lsp.buf.references()
        end,
        description = "Metals go to reference"
      },
      { "gi",
        function()
          require("telescope.builtin").lsp_implementations()
        end,
        description = "Metals go to implementation"
      },
      {
        "K",
        function()
          require('lsp_signature').toggle_float_win()
        end,
        description="Toggle function signature"
      },
      {"H","<cmd>lua vim.lsp.buf.hover()<CR>",description="Metals hover"
      },
      {"<leader>cl",function() vim.lsp.codelens.run() end, description="Code lense (aka Super method)"},
      {"<C-k>",function() vim.lsp.buf.signature_help() end, description="Metals function signature"},
    },
  })
  keymap("n", "<C-l>", "<cmd>lua require('legendary').find()<CR>", default_opts)
end

return M
