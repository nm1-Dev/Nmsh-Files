local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}

local onDuty = false

-- target

Citizen.CreateThread(function()

    exports['nmsh-target']:AddTargetModel(`ig_floyd`, {
        options = {
            {
                type = "client",
                event = "garage:BurgerShotGarage",
                icon = "fas fa-car",
                label = "BurgerShot Garage",
                job = Config.Job,
            },
        },
        distance = 2.5
    })

	exports['nmsh-target']:AddBoxZone("BurgerShotDuty", vector3(-1200.61, -902.9, 13.89), 1, 1.2, {
		name = "BurgerShotDuty",
		heading = 32,
		debugPoly = false,
        minZ=12.49,
        maxZ=16.49,
	}, {
		options = {
		    {  
			event = "nmsh-burgershot:DutyB",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = Config.Job,
		    },
		},
		distance = 1.5
	})

		exports['nmsh-target']:AddBoxZone("burger_tray_1", vector3(-1196.53, -892.56, 13.89), 1.05, 1.0, {
			name = "burger_tray_1",
			heading = 35.0,
			debugPoly = false,
            minZ=13.69,
            maxZ=17.69,
		}, {
			options = {
			    {
				event = "nmsh-burgershot:Tray1",
				icon = "far fa-clipboard",
				label = "Tray 1",
			    },
			},
			distance = 1.5
		})

	exports['nmsh-target']:AddBoxZone("burger_tray_2", vector3(-1194.63, -893.39, 13.89), 0.5, 0.7, {
		name="burger_tray_2",
		heading=318,
		debugPoly=false,
        minZ=13.69,
        maxZ=17.69,
	}, {
		options = {
		    {
			event = "nmsh-burgershot:Tray2",
			icon = "far fa-clipboard",
			label = "Tray 2",
		    },
		},
		distance = 1.5
	})

	exports['nmsh-target']:AddBoxZone("burger_tray_3", vector3(-1192.5, -893.89, 13.89), 1, 1, {
		name="burger_tray_3",
		heading=350,
		debugPoly=false,
        minZ=13.89,
        maxZ=17.89,
	}, {
		options = {
		    {
			event = "nmsh-burgershot:Tray3",
			icon = "far fa-clipboard",
			label = "Tray 3",
		    },
		},
		distance = 3.5
	})


	exports['nmsh-target']:AddBoxZone("burgershotcooker", vector3(-1194.79, -897.55, 13.89), 1.8, 1.0, {
		name="burgershotcooker",
		heading=34,
		debugPoly=false,
        minZ=13.69,
        maxZ=17.69,
	}, {
		options = {
			{
				event = "nmsh-burgershot:PattyFry",
				icon = "fas fa-hamburger",
				label = "Burger Cook Station",
				job = Config.Job,
			},
		},
		distance = 1.5
	})

	exports['nmsh-target']:AddBoxZone("burgershotcooker2 ", vector3(-1195.98, -897.25, 13.89), 1.7, 1, {
		name="burgershotcooker2 ",
		heading=34,
		debugPoly=false,
        minZ=13.69,
        maxZ=17.69,
	}, {
		options = {
			{
				event = "nmsh-burgershot:PattyFry",
				icon = "fas fa-hamburger",
				label = "Burger Cook Station 2",
				job = Config.Job,
			},
		},
		distance = 1.5
	})

		exports['nmsh-target']:AddBoxZone("burgershotfryer", vector3(-1196.73, -900.07, 13.89), 2.5, 1.5, {
		name="burgershotfryer",
		heading=35,
		debugPoly=false,
        minZ=13.69,
        maxZ=17.69,
		}, {
		    options = {
			{
			    event = "nmsh-burgershot:Fries",
			    icon = "fas fa-box",
			    label = "Make Fries",
			    job = Config.Job,
			},
		    },
		    distance = 1.5
		})


	exports['nmsh-target']:AddBoxZone("burgershotdrinks", vector3(-1190.29, -898.72, 13.89), 2.2, 0.6, {
	    name="burgershotdrinks",
	    heading=34,
	    debugPoly=false,
        minZ=13.69,
        maxZ=17.69,
	    }, {
		options = {
		    {
			event = "nmsh-burgershot-menu:DrinkMenu",
			icon = "fas fa-filter",
			label = "Make Some Drinks",
			job = Config.Job,
		    },
		},
		distance = 1.5
	    })

        exports['nmsh-target']:AddBoxZone("burgershotdrinks2", vector3(-1191.33, -899.34, 13.89), 1.15, 0.7, {
            name="burgershotdrinks2",
            heading=33,
            debugPoly=false,
            minZ=13.69,
            maxZ=17.69,
            }, {
                options = {
                    {
                        event = "nmsh-burgershot-menu:DrinkMenu",
                        icon = "fas fa-filter",
                        label = "Make Some Drinks",
                        job = Config.Job,
                    },
                },
                distance = 1.5
            })


         exports['nmsh-target']:AddBoxZone("burgerfridge", vector3(-1202.92, -897.65, 13.89), 1.6, 1, {
            name="burgerfridge",
            heading=35,
            debugPoly=false,
            minZ=13.69,
            maxZ=17.69,
        }, {
                options = {
                    {
                        event = "nmsh-burgershot-menu:OrderMenu",
                        icon = "fas fa-laptop",
                        label = "Order Ingredients!",
                        job = Config.Job,
                    },
                },
                distance = 1.5
            })

        exports['nmsh-target']:AddBoxZone("burgershotdisplay", vector3(-1195.21, -896.42, 13.89), 4.6, 1.2, {
            name="burgershotdisplay",
            heading=34,
            debugPoly=false,
            minZ=13.69,
            maxZ=17.69,
        }, {
                options = {
                    {
                        event = "nmsh-burgershot:Storage",
                        icon = "fas fa-box",
                        label = "Storage",
                        job = Config.Job,
                    },
                },
                distance = 1.5
            })


        exports['nmsh-target']:AddBoxZone("craftburger", vector3(-1194.04, -900.57, 13.89), 1, 1.2, {
            name="craftburger",
            heading=34,
            debugPoly=false,
            minZ=13.69,
            maxZ=17.69,
        }, {
                options = {
                    {
                        event = "nmsh-burgershot-menu:Burgers",
                        icon = "fas fa-burger",
                        label = "Burger Work Station",
                        job = Config.Job,
                    },
                },
                distance = 1.5
            })


        exports['nmsh-target']:AddBoxZone("BurgerShot_register_1", vector3(-1197.76, -892.63, 13.89), 0.5, 0.4, {
            name="BurgerShot_register_1",
            debugPoly=false,
            heading=125,
            minZ=13.49,
            maxZ=17.49,
        }, {
                options = {
                    {
                        event = "nmsh-burgershot:bill",
                        parms = "1",
                        icon = "fas fa-credit-card",
                        label = "Charge Customer",
                        job = Config.Job,
                    },
                },
                distance = 1.5
            })

        exports['nmsh-target']:AddBoxZone("BurgerShot_register_2", vector3(-1193.73, -893.52, 13.89), 0.6, 0.5, {
            name="BurgerShot_register_2",
            debugPoly=false,
            heading=302,
            minZ=13.69,
            maxZ=17.69,
            }, {
                    options = {
                        {
                            event = "nmsh-burgershot:bill",
                            parms = "2",
                            icon = "fas fa-credit-card",
                            label = "Charge Customer",
                            job = Config.Job,
                        },
                    },
                    distance = 1.5
                })  


        exports['nmsh-target']:AddBoxZone("BurgerShot_register_3", vector3(-1195.73, -893.0, 13.89), 0.6, 0.4, {
            name="BurgerShot_register_3",
            debugPoly=false,
            heading=125,
            minZ=13.69,
            maxZ=17.69,
                    }, {
                            options = {
                                {
                                    event = "nmsh-burgershot:bill",
                                    parms = "3",
                                    icon = "fas fa-credit-card",
                                    label = "Charge Customer",
                                    job = Config.Job,
                                },
                            },
                            distance = 1.5
                        })
end)


-- nmsh-menu --

RegisterNetEvent('nmsh-burgershot-menu:Burgers', function(data)
    exports['nmsh-menu']:openMenu({
        {
            
            header = "| Available Burgers |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Moneyshot Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "nmsh-burgershot:MoneyShot"
            }
        },
        {
            
            header = "• Meat Free Burger",
            txt = "Bun , Tomato , Lettuce",
            params = {
                event = "nmsh-burgershot:MeatFree"
            }
        },
        {
            
            header = "• Bleeder Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "nmsh-burgershot:BleederBurger"
            }
        },
        {
            
            header = "• The Heart Stopper",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "nmsh-burgershot:HeartStopper"
            }
        },
        {
            
            header = "• Torpedo Roll",
            txt = "Bun , Cooked Meat",
            params = {
                event = "nmsh-burgershot:Torpedo"
            }
        },
        {
            
            header = "• Murder Meal",
            txt = "The Heart Stopper, Fries and SoftDrink",
            params = {
                event = "nmsh-burgershot:CreateMurderMeal"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)


RegisterNetEvent('nmsh-burgershot-menu:OrderMenu', function(data)
    exports['nmsh-menu']:openMenu({
        {
            
            header = "| Fridge |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "nmsh-burgershot:shop"
            }
        },
        {
           
            header = "• Open Fridge",
            txt = "See what you have in storage",
            params = {
                event = "nmsh-burgershot:Storage2"
            }
        },
        {
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)

RegisterNetEvent('nmsh-burgershot-menu:DrinkMenu', function(data)
    exports['nmsh-menu']:openMenu({
        {
            id = 0,
            header = "| Drink Menu |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Soft Drink",
            txt = "Soda Syrup",
            params = {
                event = "nmsh-burgershot:SoftDrink"
            }
        },
        {
            
            header = "• Milkshake",
            txt = "Milkshake Formula",
            params = {
                event = "nmsh-burgershot:mShake"
            }
        },
        {
           
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)


-- Till Stuff --
RegisterNetEvent("nmsh-burgershot:bill")
AddEventHandler("nmsh-burgershot:bill", function()
    local bill = exports['nmsh-input']:ShowInput({
        header = "Create Receipt",
		submitText = "Bill",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Bill Price ($)", -- text you want to be displayed as a place holder
                name = "billprice", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = false -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("nmsh-burgershot:bill:player", bill.citizenid, bill.billprice)
    end
end)

