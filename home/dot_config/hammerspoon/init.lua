-- Use [Option+Q] to move mouse between different screens
hs.hotkey.bind({'option'}, 'Q', function()
    -- get current screen and calculate the center point of the next screen
    local screen = hs.mouse.getCurrentScreen()
    local nextScreen = screen:next()
    local rect = nextScreen:fullFrame()
    local center = hs.geometry.rectMidPoint(rect)
    -- move mouse cursor to the center of the next screen
    hs.mouse.absolutePosition(center)
    -- iterate through windows to find which one is under the cursor
    local windows = hs.window.orderedWindows()
    for _, win in ipairs(windows) do
        if win:isVisible() and win:isStandard() and win:screen() == nextScreen then
            local f = win:frame()
            if center.x >= f.x and center.x <= (f.x + f.w) and
               center.y >= f.y and center.y <= (f.y + f.h) then
                win:focus()
                break
            end
        end
    end
end)

-- Use [Option+W] to move window between different screens
hs.hotkey.bind({'option'}, 'W', function()
    -- get the focused window
    local win = hs.window.focusedWindow()
    -- get the screen where the focused window is displayed, a.k.a. current screen
    local screen = win:screen()
    -- compute the unitRect of the focused window relative to the current screen
    -- and move the window to the next screen setting the same unitRect
    win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
end)
