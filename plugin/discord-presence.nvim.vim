" Fallback to setting up the plugin automatically
if !exists('g:discord_presence_has_setup')
  lua << EOF
    local DiscordPresence = require('discord-presence.nvim'):setup()
    DiscordPresence.logs:info('Custom setup not detected, using defaults')
EOF
endif
