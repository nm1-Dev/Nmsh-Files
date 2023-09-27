# rt-taco
Simple Taco Job For QB With Eye-Target
# Dependencies
> - qb-core - https://github.com/qbcore-framework/qb-core
> - qb-target - https://github.com/qbcore-framework/qb-target
> - MLO - https://www.gta5-mods.com/maps/taco-restaurant-mlo-add-on-fivem-pablitomamutopaputo
# copy and paste the below into qb-core -> shared -> items.lua
```
-- Taco Shop Food
	["beef-taco"] 				 	    = {["name"] = "beef-taco", 			 		       ["label"] = "Beef Taco", 				["weight"] = 250, 		["type"] = "item", 		["image"] = "beef-taco.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Beef Taco!"},
    ["chicken-taco"] 			 	    = {["name"] = "chicken-taco", 				       ["label"] = "Chicken Taco", 				["weight"] = 250, 		["type"] = "item", 		["image"] = "chicken-taco.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Chicken Taco!"},
	["quesadilla"] 			 		    = {["name"] = "quesadilla", 			 		   ["label"] = "Quesadilla", 				["weight"] = 250, 		["type"] = "item", 		["image"] = "quesadilla.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Quesadilla!"},
	["chicken-burrito"] 			    = {["name"] = "chicken-burrito", 			 	   ["label"] = "Chicken Burrito", 			["weight"] = 250, 		["type"] = "item", 		["image"] = "chicken-burrito.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Chicken Burrito!"},
    ["beef-burrito"] 		     	    = {["name"] = "beef-burrito", 		    	 	   ["label"] = "Beef Burrito", 		    	["weight"] = 250, 		["type"] = "item", 		["image"] = "beef-burrito.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Beef Burrito!"},
	["nachos"] 		 				    = {["name"] = "nachos", 						   ["label"] = "Nachos", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "nachos.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Nachos!"},
	  
	-- Taco Drinks
	["coke-soda"] 			     	    = {["name"] = "coke-soda", 					      ["label"] = "Coke Soda", 				["weight"] = 180, 		["type"] = "item", 		["image"] = "coke-soda.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Coke Soda!"},
	["fanta"] 			     	 	    = {["name"] = "fanta", 						      ["label"] = "Fanta", 					["weight"] = 180, 		["type"] = "item", 		["image"] = "fanta.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Fanta!"},
	
	--Ingredients
	["tortillas"] 				 	    = {["name"] = "tortillas", 			 	  	      ["label"] = "Tortillas", 				["weight"] = 150, 		["type"] = "item", 		["image"] = "tortillas.png", 		    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Ingredient"},
	["ground-beef"] 				    = {["name"] = "ground-beef", 			 	  	  ["label"] = "Ground Beef", 				["weight"] = 210, 		["type"] = "item", 		["image"] = "ground-beef.png", 		    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Ingredient"},
    ["raw-ground-beef"] 			    = {["name"] = "raw-ground-beef", 		 	  	  ["label"] = "Raw Ground Beef", 			["weight"] = 210, 		["type"] = "item", 		["image"] = "raw-ground-beef.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Ingredient"},
	["cheddar-cheese"] 				    = {["name"] = "cheddar-cheese", 			 	  ["label"] = "Cheddar Cheese", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "cheddar-cheese.png", 	    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Ingredient"},
	["butter"] 				 		    = {["name"] = "butter", 			 			  ["label"] = "Butter", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "butter.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Smooth like butter, like a criminal undercover~"},
	["chicken"] 				 	    = {["name"] = "chicken", 			 			  ["label"] = "Chicken", 					["weight"] = 180, 		["type"] = "item", 		["image"] = "chicken.png", 	        	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Ingredient"},
    ["raw-chicken"] 				    = {["name"] = "raw-chicken", 		 			  ["label"] = "Raw Chicken", 				["weight"] = 180, 		["type"] = "item", 		["image"] = "raw-chicken.png", 	       	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Ingredient"},
	["lettuce"] 				 	    = {["name"] = "lettuce", 			 			  ["label"] = "Lettuce", 					["weight"] = 150, 		["type"] = "item", 		["image"] = "lettuce.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Ingredient"},
	["tortilla-chips"] 		 		    = {["name"] = "tortilla-chips", 				  ["label"] = "Tortilla Chips", 			["weight"] = 150, 		["type"] = "item", 		["image"] = "tortilla-chips.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Ingredient"},
	["carbonated-water"] 		 	    = {["name"] = "carbonated-water", 				  ["label"] = "Carbonated Water", 		    ["weight"] = 125, 		["type"] = "item", 		["image"] = "carbonated-water.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Ingredient"},
	["sugar-cubes"] 		 		    = {["name"] = "sugar-cubes", 					  ["label"] = "Sugar Cubes", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "sugar-cubes.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Ingredient"},
	["taco-tomato"] 		 	 	    = {["name"] = "taco-tomato", 					  ["label"] = "Tomatoes", 				    ["weight"] = 100, 		["type"] = "item", 		["image"] = "taco-tomato.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Ingredient"},
```
# copy and paste the below into qb-core -> shared -> jobs.lua
```
['taco'] = {
		label = 'Taco Shop',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 75
            },
            ['1'] = {
                name = 'Employee',
                payment = 85
            },
            ['2'] = {
                name = 'Cook',
                payment = 100
            },
            ['3'] = {
                name = 'Manager',
                payment = 120
            },
            ['4'] = {
                name = 'CEO',
                isboss = true,
                payment = 135,
            },
        },
	},
```
# Dont forget to put the images from the images folder into your inventory images folder... qb-inventory -> html -> images
# Want Sounds? add the files inside the sounds folder into your interact_sound -> client -> html -> sounds
# !!!CREDITS!!!
Script is based off of Randolio's Burgershot | Cheers!!
> - https://github.com/Randolio
