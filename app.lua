local lapis = require("lapis")
local app = lapis.Application()

app:enable("etlua")

app.layout = require "views.layout"

-- directly render each etlua page
local render = function () return { render = true } end
-- app:get("about", "/about", render)
app:get("contact", "/contact", render)
app:get("home", "/", render)

-- handle the contact form. poorly.
-- honestly it's just that not saving it would make me so annoyingly curious if it was clicked
app:post("api-contact", "/api/contact", function(self)
  local file = io.open("store/people_who_clicked_contact_i_guess", "a+" )
  if file and #self.params.email > 0 then
    file:write(os.date() .. '\t' .. self.params.email .. '\n')
    file:close()
  end

  return { status=204 }
end)

return app
