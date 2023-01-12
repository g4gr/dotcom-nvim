local status, mason = pcall(require, 'mason')
if (not status) then return end


local status2, lspconfig = pcall(require, 'mason-lspconfig')
if (not status2) then return end

mason.setup {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    lspconfig.setup {
        ensure_installed = {
            'html',
            'cssls',
            'quick_lint_js',
            'tsserver',
            'emmet_ls',
            'eslint',
            'graphql',
            'jsonls',
            'sumneko_lua',

        }
    },
    automatic_installation = true
}
