local status_ok, vale = pcall(require, "vale")
if not status_ok then
  return
end

vale.setup({
  bin="/usr/local/bin/vale",
  vale_config_path="$HOME/.adshell/config/vale.ini",
})
