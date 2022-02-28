local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

local function hextime()
    local time = os.date("%H:%M")
    local h,m = time.match('(%d+):(%d+)')
    return string.format("%02x:%02x", tonumber(h), tonumber(m))
end

local hex_clock = {}

local function worker()
    local font = beatiful.font
    local color = beatiful.fg_normal

    hex_clock = wibox.widget {
        {
            id = 'clock',
            font = font,
            widget = wibox.widget.textbox,
        },
        layout = wibox.layout.align.horizontal,
    }

    gears.timer {
        timeout   = 1,
        call_now  = true,
        autostart = true,
        callback  = function()
            hex_clock:set_text(hextime())
        end
    }
    return hex_clock
end

return setmetatable(hex_clock, { __call = function(_, ...)
    return worker(...)
end })
