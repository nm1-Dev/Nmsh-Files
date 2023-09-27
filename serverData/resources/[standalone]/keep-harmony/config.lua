Config = {} or Config

------------------------------------------------------------------
-- Config
------------------------------------------------------------------
-- 🧙‍♂️ keep-harmony
Config.MagicTouch = false
Config.use_progressbar = true
Config.framework = 'qb'             -- [qb / esx]
Config.inventory = 'qb-inventory' -- nmsh-inventory / ox_inventory
Config.target = 'qb-target'       -- nmsh-target / ox_target
Config.menu = 'ox_lib'              -- [keep-menu / nmsh-menu / ox_lib]
Config.input = 'ox_lib'             -- [keep-input / nmsh-input / ox_lib]
Config.notification = 'ox_lib'      -- [qb / esx / ox_lib / custom
Config.emote = 'dpemotes'           -- [dpemotes / rpemotes / scully_emotemenu]
Config.language = 'en'

-- This table allows for a direct connection to the configured resources. For instance,
-- if you are using a nmsh-inventory with a different name,
-- you need to update its name here to ensure it's gonna work correctly.
Config.resource_names = {
    framework = 'qb-core',
    inventory = 'nmsh-inventory',
    target = 'nmsh-target',
    menu = 'nmsh-menu',
    input = 'nmsh-input'
}
