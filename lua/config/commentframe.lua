local M = {}

function M.setup()
  local status_ok, commentframe = pcall(require, "CommentFrame")
  if not status_ok then
    return
  end  
  commentframe.setup {}
end

return M
