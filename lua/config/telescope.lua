require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {},
  extensions = {}
}

require('telescope').load_extension('textcase')

require('telescope-alternate').setup({
  mappings = {
    { 'app/services/(.*)_services/(.*).rb', { -- alternate from services to contracts / models
      { 'app/contracts/[1]_contracts/[2].rb', 'Contract' }, -- Adding label to switch
      { 'app/models/**/*[1].rb', 'Model', true }, -- Ignore create entry (with true)
    } },
    { 'app/contracts/(.*)_contracts/(.*).rb', { { 'app/services/[1]_services/[2].rb', 'Service' } } }, -- from contracts to services
    -- Search anything on helper folder that contains pluralize version of model.
    --Example: app/models/user.rb -> app/helpers/foo/bar/my_users_helper.rb
    { 'app/models/(.*).rb', { { 'db/helpers/**/*[1:pluralize]*.rb', 'Helper' } } },
    { 'app/**/*.rb', { { 'spec/[1].rb', 'Test' } } }, -- Alternate between file and test
  },
  presets = { 'rails' }, -- Telescope pre-defined mapping presets
  transformers = { }
})

require('telescope').load_extension('telescope-alternate')
