require('presence'):setup {
  auto_update = true,
  enable_line_number = true,
  buttons = function(_, repo_url)
    return { { label = "Repository", url = repo_url } }
  end,
  editing_text = "File: %s",
  file_explorer_text = "Explorer: %s",
  workspace_text = "Workspace: %",
  line_number_text = "Line: %s / %s"
}
