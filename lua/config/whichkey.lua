local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border   = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts_n = {
    mode    = "n", -- Normal mode
    prefix  = "<leader>",
    buffer  = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent  = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` whe\n creating keymaps
    nowait  = false, -- use `nowait` when creating keymaps
  }

  local opts_v = {
    mode    = "v", -- Normal mode
    prefix  = "<leader>",
    buffer  = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent  = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait  = false, -- use `nowait` when creating keymaps
  }

  local mappings_v = {}

  local mappings_n = {
    l = {
      name = "LSP",
      f = { "<cmd>Lspsaga lsp_finder<CR>", "LSP Finder" },
      F = { "<cmd>lua vim.lsp.buf.format()<CR>", "LSP Format" },
      c = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
      r = { "<cmd>Lspsaga rename<CR>", "Rename" },
      d = { "<cmd>Lspsaga peek_definition<CR>", "Definition" },
      k = { "<cmd>Lspsaga hover_doc<CR>", "Hover Doc" },
      o = { "<cmd>Lspsaga outline<CR>", "Outline" },
    }
  },

      --["w"] = { "<cmd>update!<CR>", "Save" },
      --["q"] = { "<cmd>q!<CR>", "Quit" },

      --b = {
      --  name = "Buffer",
      --  c = { "<Cmd>bd!<Cr>", "Close current buffer" },
      --  D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
      --},

      --F = {
      --  name = "Find",
      --  f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
      --  b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
      --  o = { "<cmd>FzfLua oldfiles<cr>", "Old files" },
      --  g = { "<cmd>FzfLua live_grep<cr>", "Live grep" },
      --  c = { "<cmd>FzfLua commands<cr>", "Commands" },
      --  e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
      --},

      --z = {
      --  name = "Packer",
      --  c = { "<cmd>PackerCompile<cr>", "Compile" },
      --  i = { "<cmd>PackerInstall<cr>", "Install" },
      --  p = { "<cmd>PackerProfile<cr>", "Profile" },
      --  s = { "<cmd>PackerSync<cr>",    "Sync"    },
      --  S = { "<cmd>PackerStatus<cr>",  "Status"  },
      --  u = { "<cmd>PackerUpdate<cr>",  "Update"  },
      --},

      --g = {
      --  name = "Git",
      --  s = { "<cmd>Neogit<CR>", "Status" },
      --},

      whichkey.setup(conf)
  whichkey.register(mappings_v, opts_v)
  whichkey.register(mappings_n, opts_n)
end

return M
