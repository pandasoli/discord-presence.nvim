local logs = require 'logs'

local discordPresence = {
  discordRPC = require 'discordRPC',
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

    self.discordRPC.initialize(
      self.discord.client_id,
      true
    )

    vim.fn['discordPresence#SetAutoCmds']()

    logs.info('completed plugin setup')
    return self
  end,

  cancel = function(self)
    self.discordRPC.updatePresence(nil)
    self.discordRPC.runCallbacks()
  end,

  update = function(self)
    local presence = {
      state = "Looking to Play",
      details = "1v1 (Ranked)",
      startTimestamp = 0,
      endTimestamp = 0 + 60,
      partyId = "party id",
      partyMax = 2,
      matchSecret = "match secret",
      joinSecret = "join secret",
      spectateSecret = "spectate secret"
    }

    self.discordRPC.updatePresence(presence)
    self.discordRPC.runCallbacks()
  end,

  on_win_enter = function(self)
    logs:info('doing WinEnter event...')

    vim.schedule(
      function()
        self:update()
      end
    )
  end,

  on_win_leave = function(self)
    logs.info('donig WinLeave event...')

    local current_window = vim.api.nvim_get_current_win()

    vim.schedule(
      function()
        -- Avoid canceling presence when switching between windows
        if current_window ~= vim.api.nvim_get_current_win() then
          logs.info('Not canceling presence due to switching to a window within the same instance...')
          return
        end

        logs.info('canceling presence due to leaving window...')
        self:cancel()
      end
    )
  end
}


return discordPresence
