require("lspconfig")

require("plugins.lsp.lsp-installer")
local handlers = require("plugins.lsp.handlers")
handlers.setup()
require("plugins.lsp.settings.null-ls")
