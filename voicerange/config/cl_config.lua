WS = {}

WS.settings = {
    startRange = 8, -- default range
    drawTime = 200, -- time to draw the marker
    offset = { 
        -- no need to change these
        vehicle = -0.5,
        default = -1.2
    },
    smooth = 0.08, -- smooth transition between ranges
    rangeEvent = "SaltyChat_VoiceRangeChanged" -- first argument must be the range (eg. 8.0)
}

-- marker settings
WS.marker = {
    type = 1, 
    height = 2.0,
    color = {
        r = 9,
        g = 164,
        b = 241,
        t = 180
    },
    jump = false,
    rotate = false
}