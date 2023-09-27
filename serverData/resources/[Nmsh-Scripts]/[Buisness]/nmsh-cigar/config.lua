Config = {
    Debug = false,
    Core = 'qb-core',
    Target = 'nmsh-target',
    Menu = 'nmsh-menu',
    Input = 'nmsh-input',
}

Config.WeedPlantModel = "prop_weed_01"
Config.WeedLeafItem = "tobacco_leaf"
Config.WeedSettings = {
    PolyZone = {
        vector2(1011.0370483398, 4289.611328125),
        vector2(1014.3662109375, 4292.6020507812),
        vector2(1032.2800292969, 4230.6000976562),
        vector2(1042.2911376953, 4200.4516601562),
        vector2(1068.1188964844, 4204.7124023438),
        vector2(1089.7907714844, 4218.4482421875),
        vector2(1101.9893798828, 4239.9560546875),
        vector2(1102.5252685547, 4263.9638671875),
        vector2(1085.7622070312, 4290.30859375),
        vector2(1081.0539550781, 4304.361328125),
        vector2(1076.2879638672, 4318.5883789062),
        vector2(1046.9436035156, 4317.6611328125)
    },
    MinZ = 31.24617767334,
    MaxZ = 60.241771697998,
    Debug = false,

    PlantSpawns = {
        vector3(1067.47, 4266.23, 37.59),
        vector3(1076.77, 4255.92, 36.2),
        vector3(1075.82, 4245.65, 36.35),
        vector3(1068.18, 4234.56, 36.44),
        vector3(1059.91, 4229.27, 36.31),
        vector3(1061.44, 4237.06, 36.81),
        vector3(1060.08, 4246.25, 37.29),
        vector3(1059.9, 4253.48, 37.55),
        vector3(1060.14, 4262.95, 37.9),
        vector3(1061.75, 4273.58, 37.76),
        vector3(1051.05, 4271.26, 37.95),
        vector3(1048.93, 4259.27, 37.36),
    }
}

Config.ShopItems = {
    { name = 'amoniagas', price = 10, amount = 1000, info = {}, type = "item", },
    { name = 'crolling_paper', price = 10, amount = 1000, info = {}, type = "item", },
}

Config.Products = {
    ['cubancigar'] = {
        price = 150,
        requiredItems = {
            { name = 'tobacco_leaf', amount = 1, },
            { name = 'crolling_paper', amount = 2, },
        }
    },
    ['morecigar'] = {
        price = 150,
        requiredItems = {
            { name = 'tobacco_leaf', amount = 1, },
            { name = 'amoniagas', amount = 1, },
            { name = 'crolling_paper', amount = 2, },
        }
    },
    ------Box----
    ['cubanbox'] = {
        price = 150,
        requiredItems = {
            { name = 'cubancigar', amount = 10, },
        }
    },
    ['morebox'] = {
        price = 150,
        requiredItems = {
            { name = 'morecigar', amount = 10, },
        }
    },
}