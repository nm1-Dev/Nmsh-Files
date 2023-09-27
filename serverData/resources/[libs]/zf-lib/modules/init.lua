local debug_getinfo = debug.getinfo

zf = setmetatable({
    name = 'zf-lib',
    context = IsDuplicityVersion() and 'server' or 'client',
}, {
    __newindex = function(self, name, fn)
        rawset(self, name, fn)

        if debug_getinfo(2, 'S').short_src:find('@zf%-lib/modules') then
            exports(name, fn)
        end
    end
})

cache = {
    resource = zf.name,
    game = GetGameName(),
}

if GetResourceState('qb-core') == 'started' then
    zf.core = 'qb-core'
    Core = exports['qb-core']:GetCoreObject()
    RegisterNetEvent('QBCore:Client:UpdateObject', function()
        Core = exports['qb-core']:GetCoreObject()
    end)
elseif GetResourceState('es_extended') == 'started' then
    zf.core = 'esx'
    Core = ESX
end

if GetResourceState('ox_inventory') == 'started' then
    zf.inventory = 'ox'
elseif GetResourceState('nmsh-inventory') == 'started' then
    zf.inventory = 'qb'
elseif GetResourceState('ox_inventory') ~= 'started' and GetResourceState('es_extended') == 'started' then
    zf.inventory = 'esx'
end

function zf.hasLoaded() return true end
