-- Drag-and-drop file support for WezTerm on WSL2
-- WezTerm pastes file paths as text on drag-and-drop.
-- This intercepts pasted Windows paths, converts them via wslpath,
-- and opens them in Oil (directories) or :edit (files).

return {
  dir = ".",
  name = "wsl-drop",
  event = "VeryLazy",
  cond = vim.fn.has("wsl") == 1,
  config = function()
    local original_paste = vim.paste

    vim.paste = function(lines, phase)
      -- Only intercept single-line pastes that look like Windows paths
      if #lines == 1 then
        local win_path = lines[1]
        -- Strip surrounding quotes first (WezTerm quote_dropped_files = "Posix")
        win_path = win_path:gsub("^'(.*)'$", "%1")
        win_path = win_path:gsub('^"(.*)"$', "%1")

        if not win_path:match("^[A-Za-z]:\\") then
          return original_paste(lines, phase)
        end

        local wsl_path = vim.fn.system("wslpath -u " .. vim.fn.shellescape(win_path))
        wsl_path = wsl_path:gsub("\n$", "")

        if vim.v.shell_error ~= 0 then
          return original_paste(lines, phase)
        end

        -- Schedule to avoid issues with paste context
        vim.schedule(function()
          if vim.fn.isdirectory(wsl_path) == 1 then
            require("oil").open(wsl_path)
          elseif vim.fn.filereadable(wsl_path) == 1 then
            vim.cmd("edit " .. vim.fn.fnameescape(wsl_path))
          else
            vim.notify("Dropped path not found: " .. wsl_path, vim.log.levels.WARN)
          end
        end)

        return true
      end

      return original_paste(lines, phase)
    end
  end,
}
