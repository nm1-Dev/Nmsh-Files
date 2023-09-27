----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- START GAME --<!>--
local function StartGame(callback, chips, timer)
    Callback = callback
    SendNUIMessage({
        open = true,
        chipsneeded = chips,
        timer = timer,
    })
    SetNuiFocus(true, true)
end
--<!>-- START GAME --<!>--

--<!>-- COUNTER CALLBACK --<!>--
RegisterNUICallback('CounterCallback', function(data, cb)
    SetNuiFocus(false, false)
    Callback(data.success)
    SendNUIMessage({open = false})
    cb('ok')
end)
--<!>-- COUNTER CALLBACK --<!>--

--<!>-- CLOSE GAME --<!>--
RegisterNUICallback('CloseGame', function(data, cb)
    SetNuiFocus(false, false)
    Callback(data.success)
    SendNUIMessage({open = false})
    cb('ok')
end)
--<!>-- CLOSE GAME --<!>--

--<!>-- EXPORT --<!>--
exports('StartGame', StartGame)
--<!>-- EXPORT --<!>--

--<!>-- TEST EVENTS/COMMANDS THESE CAN BE DELETED --<!>--
-- Command to test game
RegisterCommand('chiphack:test', function()
    exports['boii-chiphack']:StartGame(function(success)
        if success then
            -- do something
            print('hack successful')
        else
            -- do something
            print('hack failed')
        end
    end, 5, 60) -- API: Amount of chips to find, Amount of time allowed in secs
end)
--<!>-- TEST EVENTS/COMMANDS THESE CAN BE DELETED --<!>--
