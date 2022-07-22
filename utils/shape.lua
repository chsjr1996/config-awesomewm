local gears = require("gears")

local radius = 15

function rounded_shape(cr,w,h)
    gears.shape.rounded_rect(cr,w,h,radius)
end

return {
    rounded_shape = rounded_shape
}

