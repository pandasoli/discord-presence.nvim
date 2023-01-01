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
      client_id = '1057146873208655882'
    },

    editing_text         = 'Editing @filename on line @linenumber',
    exploringFiles_text  = 'Expliring the project...',
    commiting_text       = 'Commiting changes...',
    managingPlugins_text = 'Managin plugins...',
    reading_text         = 'Reading @filename...',
    workspace_text       = 'Working on @workspace'
  },

  -- @param num if you reading this, you gay
  setup = function(self)

  end
}

