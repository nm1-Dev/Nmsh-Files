Nmsh = {}

Nmsh.CoreName = 'qb-core'
Nmsh.CoreTriggerName = 'QBCore'
Nmsh.MenuName = 'nmsh-menu'
Nmsh.InputName = 'nmsh-input'
Nmsh.TargetName = 'nmsh-target'
Nmsh.LogsTrigger = 'nmsh-logs'

Nmsh.RoomRentCost = 15000
Nmsh.DailyRentTimer = 60 * (1000 * 6000)
Nmsh.DailyRental = 504
Nmsh.Maxweight = 700000
Nmsh.MaxSlots = 25

Nmsh.Reception = {coords = vector3(398.44, -19.89, 91.94), ped = 'csb_vincent', heading = 333.83}

Nmsh.WeightTiers = {
    [1] = {
        amount = 700000,
        price = 10000,
        capacity = 500
    },
    [2] = {
        amount = 1000000,
        price = 20000,
        capacity = 1000
    },
    [3] = {
        amount = 1500000,
        price = 30000,
        capacity = 1500
    },
    [4] = {
        amount = 2000000,
        price = 40000,
        capacity = 2000
    },
    [5] = {
        amount = 2500000,
        price = 50000,
        capacity = 2500
    },
    [6] = {
        amount = 3000000,
        price = 60000,
        capacity = 3000
    },
    [7] = {
        amount = 3500000,
        price = 70000,
        capacity = 3500
    },
    [8] = {
        amount = 4000000,
        price = 80000,
        capacity = 4000
    },
    [9] = {
        amount = 4500000,
        price = 90000,
        capacity = 4500
    },
    [10] = {
        amount = 5000000,
        price = 100000,
        capacity = 5000
    },
    [11] = {
        amount = 5500000,
        price = 110000,
        capacity = 5500
    },
    [12] = {
        amount = 6000000,
        price = 120000,
        capacity = 6000
    },
    [13] = {
        amount = 6500000,
        price = 130000,
        capacity = 6500
    },
    [14] = {
        amount = 7000000,
        price = 140000,
        capacity = 7000
    },
    [15] = {
        amount = 7500000,
        price = 150000,
        capacity = 7500
    },
    [16] = {
        amount = 8000000,
        price = 160000,
        capacity = 8000
    },
    [17] = {
        amount = 8500000,
        price = 170000,
        capacity = 8500
    },
    [18] = {
        amount = 9000000,
        price = 180000,
        capacity = 9000
    },
    [19] = {
        amount = 9500000,
        price = 190000,
        capacity = 9500
    },
    [20] = {
        amount = 10000000,
        price = 200000,
        capacity = 10000
    },
}

Nmsh.SlotsTiers = {
    [1] = {
        amount = 25,
        price = 5000
    },
    [2] = {
        amount = 30,
        price = 7000
    },
    [3] = {
        amount = 40,
        price = 10000
    },
    [4] = {
        amount = 50,
        price = 13000
    },
    [5] = {
        amount = 60,
        price = 15000
    },
    [6] = {
        amount = 70,
        price = 18000,
    },
    [7] = {
        amount = 80,
        price = 20000
    },
    [8] = {
        amount = 90,
        price = 23000
    },
    [9] = {
        amount = 100,
        price = 25000
    },
    [10] = {
        amount = 150,
        price = 45000
    },
    [11] = {
        amount = 200,
        price = 65000
    },
    [12] = {
        amount = 300,
        price = 100000
    },
}

Nmsh.Rooms = {
    [201] = {
        Door = {
            Id = 'mafiahotel-201',
            isClosed = true,
            Coords = vec3(430.279510, -7.174495, 99.798851)
        },
        locker = {
            maxweight = 0,
            slots = 0,
            coords = vector3(433.7, -8.47, 99.65),
            heading = 240,
            minZ = 99.05,
            maxZ = 99.65,
            width = 1.15,
            hight = 0.7,
        },
        isOwned = false,
        Owner = nil,
    },
    [202] = {
        Door = {
            Id = 'mafiahotel-202',
            isClosed = true,
            Coords = vec3(426.587830, -13.568707, 99.798843)
        },
        locker = {
            maxweight = 0,
            slots = 0,
            coords = vector3(430.71, -13.57, 99.65),
            heading = 240,
            minZ = 98.65,
            maxZ = 99.6,
            width = 1.15,
            hight = 0.7,
        },
        isOwned = false,
        Owner = nil,
    },
    [203] = {
        Door = {
            Id = 'mafiahotel-203',
            isClosed = true,
            Coords = vec3(423.019318, -19.718124, 99.796906)
        },
        locker = {
            maxweight = 0,
            slots = 0,
            coords = vector3(424.63, -24.32, 99.65),
            heading = 58,
            minZ = 98.45,
            maxZ = 99.6,
            width = 1.15,
            hight = 0.7,
        },
        isOwned = false,
        Owner = nil,
    },
    [204] = {
        Door = {
            Id = 'mafiahotel-204',
            isClosed = true,
            Coords = vec3(417.466125, -29.413553, 99.798851)
        },
        locker = {
            maxweight = 0,
            slots = 0,
            coords = vector3(421.55, -29.43, 99.65),
            heading = 60,
            minZ = 98.65,
            maxZ = 99.45,
            width = 1.15,
            hight = 0.7,
        },
        isOwned = false,
        Owner = nil,
    },
    [205] = {
        Door = {
            Id = 'mafiahotel-205',
            isClosed = true,
            Coords = vec3(411.315735, -30.720928, 99.798843)
        },
        locker = {
            maxweight = 0,
            slots = 0,
            coords = vector3(407.69, -32.86, 99.65),
            heading = 327,
            minZ = 98.45,
            maxZ = 99.45,
            width = 1.15,
            hight = 0.7,
        },
        isOwned = false,
        Owner = nil,
    },
    [206] = {
        Door = {
            Id = 'mafiahotel-206',
            isClosed = true,
            Coords = vec3(401.510712, -25.065935, 99.798843)
        },
        locker = {
            maxweight = 0,
            slots = 0,
            coords = vector3(402.47, -29.73, 99.65),
            heading = 330,
            minZ = 98.65,
            maxZ = 99.45,
            width = 1.15,
            hight = 0.7,
        },
        isOwned = false,
        Owner = nil,
    },
    [207] = {
        Door = {
            Id = 'mafiahotel-207',
            isClosed = true,
            Coords = vec3(395.397888, -21.527195, 99.798843)
        },
        locker = {
            maxweight = 0,
            slots = 0,
            coords = vector3(391.76, -23.65, 99.65),
            heading = 327,
            minZ = 97.45,
            maxZ = 99.45,
            width = 1.15,
            hight = 0.7,
        },
        isOwned = false,
        Owner = nil,
    },
    [208] = {
        Door = {
            Id = 'mafiahotel-208',
            isClosed = true,
            Coords = vec3(395.255310, -16.006084, 99.798843)
        },
        locker = {
            maxweight = 0,
            slots = 0,
            coords = vector3(393.68, -11.43, 99.65),
            heading = 58,
            minZ = 98.65,
            maxZ = 99.45,
            width = 1.15,
            hight = 0.7,
        },
        isOwned = false,
        Owner = nil,
    },
    [209] = {
        Door = {
            Id = 'mafiahotel-209',
            isClosed = true,
            Coords = vec3(400.861816, -6.295180, 99.798843)
        },
        locker = {
            maxweight = 0,
            slots = 0,
            coords = vector3(400.861816, -6.295180, 99.798843),
            heading = 60,
            minZ = 98.45,
            maxZ = 99.6,
            width = 1.15,
            hight = 0.7,
        },
        isOwned = false,
        Owner = nil,
    },
    [210] = {
        Door = {
            Id = 'mafiahotel-210',
            isClosed = true,
            Coords = vec3(404.397919, -0.170496, 99.798843)
        },
        locker = {
            maxweight = 0,
            slots = 0,
            coords = vector3(402.82, 4.41, 99.65),
            heading = 58,
            minZ = 98.45,
            maxZ = 99.6,
            width = 1.15,
            hight = 0.7,
        },
        isOwned = false,
        Owner = nil,
    },
    [211] = {
        Door = {
            Id = 'mafiahotel-211',
            isClosed = true,
            Coords = vec3(410.943115, 8.718935, 99.798843)
        },
        locker = {
            maxweight = 0,
            slots = 0,
            coords = vector3(415.49, 10.27, 99.65),
            heading = 328,
            minZ = 98.45,
            maxZ = 99.6,
            width = 1.15,
            hight = 0.7,
        },
        isOwned = false,
        Owner = nil,
    },
    [212] = {
        Door = {
            Id = 'mafiahotel-212',
            isClosed = true,
            Coords = vec3(420.750000, 3.056884, 99.798843)
        },
        locker = {
            maxweight = 0,
            slots = 0,
            coords = vector3(420.73, 7.14, 99.65),
            heading = 330,
            minZ = 98.45,
            maxZ = 99.6,
            width = 1.15,
            hight = 0.7,
        },
        isOwned = false,
        Owner = nil,
    },
    [213] = {
        Door = {
            Id = 'mafiahotel-213',
            isClosed = true,
            Coords = vec3(426.863586, -0.472724, 99.798843)
        },
        locker = {
            maxweight = 0,
            slots = 0,
            coords = vector3(431.42, 1.07, 99.65),
            heading = 328,
            minZ = 98.45,
            maxZ = 99.6,
            width = 1.15,
            hight = 0.7,
        },
        isOwned = false,
        Owner = nil,
    },
}