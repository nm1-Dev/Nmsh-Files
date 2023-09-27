local QBCore = exports['qb-core']:GetCoreObject()


-------------------------------------------------------< SMOOTHIE MENU START >---------------------------------------------------
local SmoothieMenu = {
    main_header = { -- Main menu header
        text = 'Prepare Fresh Fruit Smoothies!', -- Header text
        icon = '<i class="fa-solid fa-blender"></i>' -- Icon to display next to header text. Remove this to use no icon
    },
    menu_options = {
        {
            header = 'Get Smoothie Cup', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-glass-water"></i>', -- Menu header icon if using one this can be removed if not
            action_type = 'server_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_limeys:server:GiveSmoothieCup',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Prepare Mango Smoothie', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-blender"></i>', -- Menu header icon if using one this can be removed if not
            message = "<u>Ingredients Required:</u> <br> Fresh Mango, Fruit Juice, Ice Cubes, Smoothie Cup",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_limeys:client:PrepareMangoSmoothie',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Prepare Peach Smoothie', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-blender"></i>', -- Menu header icon if using one this can be removed if not
            message = "<u>Ingredients Required:</u> <br> Fresh Peach, Fruit Juice, Ice Cubes, Smoothie Cup",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_limeys:client:PreparePeachSmoothie',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Prepare Lychee Smoothie', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-blender"></i>', -- Menu header icon if using one this can be removed if not
            message = "<u>Ingredients Required:</u> <br> Fresh Lychee, Fruit Juice, Ice Cubes, Smoothie Cup",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_limeys:client:PrepareLycheeSmoothie',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Prepare Pineapple Smoothie', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-blender"></i>', -- Menu header icon if using one this can be removed if not
            message = "<u>Ingredients Required:</u> <br> Fresh Pineapple, Fruit Juice, Ice Cubes, Smoothie Cup",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_limeys:client:PreparePineappleSmoothie',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Prepare Coconut Smoothie', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-blender"></i>', -- Menu header icon if using one this can be removed if not
            message = "<u>Ingredients Required:</u> <br> Fresh Coconut, Fruit Juice, Ice Cubes, Smoothie Cup",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_limeys:client:PrepareCoconutSmoothie',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Prepare Strawberry Smoothie', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-blender"></i>', -- Menu header icon if using one this can be removed if not
            message = "<u>Ingredients Required:</u> <br> Fresh Strawberry, Fruit Juice, Ice Cubes, Smoothie Cup",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_limeys:client:PrepareStrawberrySmoothie',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Prepare Passion Fruit Smoothie', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-blender"></i>', -- Menu header icon if using one this can be removed if not
            message = "<u>Ingredients Required:</u> <br> Fresh Passion Fruit, Fruit Juice, Ice Cubes, Smoothie Cup",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_limeys:client:PreparePassionFruitSmoothie',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Prepare Lemon Smoothie', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-blender"></i>', -- Menu header icon if using one this can be removed if not
            message = "<u>Ingredients Required:</u> <br> Fresh Lemon, Fruit Juice, Ice Cubes, Smoothie Cup",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_limeys:client:PrepareLemonSmoothie',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Prepare Almond Smoothie', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-blender"></i>', -- Menu header icon if using one this can be removed if not
            message = "<u>Ingredients Required:</u> <br> Fresh Almond, Fruit Juice, Ice Cubes, Smoothie Cup",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_limeys:client:PrepareAlmondSmoothie',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        
    },
    menu_buttons = { -- Menu buttons mostly pointless since they work the same as any other options mainly just allows for more customisation over menu templates
        close = {
            use = true, -- Toggle the close button
            --action_type = '', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            --action = '', -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
        }
    },
}

lib.registerContext({
    id = 'SmoothieMenu',
    title = 'Prepare Fresh Fruit Smoothies!',
    options = {
      {
        title = 'Get Smoothie Cup',
        icon = 'glass-water',
        onSelect = function()
            TriggerServerEvent('lusty94_limeys:server:GiveSmoothieCup')
        end,
        arrow = true,
      },
      {
        title = 'Prepare Mango Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PrepareMangoSmoothie',
        arrow = true,
        metadata = {
            {label = 'Mango Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Peach Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PreparePeachSmoothie',
        arrow = true,
        metadata = {
            {label = 'Peach Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Lychee Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PrepareLycheeSmoothie',
        arrow = true,
        metadata = {
            {label = 'Lychee Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Pineapple Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PreparePineappleSmoothie',
        arrow = true,
        metadata = {
            {label = 'Pineapple Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Coconut Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PrepareCoconutSmoothie',
        arrow = true,
        metadata = {
            {label = 'Coconut Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Strawberry Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PrepareStrawberrySmoothie',
        arrow = true,
        metadata = {
            {label = 'Strawberry Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Passion Fruit Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PreparePassionFruitSmoothie',
        arrow = true,
        metadata = {
            {label = 'Passion Fruit Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Lemon Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PrepareLemonSmoothie',
        arrow = true,
        metadata = {
            {label = 'Lemon Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Almond Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PrepareAlmondSmoothie',
        arrow = true,
        metadata = {
            {label = 'Almond Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      
      
    }
})


RegisterNetEvent('lusty94_limeys:client:SmoothieMenu', function()
    if Config.CoreSettings.Menu.Type == 'qb' then
        exports['nmsh-menu']:openMenu({
            {
                header = "Prepare Fresh Fruit Smoothies!",
                isMenuHeader = true,
            },  
            {   
                header = "Get A Smoothie Cup",
                params = {
                    isServer = true,
                    event = "lusty94_limeys:server:GiveSmoothieCup",
                }
            },          
            {   
                header = "Prepare Mango Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Mango, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PrepareMangoSmoothie",
                }
            },          
            {   
                header = "Prepare Peach Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Peach, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PreparePeachSmoothie",
                }
            },          
            {   
                header = "Prepare Lychee Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Lychee, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PrepareLycheeSmoothie",
                }
            },          
            {   
                header = "Prepare Pineapple Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Pineapple, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PreparePineappleSmoothie",
                }
            },          
            {   
                header = "Prepare Coconut Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Coconut, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PrepareCoconutSmoothie",
                }
            },          
            {   
                header = "Prepare Strawberry Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Strawberry, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PrepareStrawberrySmoothie",
                }
            },          
            {   
                header = "Prepare Passion Fruit Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Passion Fruit, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PreparePassionFruitSmoothie",
                }
            },
            {   
                header = "Prepare Lemon Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Lemon, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PrepareLemonSmoothie",
                }
            },          
            {   
                header = "Prepare Almond Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Almond, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PrepareAlmondSmoothie",
                }
            },       
            {
                header = "< Close",
                txt = "",
                params = {
                    event = "nmsh-menu:closeMenu",
                }
            },
        })
    elseif Config.CoreSettings.Menu.Type == 'jixel' then
        exports['jixel-menu']:openMenu({
            {
                header = "Prepare Fresh Fruit Smoothies!",
                isMenuHeader = true,
            }, 
            {   
                header = "Get A Smoothie Cup",
                params = {
                    isServer = true,
                    event = "lusty94_limeys:server:GiveSmoothieCup",
                }
            },          
            {   
                header = "Prepare Mango Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Mango, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PrepareMangoSmoothie",
                }
            },          
            {   
                header = "Prepare Peach Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Peach, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PreparePeachSmoothie",
                }
            },          
            {   
                header = "Prepare Lychee Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Lychee, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PrepareLycheeSmoothie",
                }
            },          
            {   
                header = "Prepare Pineapple Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Pineapple, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PreparePineappleSmoothie",
                }
            },          
            {   
                header = "Prepare Coconut Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Coconut, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PrepareCoconutSmoothie",
                }
            },          
            {   
                header = "Prepare Strawberry Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Strawberry, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PrepareStrawberrySmoothie",
                }
            },          
            {   
                header = "Prepare Passion Fruit Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Passion Fruit, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PreparePassionFruitSmoothie",
                }
            },
            {   
                header = "Prepare Lemon Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Lemon, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PrepareLemonSmoothie",
                }
            },          
            {   
                header = "Prepare Almond Smoothie",
                txt = "<u>Ingredients Required:</u> <br> Fresh Almond, Fruit Juice, Ice Cubes, Smoothie Cup",
                params = {
                    event = "lusty94_limeys:client:PrepareAlmondSmoothie",
                }
            },
            {
                header = "< Close",
                txt = "",
                params = {
                    event = "jixel-menu:closeMenu",
                }
            },
        })
    elseif Config.CoreSettings.Menu.Type == 'boii' then
        exports['boii_ui']:open_menu('default', SmoothieMenu)
    elseif Config.CoreSettings.Menu.Type == 'ox' then
        lib.showContext('SmoothieMenu')
    elseif Config.CoreSettings.Menu.Type == 'custom' then
        --insert custom menu code here
    end
end)
-------------------------------------------------------< SMOOTHIE MENU END >---------------------------------------------------



-------------------------------------------------------< HOT DRINKS MENU START >---------------------------------------------------
local HotDrinksMenu = {
    main_header = { -- Main menu header
        text = 'Prepare Hot Drinks!', -- Header text
        icon = '<i class="fa-solid fa-mug-hot"></i>' -- Icon to display next to header text. Remove this to use no icon
    },
    menu_options = {
        {
            header = 'Get A Coffee Cup', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-mug-saucer"></i>', -- Menu header icon if using one this can be removed if not
            action_type = 'server_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_limeys:server:GiveCoffeeCup',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Prepare Cup of Tea', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-mug-hot"></i>', -- Menu header icon if using one this can be removed if not
            message = "Coffee Cup Required",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_limeys:client:PrepareTea',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Prepare Cup of Coffee', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-mug-hot"></i>', -- Menu header icon if using one this can be removed if not
            message = "Coffee Cup Required",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_limeys:client:PrepareCoffee',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Prepare Cup of Hot Chocolate', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-mug-hot"></i>', -- Menu header icon if using one this can be removed if not
            message = "Hot Chocolate Cup Required",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_limeys:client:PrepareHotChocolate',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        
        
    },
    menu_buttons = { -- Menu buttons mostly pointless since they work the same as any other options mainly just allows for more customisation over menu templates
        close = {
            use = true, -- Toggle the close button
            --action_type = '', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            --action = '', -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
        }
    },
}

lib.registerContext({
    id = 'HotDrinksMenu',
    title = 'Prepare Hot Drinks!',
    options = {
      {
        title = 'Get A Coffee Cup',
        icon = 'mug-saucer',
        onSelect = function()
            TriggerServerEvent('lusty94_limeys:server:GiveCoffeeCup')
        end,
        arrow = true,
      },
      {
        title = 'Prepare Cup of Tea',
        icon = 'mug-hot',
        event = 'lusty94_limeys:client:PrepareTea',
        description = 'Coffee Cup Required',
        arrow = true,
      },
      {
        title = 'Prepare Cup of Coffee',
        icon = 'mug-hot',
        event = 'lusty94_limeys:client:PrepareCoffee',
        description = 'Coffee Cup Required',
        arrow = true,
      },
      {
        title = 'Prepare Cup of Hot Chocolate',
        icon = 'mug-hot',
        event = 'lusty94_limeys:client:PrepareHotChocolate',
        description = 'Coffee Cup Required',
        arrow = true,
      },
    }
})


RegisterNetEvent('lusty94_limeys:client:HotDrinksMenu', function()
    if Config.CoreSettings.Menu.Type == 'qb' then
        exports['nmsh-menu']:openMenu({
            {
                header = "Prepare Fresh Fruit Smoothies!",
                isMenuHeader = true,
            },  
            {   
                header = "Get A Coffee Cup",
                params = {
                    isServer = true,
                    event = "lusty94_limeys:server:GiveCoffeeCup",
                }
            },          
            {   
                header = "Prepare Cup of Tea",
                txt = "Coffee Cup Required",
                params = {
                    event = "lusty94_limeys:client:PrepareTea",
                }
            },       
            {   
                header = "Prepare Cup of Coffee",
                txt = "Coffee Cup Required",
                params = {
                    event = "lusty94_limeys:client:PrepareCoffee",
                }
            },       
            {   
                header = "Prepare Cup of Hot Chocolate",
                txt = "Coffee Cup Required",
                params = {
                    event = "lusty94_limeys:client:PrepareHotChocolate",
                }
            },       
            {
                header = "< Close",
                txt = "",
                params = {
                    event = "nmsh-menu:closeMenu",
                }
            },
        })
    elseif Config.CoreSettings.Menu.Type == 'jixel' then
        exports['jixel-menu']:openMenu({
            {
                header = "Prepare Fresh Fruit Smoothies!",
                isMenuHeader = true,
            },  
            {   
                header = "Get A Coffee Cup",
                params = {
                    isServer = true,
                    event = "lusty94_limeys:server:GiveCoffeeCup",
                }
            },          
            {   
                header = "Prepare Cup of Tea",
                txt = "Coffee Cup Required",
                params = {
                    event = "lusty94_limeys:client:PrepareTea",
                }
            },       
            {   
                header = "Prepare Cup of Coffee",
                txt = "Coffee Cup Required",
                params = {
                    event = "lusty94_limeys:client:PrepareCoffee",
                }
            },       
            {   
                header = "Prepare Cup of Hot Chocolate",
                txt = "Coffee Cup Required",
                params = {
                    event = "lusty94_limeys:client:PrepareHotChocolate",
                }
            }, 
            {
                header = "< Close",
                txt = "",
                params = {
                    event = "jixel-menu:closeMenu",
                }
            },
        })
    elseif Config.CoreSettings.Menu.Type == 'boii' then
        exports['boii_ui']:open_menu('default', HotDrinksMenu)
    elseif Config.CoreSettings.Menu.Type == 'ox' then
        lib.showContext('HotDrinksMenu')
    elseif Config.CoreSettings.Menu.Type == 'custom' then
        --insert custom menu code here
    end
end)
-------------------------------------------------------< HOT DRINKS MENU END >---------------------------------------------------


