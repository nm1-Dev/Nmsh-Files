Config = Config or {}

Config.Job = 'beanmachine'     -- Name for the job that can access the target etc

Config.PolyZone = false        -- Want to view all the nmsh-target poly zones?

Config.UseBlips = true         -- Want to use blip on map?

Config.UseClothing = true      -- Want to use clothing in the job? DONT FORGET TO ADD THE EXPORT IF TRUE

Config.Target = 'nmsh-target'  -- Name of your target

Config.EatingDonutHunger = 9   -- How much hunger eating donut will give to the player?

Config.EatingFruitsHunger = 4  -- How much hunger eating fruits will give to the player?

Config.EatingMuffinsHunger = 5 -- How much hunger eating muffins will give to the player?

Config.DrinksThirstLevel = 6   -- How much thirs drinking will give to the playe?

Config.WashingHandsStress = 3  -- After player washes his hands how much stress will decreased ?

Config.MarkerDistance = 5      -- How much distance from the marker will the player be able to interact with the garage? more = more MS less = less MS

Config.BlipLocation = {
    { title = "Bean Machine", colour = 60, id = 214, x = 117.7108, y = -1035.878, z = 29.025907 }, -- Bean Machine Blip
}

Config.Locals = {

    --Targets

    SitTarget = {
        Label = "Sit",
        Icon = "fa fa-chair"
    },

    DutyTarget = {
        Label = "Duty",
        Icon = "fa fa-clock"
    },

    ClothingTarget = {
        Label = "Clothing",
        Icon = "fa fa-t-shirt"
    },

    ToastsTarget = {
        Label = "Grab Toast / Donut",
        Icon = "fa fa-hand-holding"
    },

    TrayTarget = {
        Label = "Open Tray",
        Icon = "fa fa-random"
    },

    FruitsTarget = {
        Label = "Grab Some Fruits",
        Icon = "fa fa-lemon"
    },

    MuffinsTarget = {
        Label = "Grab Muffins",
        Icon = "fa fa-cake-candles"
    },

    StashTarget = {
        Label = "Open Stash",
        Icon = "fa fa-box"
    },

    ShopTarget = {
        Label = "Open Shop",
        Icon = "fa fa-shop"
    },

    WashHandsTarget = {
        Label = "Wash Hands",
        Icon = "fa fa-hands-bubbles"
    },

    CupTarget = {
        Label = "Grab Cup",
        Icon = "fa fa-beer"
    },

    DrinksTarget = {
        Label = "Make Drinks",
        Icon = "fa fa-whiskey-glass"
    },

    SlushsTarget = {
        Label = "Make Slushs",
        Icon = "fa fa-whiskey-glass"
    },

    CoffeeTarget = {
        Label = "Make Coffee",
        Icon = "fa fa-coffee"
    },

    BeansTarget = {
        Label = "Grab Beans",
        Icon = "fa fa-align-left"
    },

    GlassesTarget = {
        Label = "Take Glasses",
        Icon = "fa fa-hand"
    },

    --Menus

    DutyMenu = {
        Header = "Clock In / Out",
        Txt = "Duty Options"
    },

    ToastsMenu = {
        Header = "Grab Toast",
        Txt = "Grab Some Toasts"
    },

    DonutsMenu = {
        Header = "Grab Donut",
        Txt = "Grab Some Donuts"
    },

    BananaFruitMenu = {
        Header = "Grab Banana",
        Txt = "Grab Some Bananas"
    },

    OrangeFruitMenu = {
        Header = "Grab Orange",
        Txt = "Grab Some Oranges"
    },

    AppleFruitMenu = {
        Header = "Grab Apple",
        Txt = "Grab Some Apples"
    },

    RegularMuffinMenu = {
        Header = "Grab Regular Muffin",
        Txt = "Grab Fresh Muffin"
    },

    ChocolateMuffinMenu = {
        Header = "Grab Chocolate Muffin",
        Txt = "Grab Fresh Chocolate Muffin"
    },

    BerryMuffinMenu = {
        Header = "Grab Berry Muffin",
        Txt = "Grab Fresh Berry Muffin"
    },

    --Progress Bars

    GrabDonutProgressBar = {
        Txt = "Grabing Donut...",
        Time = 2550
    },

    GrabToastProgressBar = {
        Txt = "Grabing Toast...",
        Time = 2550
    },

    GrabBananaProgressBar = {
        Txt = "Grabing Banana...",
        Time = 4550
    },

    GrabOrangeProgressBar = {
        Txt = "Grabing Orange...",
        Time = 4550
    },

    GrabAppleProgressBar = {
        Txt = "Grabing Apple...",
        Time = 4550
    },

    GrabRegularMuffinProgressBar = {
        Txt = "Grabing Muffin...",
        Time = 4550
    },

    GrabChocolateMuffinProgressBar = {
        Txt = "Grabing Chocolate Muffin...",
        Time = 4550
    },

    GrabBerryMuffinProgressBar = {
        Txt = "Grabing Berry Muffin...",
        Time = 4550
    },

    GrabBeansProgressBar = {
        Txt = "Grabing Beans...",
        Time = 2550
    },

    EatDonutProgressBar = {
        Txt = "Eating Donut...",
        Time = 3000
    },

    EatBananaProgressBar = {
        Txt = "Eating Banana...",
        Time = 3000
    },

    EatOrangeProgressBar = {
        Txt = "Eating Orange...",
        Time = 3000
    },

    EatAppleProgressBar = {
        Txt = "Eating Apple...",
        Time = 3000
    },

    EatMuffinProgressBar = {
        Txt = "Eating Muffin...",
        Time = 3000
    },

    EatChocolateMuffinProgressBar = {
        Txt = "Eating Chocolate Muffin...",
        Time = 3000
    },

    EatBerryMuffinProgressBar = {
        Txt = "Eating Berry Muffin...",
        Time = 3000
    },

    DrinkingProgressBar = {
        Txt = "Drinking...",
        Time = 5000
    },

    WashingHandsProgressBar = {
        Txt = "Washing Hands...",
        Time = 5000
    },

    CloudCafeProgressBar = {
        Txt = "Making Cloud Cafe...",
        Time = 5000
    },

    StrawberryCreamFrappuccinoProgressBar = {
        Txt = "Making Strawberry Cream Frappuccino...",
        Time = 5000
    },

    JavaChipFrappuccinoProgressBar = {
        Txt = "Making Java Chip Frappuccino...",
        Time = 5000
    },

    HotChocProgressBar = {
        Txt = "Making Hot Choc...",
        Time = 5000
    },

    HoneyHazelnutOatLatteProgressBar = {
        Txt = "Making Honey Hazelnut Oat Latte...",
        Time = 5000
    },

    IcedCaffeLatteProgressBar = {
        Txt = "Making Iced Caffe Latte...",
        Time = 5000
    },

    EspressoProgressBar = {
        Txt = "Making Espresso...",
        Time = 5000
    },

    EspressoMacchiatoProgressBar = {
        Txt = "Making Espresso Macchiato...",
        Time = 5000
    },

    CaramelFrappucinoProgressBar = {
        Txt = "Making Caramel Frappucino...",
        Time = 5000
    },

    ColdBrewLatteProgressBar = {
        Txt = "Making Cold Brew Latte...",
        Time = 5000
    },

    StrawberryVanillaOatLatteProgressBar = {
        Txt = "Making Strawberry Vanilla Oat Latte...",
        Time = 5000
    },
}


-- Items, no need to touch but you can if you want to
Config.Items = {

    ToastItem = 'tosti',

    DonutItem = 'bdonut',

    BananaItem = 'bbanana',

    OrangeItem = 'borange',

    AppleItem = 'bapple',

    RegularMuffinItem = 'bmuffin',

    ChocolateMuffinItem = 'bchocolatemuffin',

    BerryMuffinItem = 'bberrymuffin',

    SpriteItem = 'bsprite',

    CocacolaItem = 'bcocacola',

    DRPepperItem = 'bpepper',

    LemonSlushItem = 'blemonslush',

    OrangeSlushItem = 'borangeslush',

    CloudCafeItem = 'bcloudcafe',

    JavaChipFrappuccinoItem = 'bjavachipfrappuccino',

    HotChocItem = 'bhotchoc',

    HoneyHazelnutOatLatteItem = 'bhoneyhazelnutoatlatte',

    StrawberryCreamFrappuccinoItem = 'bstrawberrycreamfrappuccino',

    IcedCaffeLatteItem = 'bicedcaffelatte',

    EspressoItem = 'bespresso',

    EspressoMacchiatoItem = 'bespressomacchiato',

    CaramelFrappucinoItem = 'bcaramelfrappucino',

    ColdBrewlatteItem = 'bcoldbrewlatte',

    StrawberryVanillaOatLatteItem = 'bstrawberryvanillaoatlatte',
}


--Chairs Locations, no need to touch but you can if you want to
Config.Chairs = {
    [1] = {
        ['coords'] = vector3(117.7108, -1035.878, 29.025907),
        ['heading'] = 334.29165,
        ['minZ'] = 28.025907,
        ['maxZ'] = 30.025907,
        ['poly1'] = 0.5,
        ['poly2'] = 0.9,
    },
    [2] = {
        ['coords'] = vector3(119.05537, -1031.672, 29.025903),
        ['heading'] = 177.42919,
        ['minZ'] = 28.025903,
        ['maxZ'] = 30.025903,
        ['poly1'] = 0.5,
        ['poly2'] = 0.9,
    },
    [3] = {
        ['coords'] = vector3(117.01864, -1034.483, 29.019856),
        ['heading'] = 251.61872,
        ['minZ'] = 28.319856,
        ['maxZ'] = 30.319856,
        ['poly1'] = 0.5,
        ['poly2'] = 0.9,
    },
    [4] = {
        ['coords'] = vector3(117.39926, -1033.468, 29.025886),
        ['heading'] = 251.61872,
        ['minZ'] = 28.319856,
        ['maxZ'] = 30.319856,
        ['poly1'] = 0.5,
        ['poly2'] = 0.9,
    },
    [5] = {
        ['coords'] = vector3(117.68309, -1032.682, 29.019856),
        ['heading'] = 251.61872,
        ['minZ'] = 28.019856,
        ['maxZ'] = 30.019856,
        ['poly1'] = 0.5,
        ['poly2'] = 0.9,
    },
    [6] = {
        ['coords'] = vector3(120.57218, -1027.875, 29.019869),
        ['heading'] = 168.94943,
        ['minZ'] = 28.019869,
        ['maxZ'] = 30.019869,
        ['poly1'] = 0.5,
        ['poly2'] = 0.9,
    },
    [7] = {
        ['coords'] = vector3(119.14253, -1028.534, 29.025917),
        ['heading'] = 245.80203,
        ['minZ'] = 28.025917,
        ['maxZ'] = 30.025917,
        ['poly1'] = 0.5,
        ['poly2'] = 0.9,
    },
    [8] = {
        ['coords'] = vector3(113.50877, -1044.319, 28.647136),
        ['heading'] = 258.64385,
        ['minZ'] = 27.647136,
        ['maxZ'] = 29.647136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.9,
    },
    [9] = {
        ['coords'] = vector3(114.16321, -1046.296, 28.666271),
        ['heading'] = 331.53128,
        ['minZ'] = 27.671092,
        ['maxZ'] = 29.671092,
        ['poly1'] = 0.9,
        ['poly2'] = 0.9,
    },
    [10] = {
        ['coords'] = vector3(116.21788, -1047.08, 29.247136),
        ['heading'] = 324.69653,
        ['minZ'] = 28.207136,
        ['maxZ'] = 30.207136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.5,
    },
    [11] = {
        ['coords'] = vector3(117.83643, -1047.695, 29.247136),
        ['heading'] = 358.16018,
        ['minZ'] = 28.207136,
        ['maxZ'] = 30.207136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.5,
    },
    [12] = {
        ['coords'] = vector3(121.70889, -1048.686, 29.275979),
        ['heading'] = 47.79597,
        ['minZ'] = 28.207136,
        ['maxZ'] = 30.207136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.5,
    },
    [13] = {
        ['coords'] = vector3(122.42322, -1046.89, 29.275979),
        ['heading'] = 84.449356,
        ['minZ'] = 28.207136,
        ['maxZ'] = 30.207136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.5,
    },
    [14] = {
        ['coords'] = vector3(119.86777, -1044.923, 29.275979),
        ['heading'] = 338.54705,
        ['minZ'] = 28.207136,
        ['maxZ'] = 30.207136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.5,
    },
    [15] = {
        ['coords'] = vector3(118.69061, -1043.994, 29.275979),
        ['heading'] = 303.57736,
        ['minZ'] = 28.207136,
        ['maxZ'] = 30.207136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.5,
    },
    [16] = {
        ['coords'] = vector3(118.77394, -1042.744, 29.275979),
        ['heading'] = 233.33184,
        ['minZ'] = 28.207136,
        ['maxZ'] = 30.207136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.5,
    },
    [17] = {
        ['coords'] = vector3(119.0999, -1041.688, 29.275979),
        ['heading'] = 248.98132,
        ['minZ'] = 28.207136,
        ['maxZ'] = 30.207136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.5,
    },
    [18] = {
        ['coords'] = vector3(121.74997, -1034.403, 29.275979),
        ['heading'] = 251.95288,
        ['minZ'] = 28.207136,
        ['maxZ'] = 30.207136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.5,
    },
    [19] = {
        ['coords'] = vector3(122.12214, -1033.403, 29.275979),
        ['heading'] = 249.78028,
        ['minZ'] = 28.207136,
        ['maxZ'] = 30.207136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.5,
    },
    [20] = {
        ['coords'] = vector3(123.01651, -1032.385, 29.275979),
        ['heading'] = 207.85884,
        ['minZ'] = 28.207136,
        ['maxZ'] = 30.207136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.5,
    },
    [21] = {
        ['coords'] = vector3(124.42607, -1032.434, 29.275979),
        ['heading'] = 155.90852,
        ['minZ'] = 28.207136,
        ['maxZ'] = 30.207136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.5,
    },
    [22] = {
        ['coords'] = vector3(125.13561, -1029.095, 29.275979),
        ['heading'] = 172.23358,
        ['minZ'] = 28.207136,
        ['maxZ'] = 30.207136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.5,
    },
    [23] = {
        ['coords'] = vector3(123.59667, -1028.71, 29.275979),
        ['heading'] = 163.29846,
        ['minZ'] = 28.207136,
        ['maxZ'] = 30.207136,
        ['poly1'] = 0.5,
        ['poly2'] = 0.5,
    },
}

Config.CupsLocations = {
    [1] = {
        ['coords'] = vector3(122.70806, -1042.337, 29.272323),
        ['heading'] = 342.10079,
        ['minZ'] = 28.272323,
        ['maxZ'] = 30.272323,
    },
    [2] = {
        ['coords'] = vector3(125.61674, -1036.455, 28.902566),
        ['heading'] = 342.10079,
        ['minZ'] = 28.272323,
        ['maxZ'] = 30.272323,
    },
}

--Coffee Locations, these are the locations where the coffee is made.
Config.CoffeeLocations = {
    [1] = {
        ['coords'] = vector3(122.84719, -1041.647, 29.279977),
        ['heading'] = 249.3034,
        ['minZ'] = 29.18199,
        ['maxZ'] = 39.38199,
        ['firstmenu'] = true,
        ['secondmenu'] = false,
    },
    [2] = {
        ['coords'] = vector3(124.60155, -1036.899, 29.279977),
        ['heading'] = 249.3034,
        ['minZ'] = 29.18199,
        ['maxZ'] = 39.38199,
        ['firstmenu'] = false,
        ['secondmenu'] = true,
    },
}


--Shop items, these are the items that the player can buy.
Config.ShopItems = {
    label = "Shop",
    slots = 5,
    items = {
        [1] = {
            name = "twerks_candy",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "snikkel_candy",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "water_bottle",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "kurkakola",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "bmenu",
            price = 0,
            amount = 100,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "bstrawberry",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "bhoney",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "bmilk",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "bcream",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "bice",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "bcaramelsyrup",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "bhotchocolatepowder",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 12,
        },
    }
}

--Vehicles, you can add as many as you like.
Config.Vehicles = {
    [1] = {
        ['vehiclename'] = "Truck", -- Name
        ['vehicle'] = "mule6",     -- Model To Spawn
        ['price'] = 5500,          -- Price
    },
    [2] = {
        ['vehiclename'] = "Pony", -- Name
        ['vehicle'] = "pony",     -- Model To Spawn
        ['price'] = 2500,         -- Price
    },
}

--Regular Cups for cold drinks.
Config.Cups = {
    [1] = {
        ['cupname'] = "Regular Cup",
        ['cup'] = "bregularcup",
    },
}

--Lemon Slush.
Config.LemonSlushs = {
    [1] = {
        ['slushname'] = "Lemon Slush",
        ['cupsize'] = 'bregularcup',
        ['cupname'] = 'Regular Cup',
        ['slush'] = "blemonslush",
    },
}

--Orange Slush.
Config.OrangeSlushs = {
    [1] = {
        ['slushname'] = "Orange Slush",
        ['cupsize'] = 'bregularcup',
        ['cupname'] = 'Regular Cup',
        ['slush'] = "borangeslush",
    },
}

Config.ColdDrinks = {
    [1] = {
        ['drinkname'] = "Sprite",
        ['cupsize'] = "Regular Cup",
        ['cupneeded'] = "bregularcup",
        ['catagory'] = "• Sprite",
        ['drink'] = "bsprite",
    },
    [2] = {
        ['drinkname'] = "CocaCola",
        ['cupsize'] = "Regular Cup",
        ['cupneeded'] = "bregularcup",
        ['catagory'] = "• CocaCola",
        ['drink'] = "bcocacola",
    },
    [3] = {
        ['drinkname'] = "DR.Pepper",
        ['cupsize'] = "Regular Cup",
        ['cupneeded'] = "bregularcup",
        ['catagory'] = "• DR.Pepper",
        ['drink'] = "bpepper",
    },
}

Config.Glasses = {
    [1] = {
        ['glass'] = 'bhighcoffeeglasscup',
        ['glassname'] = 'High Coffee Glass',
        ['image'] = "<img src=https://cdn.discordapp.com/attachments/926465631770005514/963851739767930890/bhighcoffeeglasscup.png width=30px>",
        ['price'] = 0,
    },
    [2] = {
        ['glass'] = 'bcoffeeglass',
        ['glassname'] = 'Coffee Glass',
        ['image'] = "<img src=https://cdn.discordapp.com/attachments/926465631770005514/963851731794526218/bcoffeeglass.png width=30px>",
        ['price'] = 0,
    },
    [3] = {
        ['glass'] = 'bespressocoffeecup',
        ['glassname'] = 'Espresso Coffee Cup',
        ['image'] = "<img src=https://cdn.discordapp.com/attachments/926465631770005514/963851746076131378/bexpressocoffeecup.png  width=30px>",
        ['price'] = 0,
    },
}

Config.Beans = {
    [1] = {
        ['beanname'] = "Coffee Beans",
        ['beanimage'] = "<img src=https://cdn.discordapp.com/attachments/930069494066475008/939123696830935050/coffee-bean.png width=30px>",
        ['bean'] = 'bcoffeebeans',
    },
}
