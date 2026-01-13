return {
  settings = {
    yamlls = {
      cmd = { 'yaml-language-server', '--stdio' },
      schemaStore = {
        enable = true,
        url = "", -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
      },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
}
