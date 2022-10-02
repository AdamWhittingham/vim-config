local diffview_ok, diffview = pcall(require, "diffview")
if not diffview_ok then
  return
end

diffview.setup({
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  view = {
    merge_tool = {
      layout = "diff3_mixed",
      disable_diagnostics = true,   -- Temporarily disable diagnostics for conflict buffers while in the view.
    },
  },
})
