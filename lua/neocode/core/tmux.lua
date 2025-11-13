-- NeoCode tmux integration module
-- Provides functions to control tmux from Neovim

local M = {}

-- Check if running inside tmux
function M.is_tmux()
  return vim.env.TMUX ~= nil
end

-- Execute a tmux command
function M.exec(cmd)
  if not M.is_tmux() then
    vim.notify("NeoCode: Not running inside tmux", vim.log.levels.WARN)
    return false
  end
  
  local result = vim.fn.system("tmux " .. cmd)
  if vim.v.shell_error ~= 0 then
    vim.notify("NeoCode tmux error: " .. result, vim.log.levels.ERROR)
    return false
  end
  
  return true, result
end

-- Split tmux pane
-- direction: "vertical" or "horizontal"
-- size: percentage (optional)
function M.split_pane(direction, size)
  local cmd
  if direction == "vertical" then
    cmd = "split-window -h"
  elseif direction == "horizontal" then
    cmd = "split-window -v"
  else
    vim.notify("NeoCode: Invalid split direction: " .. direction, vim.log.levels.ERROR)
    return false
  end
  
  if size then
    cmd = cmd .. " -p " .. size
  end
  
  -- Add current working directory
  cmd = cmd .. " -c '" .. vim.fn.getcwd() .. "'"
  
  return M.exec(cmd)
end

-- Open terminal in new tmux pane
function M.open_terminal(direction, size)
  return M.split_pane(direction or "horizontal", size or 30)
end

-- Kill current tmux pane
function M.kill_pane()
  return M.exec("kill-pane")
end

-- Resize tmux pane
-- direction: "left", "right", "up", "down"
-- amount: number of cells
function M.resize_pane(direction, amount)
  local dir_map = {
    left = "L",
    right = "R",
    up = "U",
    down = "D"
  }
  
  local dir_flag = dir_map[direction]
  if not dir_flag then
    vim.notify("NeoCode: Invalid resize direction: " .. direction, vim.log.levels.ERROR)
    return false
  end
  
  return M.exec("resize-pane -" .. dir_flag .. " " .. (amount or 5))
end

-- Select pane by direction
-- direction: "left", "right", "up", "down"
function M.select_pane(direction)
  local dir_map = {
    left = "L",
    right = "R",
    up = "U",
    down = "D"
  }
  
  local dir_flag = dir_map[direction]
  if not dir_flag then
    vim.notify("NeoCode: Invalid pane direction: " .. direction, vim.log.levels.ERROR)
    return false
  end
  
  return M.exec("select-pane -" .. dir_flag)
end

-- Create new tmux window
function M.new_window(name)
  local cmd = "new-window"
  if name then
    cmd = cmd .. " -n '" .. name .. "'"
  end
  
  -- Add current working directory
  cmd = cmd .. " -c '" .. vim.fn.getcwd() .. "'"
  
  return M.exec(cmd)
end

-- Kill current tmux window
function M.kill_window()
  return M.exec("kill-window")
end

-- Rename current tmux window
function M.rename_window(name)
  if not name or name == "" then
    vim.notify("NeoCode: Window name cannot be empty", vim.log.levels.ERROR)
    return false
  end
  
  return M.exec("rename-window '" .. name .. "'")
end

-- Get tmux session name
function M.get_session_name()
  if not M.is_tmux() then
    return nil
  end
  
  local success, result = M.exec("display-message -p '#S'")
  if success then
    return vim.trim(result)
  end
  
  return nil
end

-- Send keys to tmux pane
function M.send_keys(keys, pane)
  local cmd = "send-keys"
  if pane then
    cmd = cmd .. " -t " .. pane
  end
  cmd = cmd .. " '" .. keys .. "'"
  
  return M.exec(cmd)
end

-- Zoom/unzoom current pane
function M.toggle_zoom()
  return M.exec("resize-pane -Z")
end

return M
