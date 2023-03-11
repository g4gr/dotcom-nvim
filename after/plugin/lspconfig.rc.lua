local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    -- formatting
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.formatting_seq_sync() end
        })
    end
end

protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.flow.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●',
        source = "if_many",
    },
    float = {
        source = "if_many", -- Or "if_many"
    },
    underline = true,
})





-- Server configs

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    iflags = lsp_flags,
    filetypes = {
        "js",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    },
    cmd = {
        "typescript-language-server",
        "--stdio"
    },
    init_options = {
        hostInfo = "neovim"
    },
    --root_dir = r
}


nvim_lsp.cssls.setup {
    on_attach = on_attach,
    filetypes = {
        "css",
        "scss",
        "less"
    },
    cmd = {
        "vscode-css-language-server",
        "--stdio"
    },
    settings = {
        css = {
            validate = true
        },
        less = {
            validate = true
        },
        scss = {
            validate = true
        }
    },
    single_file_support = true,
}

nvim_lsp.emmet_ls.setup {
    on_attach = on_attach,
    cmd = {
        "emmet-ls",
        "--stdio"
    },
    filetypes = {
        "html",
        "css",
        "sass",
        "scss",
        "less"
    },
    single_file_support = true,

}

nvim_lsp.graphql.setup {
    cmd = {
        "graphql-lsp",
        "server", "-m",
        "stream"
    },
    filetypes = {
        "graphql",
        "typescriptreact",
        "javascriptreact"
    },

}

nvim_lsp.html.setup {
    cmd = {
        "vscode-html-language-server",
        "--stdio"
    },
    filetype = {
        "html"
    },
    init_options = {
        configurationSection = {
            "html",
            "css",
            "javascript"
        },
        embeddedLanguages = {
            html = true,
            css = true,
            javascript = true
        },
        provideFormatter = true,
        settings = {},
        single_file_support = true
    },

}

nvim_lsp.jsonls.setup {
    capabilities = capabilities,
    cmd = {
        "vscode-json-language-server",
        "--stdio"
    },
    filetypes = {
        "json",
        "jsonc"
    },
    init_options = {
        provideFormatter = true
    },
    single_file_support = true
}

nvim_lsp.sqlls.setup {
    cmd = {
        "sql-language-server",
        "up",
        "--method",
        "stdio"
    },
    filetypes = {
        "sql",
        "mysql"
    },
    settings = {}
}

nvim_lsp.stylelint_lsp.setup {
    cmd = {
        "stylelint-lsp",
        "--stdio"
    },
    filetype = {
        "css",
        "less",
        "scss",
        "sugarss",
        "vue",
        "wxss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact"
    },
    settings = {}
}
