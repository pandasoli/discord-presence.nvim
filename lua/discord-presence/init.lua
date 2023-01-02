return {
  options = {
    -- Variables:
    --   @lang - current buffer code' language
    --   @filename - current buffer file' name
    --   @linenumber - current buffer' selected line' number
    --   @workspace - git projecte' name

    title = 'Lunar Vim',

    largeImage = '@lang',
    largeImage_text = 'Editing a @lang file',

    smallImage = '@lang',
    smallImage_text = '@lang',

    startTimeStamp_enable = true,
    viewRepo_enable = true,

    discord = {
      client_id = '1059272441194623126'
    },

    editing_text         = 'Editing @filename on line @linenumber',
    exploringFiles_text  = 'Expliring the project...',
    commiting_text       = 'Commiting changes...',
    managingPlugins_text = 'Managin plugins...',
    reading_text         = 'Reading @filename...',
    workspace_text       = 'Working on @workspace'
  },

  options_update = function(self, obj, new_obj)
    for name, value in pairs(new_obj) do
      obj[name] = value
    end

    return obj
  end,

  -- @param options set your prefer configuration
  setup = function(self, options)
    self.options = self:options_update(self.options, options)

  end
}

