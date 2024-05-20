local lapis = require("lapis")
-- local config = require("lapis.config").get()
local app = lapis.Application()
-- local util = require("lapis.util")

app:enable("etlua")

app.layout = require "views.layout"

-- directly render each etlua page
local render = function () return { render = true } end
app:get("home", "/", render)
app:get("about", "/about", render)
app:get("contact", "/contact", render)

return app
