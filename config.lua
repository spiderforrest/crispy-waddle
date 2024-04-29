local config = require("lapis.config")

config("development", {
  server = "nginx",
  code_cache = "off",
  port = 3000,
  num_workers = "1",
  session_name = "sesshh",
  secret = "secrmemt!!"
})
