local framework = Framework()
local Core = GetCoreObject() -- framwork

--------------------------
--       Functions
--------------------------
-- if you're using a custom notification script modify this part
---@param msg any
---@param _type any
function NotifyClientSide(msg, _type, title)
    -- You can modify/customize the below code to execute any extra code you want based on the notification system used
    if Config.notification == "custom" then
        -- add your custom code here
        return
    end

    if Config.notification == "ox_lib" then if _type == "primary" then _type = "inform" end end

    if Config.notification ~= "ox_lib" then
        if framework == 1 then
            Core.Functions.Notify(msg, _type)
        elseif framework == 2 then
            if _type == "primary" then _type = "info" end
            TriggerEvent("esx:showNotification", msg, _type)
        end
    else
        if _type == "error" then
            lib.notify({
                title = title or "Unknown",
                description = msg,
                style = {
                    backgroundColor = "#141517",
                    color = "#909296"
                },
                icon = "ban",
                iconColor = "#C53030"
            })
        else
            lib.notify({
                title = title or "Unknown",
                description = msg,
                type = _type
            })
        end
    end
end

function CustomEmoteMenu()
    return {
        Play = function(name)
            -- example: exports["rpemotes"]:EmoteCommandStart(name)
        end,
        Stop = function()
            -- example: exports["rpemotes"]:EmoteCancel()
        end
    }
end
