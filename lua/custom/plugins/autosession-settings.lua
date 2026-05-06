-- https://github.com/rmagatti/auto-session
-- Disabled: existing session files reference SessionLoadPre group that
-- doesn't exist in current nvim, causing E216 on launch. Re-enable later
-- if sessions become useful.
return {
  'rmagatti/auto-session',
  enabled = false,
}
