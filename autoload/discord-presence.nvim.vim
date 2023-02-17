" Define autocommands to handle auto-update events
function discordPresence#SetAutoCmds()
  augroup discord_presence_events
    autocmd!
    if exists('g:discord_presence_auto_update') && g:discord_presence_auto_update
      " autocmd FocusGained * lua package.loaded.presence:handle_focus_gained()
      " autocmd TextChanged * lua package.loaded.presence:handle_text_changed()
      " autocmd VimLeavePre * lua package.loaded.presence:handle_vim_leave_pre()
      autocmd WinEnter * lua package.loaded.discordPresence:on_win_enter()
      autocmd WinLeave * lua package.loaded.discordPresence:on_win_leave()
      " autocmd BufEnter * lua package.loaded.presence:handle_buf_enter()
      " autocmd BufAdd * lua package.loaded.presence:handle_buf_add()
    endif
  augroup END
endfunction
