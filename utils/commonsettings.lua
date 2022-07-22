local awful = require("awful")

local centered_medium_client = {
  geometry = { width = 1000, height = 720 },
  placement = awful.placement.centered
}

return {
  centered_medium_client = centered_medium_client
}

