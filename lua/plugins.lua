local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    profile = {
      enable    = true,
      threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },

    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Align through <Enter>
    use { "junegunn/vim-easy-align" }

    -- Scala metals
    use({
      "scalameta/nvim-metals",
      requires = {
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
      },
      config = function()
        require("config.metals").setup()
      end,
      disable = false,
    })

    -- LSP
    use({
      "neovim/nvim-lspconfig",
      wants = { "nvim-lsp-installer", "lsp_signature.nvim", "coq_nvim", "cmp-nvim-lsp", "lua-dev.nvim", "vim-illuminate" },
      -- wants = { "nvim-lsp-installer", "coq_nvim", "cmp-nvim-lsp", "lua-dev.nvim", "vim-illuminate" },
      requires = {
        "nvim-lua/lsp_extensions.nvim",
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "williamboman/nvim-lsp-installer",
        "ray-x/lsp_signature.nvim",
        "folke/neodev.nvim",
        {
          "j-hui/fidget.nvim",
          config = function()
            require("fidget").setup {}
          end,
        },
      },
      config = function()
        require("config.lspconfig").setup()
      end,
    })

    use({
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-vsnip" },
        { "hrsh7th/vim-vsnip" },
        { "ray-x/cmp-treesitter" },
        { "hrsh7th/cmp-path" },
      },
      config = function()
        require("config.cmp").setup()
      end,
    })

    use { "nvim-lua/plenary.nvim", module = "plenary" }

    -- Colorscheme
    use {
      "sainnhe/everforest",
      config = function()
        vim.cmd "colorscheme everforest"
      end,
    }

    -- -- Startup screen
    -- use {
    --   "goolord/alpha-nvim",
    --   config = function()
    --     require("config.alpha").setup()
    --   end,
    -- }
    -- Startup screen
    use {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      theme = 'doom',
      preview = 'command',
      config = function()
        require('config.dashboard').setup()
      end,
      requires = { 'nvim-tree/nvim-web-devicons' }
    }
    --
    -- Better Netrw
    use { "tpope/vim-vinegar" }

    -- Git
    use {
      "TimUntersberger/neogit",
      cmd = "Neogit",
      config = function()
        require("config.neogit").setup()
      end,
    }

    use {
      "kdheepak/lazygit.nvim",
      requires = { "nvim-lua/plenary.nvim" }
    }


    -- -- WhichKey
    -- use {
    --   "folke/which-key.nvim",
    --   event = "VimEnter",
    --   config = function()
    --     require("config.whichkey").setup()
    --   end,
    -- }

    -- IndentLine
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPre",
      config = function()
        require("config.indentblankline").setup()
      end,
    }

    -- Better icons
    use {
      "nvim-tree/nvim-web-devicons",
      -- module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }

    -- Better Comment
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup {}
      end,
    }

    -- Better surround
    use { "tpope/vim-surround", event = "InsertEnter" }

    use 'ggandor/lightspeed.nvim'

    use {
      'mrjones2014/legendary.nvim',
      event = 'VimEnter',
      -- opt = true,
      keys = { [['<C-l>']] },
      wants = { "dressing.nvim" },
      -- module = { "legendary" },
      cmd = { "Legendary" },
      config = function()
        require("config.legendary").setup()
      end,
      requires = { "stevearc/dressing.nvim", },
      dependencies = { 'kkharji/sqlite.lua', },
      disable = false
    }


    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end,
      ft = "markdown",
      cmd = { "MarkdownPreview" },
    }

    -- Status line
    use {
      "nvim-lualine/lualine.nvim",
      after = "nvim-treesitter",
      config = function()
        require("config.lualine").setup()
      end,
      wants = "nvim-web-devicons",
    }

    use {
      "SmiteshP/nvim-gps",
      requires = "nvim-treesitter/nvim-treesitter",
      module = "nvim-gps",
      wants = "nvim-treesitter",
      config = function()
        require("nvim-gps").setup()
      end,
    }

    --FrameComment
    use {
      "cometsong/CommentFrame.vim",
      config = function()
        require("config.commentframe").setup()
      end,
    }

    -- Bqf
    use { 'kevinhwang91/nvim-bqf' }

    use({
      "glepnir/lspsaga.nvim",
      requires = "mrjones2014/legendary.nvim",
      wants = "legendary",
      branch = "main",
      config = function()
        require('config.lspsaga').setup()
      end,
    })

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      opt = true,
      event = "BufRead",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
      },
    }

    -- FZF
    -- use { "junegunn/fzf", run = "./install --all", event = "VimEnter" } -- You don't need to install this if you already have fzf installed
    -- use { "junegunn/fzf.vim", event = "BufEnter" }

    -- FZF Lua
    use {
      "ibhagwan/fzf-lua",
      -- event = "BufEnter",
      requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      wants = "nvim-web-devicons",
      view = {
        width = 25
      },
      config = function()
        require("nvim-web-devicons").setup()
        require("nvim-tree").setup {
          hijack_cursor = true,
          view = {
            width = 25
          },
          sync_root_with_cwd = true,
          respect_buf_cwd = true,
          update_focused_file = {
            enable = true,
            update_root = true
          },
        }
      end
    }

    -- -- nvim-tree
    -- use {
    --   "nvim-tree/nvim-tree.lua",
    --   wants = "nvim-web-devicons",
    --   cmd = { "NvimTreeToggle", "NvimTreeClose" },
    --   config = function()
    --     require("config.nvimtree").setup()
    --   end,
    -- }

    -- Buffer line
    use {
      "akinsho/nvim-bufferline.lua",
      -- event = "BufReadPre",
      requires = 'nvim-tree/nvim-web-devicons',
      config = function()
        require("config.bufferline").setup()
      end,
    }

    -- User interface
    use {
      "stevearc/dressing.nvim",
      event = "BufEnter",
      config = function()
        require("dressing").setup {
          select = {
            backend = { "telescope", "fzf", "builtin" },
          },
        }
      end,
      disable = false,
    }

    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
          patterns = { "build.sbt", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        }
      end,
    }

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        "nvim-telescope/telescope-project.nvim",
        "cljoly/telescope-repo.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "ahmedkhalf/project.nvim",
      },
      wants = {
        "plenary.nvim",
        "popup.nvim",
        "telescope-fzf-native.nvim",
        "telescope-project.nvim",
        "telescope-repo.nvim",
        "telescope-file-browser.nvim",
        "project.nvim",
      },
      config = function()
        require("config.telescope").setup()
      end,
      cmd = "Telescope",
      module = "telescope"
    }

    use "nvim-telescope/telescope-dap.nvim"

    -- Completion
    use {
      'ms-jpq/coq_nvim',
      branch = 'coq',
      event = "VimEnter",
      config = 'vim.cmd[[COQnow]]',
      enable = false
    }

    -- Auto pairs
    use {
      "windwp/nvim-autopairs",
      wants = "nvim-treesitter",
      module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
      config = function()
        require("config.autopairs").setup()
      end,
    }

    -- Auto tag
    use {
      "windwp/nvim-ts-autotag",
      wants = "nvim-treesitter",
      event = "InsertEnter",
      config = function()
        require("nvim-ts-autotag").setup { enable = true }
      end,
    }

    -- End wise
    use {
      "RRethy/nvim-treesitter-endwise",
      wants = "nvim-treesitter",
      event = "InsertEnter",
      disable = false,
    }
    --    -- Key map conflicts
    --    use { "lukhio/vim-mapping-conflicts" }

    -- Bootstrap Neovim
    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  -- Init and start packer
  packer_init()
  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
