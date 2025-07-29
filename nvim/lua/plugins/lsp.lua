
local lspconfig = require('lspconfig')

ensure_installed = { "pyright", "ruff", "clangd", "gopls" }

-- Python: Pyright (типизация) + Ruff (линтер)
lspconfig.pyright.setup {
  settings = {
    pyright = { disableOrganizeImports = true },
    python = {
      analysis = {
        ignore = { '*' }, -- Полностью полагаемся на Ruff
      },
    },
  },
}

--lspconfig.ruff_lsp.setup {
 -- init_options = {
   -- settings = {
     -- args = {
   --     "--select=E,F,UP,N,I,ASYNC,S,PTH",
      --  "--line-length=88",
       -- "--respect-gitignore",
      --  "--target-version=py311"
     -- },
   -- },
 -- },
--}

lspconfig.ruff.setup({
  init_options = {
    settings = {
      args = {
        "--select=E,F,UP,N,I,ASYNC,S,PTH",
        "--line-length=79",
        "--respect-gitignore",
        "--target-version=py311"
      },
    },
  },
})

-- Go: Gopls (Go language server)
lspconfig.gopls.setup {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        nilness = true,
      },
      staticcheck = true,
    },
  },
}

-- C/C++: Clangd
lspconfig.clangd.setup {
  cmd = { "clangd", "--background-index" },
}

-- Rust (если понадобится)
-- lspconfig.rust_analyzer.setup {
--   settings = {
--     ["rust-analyzer"] = {},
--   },
-- }

-- Общие глобальные биндинги для LSP
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- Прикрепление LSP к буферу — настраиваем локальные биндинги
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>r', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
})

return {}
