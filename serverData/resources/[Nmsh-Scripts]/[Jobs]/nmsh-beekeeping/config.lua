HiveConfig = {
    --Script automatically splits this into %'s
    HiveObjects = {
        { hash = `gate_beehive`,   zOffset = 0.0 },
        { hash = `gate_beehive02`, zOffset = 0.0 },
        { hash = `gate_beehive03`, zOffset = 0.0 },
    },
    -- Bee Growing time in minutes
    GrowthTime = 2,
    -- Plant total lifetime (minutes) from planted -> destroyed
    LifeTime = 1560,
    -- How much faster does a harvest go with a queen
    QueenFactor = 5,
    -- Chance of getting a queen bee
    QueenChance = 3,
    -- Should having a queen remove hive on harvest?
    RemoveHiveWhenQueen = true,
    -- Percent at which the plant becomes harvestable
    HarvestPercent = 100.0,
    -- Time between plant harvests (minutes)
    TimeBetweenHarvest = 180,
    -- How often should the server update growth from DB, expensive (ms) Set to -1 to disable
    UpdateTimer = 10 * 60 * 1000, -- 10 minutes

    ------ ITEMS and INVENTORY ----------
    -- Bee Hive Item Name
    BeeHiveItem = "beehive",
    -- Bee Queen Item Name
    BeeQueenItem = "beequeen",
    -- Bee's Wax Item Name
    BeesWaxItem = "beeswax",
    -- Honey Item Name
    HoneyItem = "honey",
    -- PolyZone Script Name (ld-polyzone)
    PolyZone = "nmsh-zones",
    -- Your taskbar export
    Taskbar = "nmsh-taskbar",
    -- Your Inventory Export (for use nmsh-inventory or lj-inventory)
    Inventory = "nmsh-inventory",
    --------- TASKBAR -------
    -- Install Beehive (Taskbar)
    InstallBeehive = "Hive being placed",
    -- Add Queen Bee (Taskbar)
    AddQueenBee = "Queen Bee Adding",
    -- Remove Hive (Taskbar)
    RemoveHive = "Hive Removing",
    -- Harvest Hive (Taskbar)
    HarvestHive = "Gathering",
    ----- PolyZone Events ---
    PolyZoneEnter = "nmsh-zones:enter",
    PolyZoneExit = "nmsh-zones:leave",

}

-- Map material hash -> material type
MaterialHashes = {
    ["-461750719"] = true,
    ["930824497"] = true,
    ["-700658213"] = true,
    ["581794674"] = true,
    ["-2041329971"] = true,
    ["-309121453"] = true,
    ["-913351839"] = true,
    ["-1885547121"] = true,
    ["-1915425863"] = true,
    ["-1833527165"] = true,
    ["2128369009"] = true,
    ["-124769592"] = true,
    ["-840216541"] = true,
    ["-2073312001"] = true,
    ["627123000"] = true,
    ["1333033863"] = true,
    ["-1942898710"] = true,
    ["-1595148316"] = true,
    ["435688960"] = true,
    ["223086562"] = true,
    ["1109728704"] = true,
    ["-1286696947"] = true,
}

HiveZones = {
    -- x, y, z, radius
    { vector3(2330.37, -1920.2, 68.69), 316.6 },
    { vector3(-2649.89, 315.9, 173.11), 306.71 },
}

notify = function(msg)
    QBCore.Functions.Notify(msg)
end
