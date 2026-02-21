local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local map = vim.keymap.set

  map("n", "<space>ll", "<cmd>Lspsaga finder<CR>", opts)                  -- 综合查找器
  map("n", "<space>ld", "<cmd>Lspsaga peek_definition<CR>", opts)         -- 预览定义
  map("n", "<space>lk", "<cmd>Lspsaga hover_doc<CR>", opts)               -- 悬浮文档
  map("n", "<space>li", "<cmd>Lspsaga implementation<CR>", opts)          -- 查找实现
  map("n", "<space>lk", "<cmd>Lspsaga signature_help<CR>", opts)          -- 签名帮助
  map("n", "<space>lt", "<cmd>Lspsaga peek_type_definition<CR>", opts)    -- 预览类型定义
  map("n", "<space>lr", "<cmd>Lspsaga rename<CR>", opts)                  -- 重命名
  map("n", "<space>la", "<cmd>Lspsaga code_action<CR>", opts)             -- 代码操作
  map("v", "<space>lA", "<cmd>Lspsaga range_code_action<CR>", opts)       -- 范围代码操作
  map("n", "<space>lp", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)   -- 显示行诊断
  map("n", "<space>lc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- 显示光标诊断
  map("n", "<space>[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)     -- 上一个诊断
  map("n", "<space>]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)     -- 下一个诊断
  map("n", "<space>lo", "<cmd>Lspsaga outline<CR>", opts)                 -- 大纲视图
  map("n", "<space>ls", "<cmd>Lspsaga symbol<CR>", opts)                  -- 文档符号
  map("n", "<space>lI", "<cmd>Lspsaga incoming_calls<CR>", opts)          -- 传入调用
  map("n", "<space>lO", "<cmd>Lspsaga outgoing_calls<CR>", opts)          -- 传出调用

  map("n", "<leader>Wa", vim.lsp.buf.add_workspace_folder, opts)
  map("n", "<leader>Wr", vim.lsp.buf.remove_workspace_folder, opts)
  map("n", "<leader>WL", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  map("n", "<space>lf", function() vim.lsp.buf.format { async = true } end, opts)
end

local function root_pattern(...)
  local patterns = { ... }
  return function()
    local cwd = vim.fn.getcwd()
    local root = vim.fs.dirname(vim.fs.find(patterns, { path = cwd, upward = true })[1])
    return root or cwd
  end
end

local function setup_lsp(server_config)
  vim.lsp.enable(server_config)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = server_config.filetypes,
    callback = function()
      local root = server_config.root_dir()
      if root then
        vim.lsp.start({
          name = server_config.name,
          cmd = server_config.cmd,
          root_dir = root,
          on_attach = server_config.on_attach,
          settings = server_config.settings,
        })
      end
    end,
  })
end

setup_lsp({
  name = "clangd",
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--offset-encoding=utf-8",
  },
  filetypes = { "c", "cpp", "cxx", "cc", "ixx" },
  root_dir = root_pattern("compile_commands.json", ".git", "CMakeLists.txt"),
  on_attach = on_attach,
})

setup_lsp({
  name = "pyright",
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_dir = root_pattern("pyproject.toml", "setup.py", ".git"),
  on_attach = on_attach,
  settings = {
    pyright = { autoImportCompletion = true },
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      }
    }
  }
})

setup_lsp({
  name = "lua_ls",
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_dir = root_pattern(".luarc.json", ".git"),
  on_attach = on_attach,
  settings = {
    lua_ls = { locale = "zh_cn" },
  }
})
