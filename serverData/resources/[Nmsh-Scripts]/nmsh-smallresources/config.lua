Config = {}
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use nmsh-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

-- To make this simple. Everything you need is in the config, except for discord, weapon drops, vehicle classes for cruise, hands up disabled keys, and recoil

Config.AFK = {
    ignoredGroups = {
        ['mod'] = true,
        ['admin'] = true,
        ['god'] = true
    },
    secondsUntilKick = 1800, -- AFK Kick Time Limit (in seconds)
    kickInCharMenu = false -- Set to true if you want to kick players for being AFK even when they are in the character menu.
}

Config.HandsUp = {
    command = 'hu',
    keybind = 'X',
}

Config.Binoculars = {
    fov_max = 70.0,
    fov_min = 5.0, -- max zoom level (smaller fov is more zoom)
    zoomspeed = 10.0, -- camera zoom speed
    speed_lr = 8.0, -- speed by which the camera pans left-right
    speed_ud = 8.0, -- speed by which the camera pans up-down
    storeBinoclarKey = 177
}

-- Whether to enable or disable dispatch services
Config.DispatchServices = {
    [1] = false, -- Police Vehicles
    [2] = false, -- Police Helicopters
    [3] = false, -- Fire Department Vehicles
    [4] = false, -- Swat Vehicles
    [5] = false, -- Ambulance Vehicles
    [6] = false, -- Police Motorcycles
    [7] = false, -- Police Backup
    [8] = false, -- Police Roadblocks
    [9] = false, -- PoliceAutomobileWaitPulledOver
    [10] = false, -- PoliceAutomobileWaitCruising
    [11] = false, -- Gang Members
    [12] = false, -- Swat Helicopters
    [13] = false, -- Police Boats
    [14] = false, -- Army Vehicles
    [15] = false, -- Biker Backup
}

-- Enable or disable the wanted level
Config.EnableWantedLevel = false

-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686
Config.Discord = {
    ["IsEnabled"] = false, -- If set to true, then discord rich presence will be enabled
    ["ApplicationId"] = '00000000000000000', -- The discord application id
    ["IconLarge"] = 'logo_name', -- The name of the large icon
    ["IconLargeHoverText"] = 'This is a Large icon with text', -- The hover text of the large icon
    ["IconSmall"] = 'small_logo_name', -- The name of the small icon
    ["IconSmallHoverText"] = 'This is a Small icon with text', -- The hover text of the small icon
    ["UpdateRate"] = 60000, -- How often the player count should be updated
    ["ShowPlayerCount"] = true, -- If set to true the player count will be displayed in the rich presence
    ["MaxPlayers"] = 48, -- Maximum amount of players
    ["Buttons"] = {
        {
            text = 'First Button!',
            url = 'fivem://connect/localhost:30120'
        },
        {
            text = 'Second Button!',
            url = 'fivem://connect/localhost:30120'
        }
    }
}

Config.Density = {
    ['parked'] = 0.8,
    ['vehicle'] = 0.8,
    ['multiplier'] = 0.8,
    ['peds'] = 0.8,
    ['scenario'] = 0.8,
}

Config.Stun = {
    active = false,
    min = 4000,
    max = 7000
}

Config.RemovePistolWhipping = true  -- Removes Pistol Whipping

Config.Cruise = 'mp/h'
Config.IdleCamera = true
Config.disableHandsupControls = {24, 25, 47, 58, 59, 63, 64, 71, 72, 75, 140, 141, 142, 143, 257, 263, 264}
Config.DisableAmbience = false -- Disabled distance sirens, distance car alarms, etc
Config.HarnessUses = 20
Config.DamageNeeded = 100.0 -- vehiclepush 0-1000
Config.EnableProne = false -- prone isnt recomended at this time
Config.MapText = "Server Name" -- This is the name / text shown above the map

Config.Disable = {
    disableHudComponents = {1, 2, 3, 4, 6, 7, 9, 13, 14, 19, 20, 21, 22}, -- Hud Components: https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    disableControls = {37}, -- Controls: https://docs.fivem.net/docs/game-references/controls/
    displayAmmo = true -- false disables ammo display
}

ConsumeablesEatSuperDonut = {
    ["superdonut"] = math.random(5, 30),
}

ConsumeablesSlushy = {
    ["redslushy"] = math.random(15, 25),
    ["orangeslushy"] = math.random(15, 25),
    ["blueslushy"] = math.random(15, 25),
    ["yellowslushy"] = math.random(15, 25),
    ["greenslushy"] = math.random(15, 25),
    ["rainbowslushy"] = math.random(15, 25),
}

ConsumeablesEatIceCream = {
    ["vanillaicecream"] = math.random(12, 20),
    ["chocolateicecream"] = math.random(12, 20),
    ["minticecream"] = math.random(15, 24),
    ["cookiesandcreamicecream"] = math.random(18, 26),
}

ConsumeablesEatGumBall = {
    ["bubblegum_gumball"] = math.random(6, 8),
    ["blueberry_gumball"] = math.random(6, 8),
    ["banana_gumball"] = math.random(6, 8),
    ["mint_gumball"] = math.random(6, 8),
    ["cherry_gumball"] = math.random(6, 8),
}

Config.ConsumablesEat = {
    ["sandwich"] = math.random(35, 54),
    ["chocolatebunny"] = math.random(35, 54),
    ["jellybeans"] = math.random(35, 54),
    ["mm"] = math.random(35, 54),
    ["tosti"] = math.random(40, 50),
    ["twerks_candy"] = math.random(35, 54),
    ["snikkel_candy"] = math.random(40, 50),
    ["marshy-aero"] = math.random(35, 54), 
    ["marshy-beanz"] = math.random(35, 54),     
    ["marshy-bourbon"] = math.random(35, 54),
    ["marshy-bubbaloo"] = math.random(35, 54),
    ["marshy-bueno"] = math.random(35, 54),
    ["marshy-chrunchie"] = math.random(35, 54),
    ["marshy-creame-egg"] = math.random(35, 54),
    ["marshy-crumpets"] = math.random(35, 54),    
    ["marshy-custard-cream"] = math.random(35, 54),
    ["marshy-dairymilk"] = math.random(35, 54),
    ["marshy-dibdabs"] = math.random(35, 54),
    ["marshy-digestive"] = math.random(35, 54),
    ["marshy-dunkers"] = math.random(35, 54),    
    ["marshy-flake"] = math.random(35, 54),
    ["marshy-wispa"] = math.random(35, 54),
    ["marshy-frazzles"] = math.random(35, 54),
    ["marshy-freddo"] = math.random(35, 54),
    ["marshy-fruit-tella"] = math.random(35, 54),
    ["marshy-hobnobs"] = math.random(35, 54),
    ["marshy-hula-hoops"] = math.random(35, 54),    
    ["marshy-jammy-dodger"] = math.random(35, 54),
    ["marshy-kipling"] = math.random(35, 54),
    ["marshy-kitkat"] = math.random(35, 54),
    ["marshy-kp-peanuts"] = math.random(35, 54),
    ["marshy-malteasers"] = math.random(35, 54),
    ["marshy-maoam-stripes"] = math.random(35, 54),
    ["marshy-marylands"] = math.random(35, 54),
    ["marshy-milkeybar"] = math.random(35, 54),
    ["marshy-milkeyway"] = math.random(35, 54),
    ["marshy-millions"] = math.random(35, 54),
    ["marshy-mini-rolls"] = math.random(35, 54),
    ["marshy-monstor-munch"] = math.random(35, 54),
    ["marshy-niknaks"] = math.random(35, 54),
    ["marshy-penguin"] = math.random(35, 54),    
    ["marshy-pom-bear"] = math.random(35, 54),
    ["marshy-pork-pie"] = math.random(35, 54),
    ["marshy-pot-noodle"] = math.random(35, 54),
    ["marshy-pudding"] = math.random(35, 54),
    ["marshy-quavers"] = math.random(35, 54),
    ["marshy-sensations"] = math.random(35, 54),
    ["marshy-skips"] = math.random(35, 54),
    ["marshy-skittles"] = math.random(35, 54),
    ["marshy-space-raiders"] = math.random(35, 54),    
    ["marshy-squashies"] = math.random(35, 54),
    ["marshy-starbursts"] = math.random(35, 54),
    ["marshy-tangfastics"] = math.random(35, 54),
    ["marshy-teacake"] = math.random(35, 54),
    ["marshy-timeout"] = math.random(35, 54),
    ["marshy-twirl"] = math.random(35, 54),
    ["marshy-wagonwheel"] = math.random(35, 54),
    ["marshy-walkers.cao"] = math.random(35, 54),
    ["marshy-walkers.rc"] = math.random(35, 54),    
    ["marshy-walkers.rs"] = math.random(35, 54),
    ["marshy-walkers.sav"] = math.random(35, 54),
    ["marshy-corner.bcf"] = math.random(35, 54),
    ["marshy-corner.s"] = math.random(35, 54),
    ["marshy-corner.vcb"] = math.random(35, 54),
    ["marshy-mccoys.fgs"] = math.random(35, 54),
    ["marshy-mccoys.salted"] = math.random(35, 54),    
    ["marshy-mccoys.sav"] = math.random(35, 54),
    ["marshy-mccoys.tsc"] = math.random(35, 54),
    ["marshy-dorito.classic"] = math.random(35, 54),
    ["marshy-dorito.coolranch"] = math.random(35, 54),
    ["marshy-dorito.flaming"] = math.random(35, 54),
    ["marshy-dorito.heatwave"] = math.random(35, 54),
    ["marshy-greggs.d"] = math.random(35, 54),
    ["marshy-greggs.sb"] = math.random(35, 54),
    ["marshy-greggs.sr"] = math.random(35, 54),
    ["marshy-marshmallow"] = math.random(35, 54),
    ["marshy-maxibon"] = math.random(35, 54),
    ["marshy-pringles.o"] = math.random(35, 54),
    ["marshy-pringles.sc"] = math.random(35, 54),
    ["marshy-starmix"] = math.random(35, 54),
    ["apple"] = math.random(10, 20),
    ["beef"] = math.random(35, 50),
    ["slicedpie"] = math.random(10, 20),
    ["corncob"] = math.random(25, 40),
    ["canofcorn"] = math.random(35, 50),
    ["grapes"] = math.random(10, 20),
    ["greenpepper"] = math.random(10, 20),
    ["chillypepper"] = math.random(10, 20),
    ["tomato"] = math.random(10, 20),
    ["tomatopaste"] = math.random(25, 40),
    ["cooked_bacon"] = math.random(35, 50),
    ["cooked_sausage"] = math.random(35, 50),
    ["cooked_pork"] = math.random(35, 50),
    ["cooked_ham"] = math.random(35, 50),
    --burgershot
    ["burger-bleeder"] = math.random(34, 54),
    ["burger-moneyshot"] = math.random(37, 56),
    ["burger-heartstopper"] = math.random(45, 65),
    ["burger-meatfree"] = math.random(30, 50),
    ["burger-torpedo"] = math.random(35, 52),
    ["burger-fries"] = math.random(15, 25),
    ["burger-chickennuggets"] = math.random(15, 25),
    ["burger-onionrings"] = math.random(15, 25),
    ["burger-icecream"] = math.random(7,10),
    ["burger-donut"] = math.random(6, 10),
    ["burger-donutchoc"] = math.random(6, 10),
    ["burger-donutcherry"] = math.random(6, 10),
    ["burger-donutlemon"] = math.random(6, 10),
    ["burger-donutglaze"] = math.random(6, 10),
    ["burger-creampie"] = math.random(6, 10),
    ["bdonut"] = math.random(50, 60),
    ["bbanana"] = math.random(50, 60),
    ["borange"] = math.random(50, 60),
    ["bapple"] = math.random(50, 60),
    ["bmuffin"] = math.random(50, 60),
    ["bchocolatemuffin"] = math.random(50, 60),
    ["bberrymuffin"] = math.random(50, 60),
}

Config.ConsumablesDrink = {
    ["water_bottle"] = math.random(35, 54),
    ["kurkakola"] = math.random(35, 54),
    ["coffee"] = math.random(40, 50),
    ["apple_juice"] = math.random(25, 45),
    ["grapejuice"] = math.random(25, 45),
    ["hotsauce"] = math.random(10, 15),
    ["barr-bubblegum"] = math.random(40, 50),
    ["barr-cherryade"] = math.random(40, 50),
    ["barr-cola"] = math.random(40, 50),
    ["barr-creamsoda"] = math.random(40, 50),
    ["barr-lemonade"] = math.random(40, 50),
    ["cadbury-hotchocolate"] = math.random(40, 50),
    ["calypso-lemonage"] = math.random(40, 50),
    ["calypso-oceanblue"] = math.random(40, 50),
    ["calypso-pineapplepeach"] = math.random(40, 50),
    ["calypso-pradisepunch"] = math.random(40, 50),
    ["calypso-strawberry"] = math.random(40, 50),
    ["calypso-tripleMelon"] = math.random(40, 50),
    ["coke-cherry"] = math.random(40, 50),
    ["coke-cinnamon"] = math.random(40, 50),
    ["coke-coffee"] = math.random(40, 50),
    ["coke-diet"] = math.random(40, 50),
    ["coke-mango"] = math.random(40, 50),
    ["coke-peach"] = math.random(40, 50),
    ["drpepper-cherry"] = math.random(40, 50),
    ["drpepper-cola"] = math.random(40, 50),
    ["drpepper-vanilla"] = math.random(40, 50),
    ["fanta-grape"] = math.random(40, 50),
    ["fanta-orange"] = math.random(40, 50),
    ["fanta-peach"] = math.random(40, 50),
    ["fanta-pineapple"] = math.random(40, 50),
    ["fanta-strawberry"] = math.random(40, 50),
    ["ka-blackgrape"] = math.random(40, 50),
    ["ka-fruitpunch"] = math.random(40, 50),
    ["ka-pineapple"] = math.random(40, 50),
    ["ka-strawberry"] = math.random(40, 50),
    ["ka-tropicalkrush"] = math.random(40, 50),
    ["kenco-americano"] = math.random(40, 50),
    ["kenco-cappaccino"] = math.random(40, 50),
    ["kenco-latte"] = math.random(40, 50),
    ["lucozade-apple"] = math.random(40, 50),
    ["lucozade-cherry"] = math.random(40, 50),
    ["lucozade-mango"] = math.random(40, 50),
    ["lucozade-orange"] = math.random(40, 50),
    ["marinda-orange"] = math.random(40, 50),
    ["marinda-strawberry"] = math.random(40, 50),
    ["oasis-blackcurrentapple"] = math.random(40, 50),
    ["oasis-citruspunch"] = math.random(40, 50),
    ["oasis-summerfruits"] = math.random(40, 50),
    ["prime-blueraspberry"] = math.random(40, 50),
    ["prime-grape"] = math.random(40, 50),
    ["prime-icepop"] = math.random(40, 50),
    ["prime-lemonlime"] = math.random(40, 50),
    ["prime-metamoon"] = math.random(40, 50),
    ["prime-orange"] = math.random(40, 50),
    ["ribena-pineapple"] = math.random(40, 50),
    ["ribena-raspberry"] = math.random(40, 50),
    ["ribena-strawberry"] = math.random(40, 50),
    ["rubicon-cherryraspberry"] = math.random(40, 50),
    ["rubicon-orangemango"] = math.random(40, 50),
    ["rubicon-strawberrykiwi"] = math.random(40, 50),
    ["vimto-orange"] = math.random(40, 50),
    ["vimto-orangePineapple"] = math.random(40, 50),
    ["vimto-original"] = math.random(40, 50),
    ["vimto-strawberry"] = math.random(40, 50),
    ["yazoo-banana"] = math.random(40, 50),
    ["yazoo-chocolate"] = math.random(40, 50),
    ["yazoo-strawberry"] = math.random(40, 50),
    ["yazoo-vanilla"] = math.random(40, 50),
    ["yorkshire-tea"] = math.random(40, 50),
    ["blemonslush"] = math.random(22, 32),
    ["borangeslush"] = math.random(22, 32),
    ["bsprite"] = math.random(22, 32),
    ["bcocacola"] = math.random(22, 32),
    ["bpepper"] = math.random(22, 32),
    ["bcloudcafe"] = math.random(22, 32),
    ["bstrawberrycreamfrappuccino"] = math.random(22, 32),
    ["bjavachipfrappuccino"] = math.random(22, 32),
    ["bhotchoc"] = math.random(22, 32),
    ["bcaramelfrappucino"] = math.random(22, 32),
    ["bhoneyhazelnutoatlatte"] = math.random(22, 32),
    ["bcoldbrewlatte"] = math.random(22, 32),
    ["bstrawberryvanillaoatlatte"] = math.random(22, 32),
    ["bicedcaffelatte"] = math.random(22, 32),
    ["bespresso"] = math.random(22, 32),
    ["bespressomacchiato"] = math.random(22, 32),
}

Config.ConsumablesAlcohol = {
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
}

-- Custom Consumables hand bones
-- 18905 left hand
-- 57005 right hand
Config.ConsumablesCustom = {
    -- ['newitem'] = {
    --     ['progress'] = {
    --         label = 'Using Item...',
    --         time = 5000
    --     },
    --     ['animation'] = {
    --         animDict = "amb@prop_human_bbq@male@base",
    --         anim = "base",
    --         flags = 8,
    --     },
    --     ['prop'] = {
    --         model = false,
    --         bone = false,
    --         coords = false, -- vector 3 format
    --         rotation = false, -- vector 3 format
    --     },
    --     ['replenish'] = {
    --         type = 'Hunger', -- replenish type 'Hunger'/'Thirst' / false
    --         replenish = math.random(20, 40),
    --         isAlcohol = false, -- if you want it to add alcohol count
    --         event = false, -- 'eventname' if you want it to trigger an outside event on use useful for drugs
    --         server = false -- if the event above is a server event
    --     }
    -- }
}

ConsumablesFireworks = {
    "firework1",
    "firework2",
    "firework3",
    "firework4"
}

Config.FireworkTime = 5 -- seconds before it goes off

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_AMBULANCE",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`SHAMAL`] = true,
    [`LUXOR`] = true,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`BUZZARD2`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`FIRETRUK`] = true,
    [`MULE`] = true,
    [`MAVERICK`] = true,
    [`BLIMP`] = true,
    [`AIRTUG`] = true,
    [`CAMPER`] = true,
    [`HYDRA`] = true,
    [`OPPRESSOR`] = true,
    [`technical3`] = false,
    [`insurgent3`] = true,
    [`apc`] = true,
    [`tampa3`] = true,
    [`trailersmall2`] = true,
    [`halftrack`] = true,
    [`hunter`] = true,
    [`vigilante`] = true,
    [`akula`] = true,
    [`barrage`] = true,
    [`khanjali`] = true,
    [`caracara`] = true,
    [`blimp3`] = true,
    [`menacer`] = true,
    [`oppressor2`] = true,
    [`scramjet`] = true,
    [`strikeforce`] = true,
    [`cerberus`] = true,
    [`cerberus2`] = true,
    [`cerberus3`] = true,
    [`scarab`] = true,
    [`scarab2`] = true,
    [`scarab3`] = true,
    [`rrocket`] = true,
    [`ruiner2`] = true,
    [`deluxo`] = true,
    [`cargoplane2`] = true,
    [`voltic2`] = true,
}

Config.BlacklistedWeapons = {
    [`WEAPON_RAILGUN`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.DisableVestDrawable = false -- Set to TRUE to disable the vest equipped when using heavy armor.
Config.HolsterVariant = {130,122,3,6,8}
Config.HolsterableWeapons = {
    --'WEAPON_STUNGUN',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_REVOLVER',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    --Custom Weapon
	'WEAPON_DE',
	'WEAPON_GLOCK17',
	'WEAPON_M9',
	'WEAPON_M1911',
	'WEAPON_FNX45',
	'WEAPON_GLOCK18C',
	'WEAPON_GLOCK22'
}

Config.Objects = { -- for object removal
    {coords = vector3(266.09,-349.35,44.74), heading = 0, length = 200, width = 200, model = "prop_sec_barier_02b"},
    {coords = vector3(285.28,-355.78,45.13), heading = 0, length = 200, width = 200, model = "prop_sec_barier_02a"},
}

-- You may add more than 2 selections and it will bring up a menu for the player to select which floor be sure to label each section though
Config.Teleports = {
    --Elevator @ labs
    [1] = {
        [1] = { -- up label
            ['poly'] = {
                coords = vector3(3540.74, 3675.59, 20.99),
                heading = 167.5,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = false -- set this to a string for a custom label or leave it false to keep the default

        },
        [2] = { -- down label
            ['poly'] = {
                coords = vector3(3540.74, 3675.59, 28.11),
                heading = 172.5,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = false
        },
        -- [3] = {
        --     ['poly'] = {
        --         coords = vector3(0.0, 0.0, 0.0),
        --         heading = 0.0,
        --         length = 0,
        --         width = 0
        --     },
        --     ["AllowVehicle"] = false,
        --     label = 'be sure to label all sections if more than 2'
        -- },
    },
    --Coke Processing Enter/Exit
    [2] = {
        [1] = {
            ['poly'] = {
                coords = vector3(909.49, -1589.22, 30.51),
                heading = 92.24,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = '[E] Enter Coke Processing'
        },
        [2] = {
            ['poly'] = {
                coords = vector3(1088.81, -3187.57, -38.99),
                heading = 181.7,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = '[E] Leave'
        }
    },
    --- Weedlab
    [3] = {
        [1] = {
            coords = vector4(1066.2, -3183.38, -39.16, 89.3),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit Lab'
        },
        [2] = {
            coords = vector4(-66.95, -1312.37, 29.28, 180.95),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Lab'
        },

    }
}

Config.DefaultPrice = 20 -- Default price for the carwash
Config.DirtLevel = 0.1 -- Threshold for the dirt level to be counted as dirty
Config.CarWash = { -- carwash
    [1] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(174.81, -1736.77, 28.87),
            length = 7.0,
            width = 8.8,
            heading = 359
        }
    },
    [2] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(25.2, -1391.98, 28.91),
            length = 6.6,
            width = 8.2,
            heading = 0
        }
    },
    [3] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(-74.27, 6427.72, 31.02),
            length = 9.4,
            width = 8,
            heading = 315
        }
    },
    [4] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(1362.69, 3591.81, 34.5),
            length = 6.4,
            width = 8,
            heading = 21
        }
    },
    [5] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(-699.84, -932.68, 18.59),
            length = 11.8,
            width = 5.2,
            heading = 0
        }
    }
}
