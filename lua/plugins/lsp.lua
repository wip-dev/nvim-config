-- LSP SETUP --

local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format({ async = true, formatting_options = { insertSpaces = true } })
    end, { desc = 'Format current buffer with LSP' })

    nmap('<leader>f', vim.cmd.Format, '[F]ormat')
end

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


local mason_lspconfig = require 'mason-lspconfig'

local handlers = {
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,
    ["lua_ls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    },
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                }
            }
        }
    end,
    ["tailwindcss"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.tailwindcss.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "templ", "astro", "javascript", "typescript", "react" },
            init_options = { userLanguages = { templ = "html" } },
        })
    end,
    ["templ"] = function() -- default handler (optional)
        vim.filetype.add({ extension = { templ = "templ" } })
        require("lspconfig").templ.setup {
            on_attach = on_attach,
        }
    end,
}

mason_lspconfig.setup {
    ensure_installed = {
        "tsserver",
        "html",
        "gopls",
        "templ",
        "lua_ls",
        "tailwindcss",
    },
    handlers = handlers
}

-- local servers = {
--     tsserver = {},
--     html = {
--         format = {
--             templating = true,
--             wrapLineLength = 80,
--             wrapAttributes = "aligned-multiple",
--         }
--     },
--     gopls = {},
--     templ = {},
--     lua_ls = {
--         Lua = {
--             workspace = { checkThirdParty = false },
--             telemetry = { enable = false },
--         },
--     },
--     tailwindcss = {},
--     -- pyright = {},
--     -- htmx = {},
--     -- hls = {},
--     -- svelte = {},
--     -- clojure_lsp = {},
--     -- cssls = {},
--     -- r_language_server = {},
-- }

-- mason_lspconfig.setup_handlers {
--     function(server_name)
--         require('lspconfig')[server_name].setup {
--             capabilities = capabilities,
--             on_attach = on_attach,
--             settings = servers[server_name],
--         }
--     end,
-- }
