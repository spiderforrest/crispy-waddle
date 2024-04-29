local lapis = require("lapis")
-- local config = require("lapis.config").get()
local app = lapis.Application()
-- local util = require("lapis.util")
app:enable("etlua")

 app:get("index", "/", function()
  return { render = true }
end)

return app
