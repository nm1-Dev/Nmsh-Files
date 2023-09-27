Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		for k = 1, #Config.PedList, 1 do
			v = Config.PedList[k]
			local playerCoords = GetEntityCoords(PlayerPedId())
			local dist = #(playerCoords - v.coords)

			if dist < Config.Distance and not v.isRendered then
				local ped = nearPed(v.model, v.coords, v.heading, v.gender, v.animDict, v.animName, v.scenario, v
				.options, v.distance)
				v.ped = ped
				v.isRendered = true
			end

			if dist >= Config.Distance and v.isRendered then
				if Config.Fade then
					for i = 255, 0, -51 do
						Citizen.Wait(50)
						SetEntityAlpha(v.ped, i, false)
					end
				end
				DeletePed(v.ped)
				exports["nmsh-target"]:RemoveZone("ped_spawner-" .. v.ped)
				v.ped = nil
				v.isRendered = false
			end
		end
	end
end)

function nearPed(model, coords, heading, gender, animDict, animName, scenario, options, distance)
	local genderNum = 0
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Citizen.Wait(1)
	end

	-- Convert plain language genders into what fivem uses for ped types.
	if gender == 'male' then
		genderNum = 4
	elseif gender == 'female' then
		genderNum = 5
	else
		print("No gender provided! Check your configuration!")
	end

	--Check if someones coordinate grabber thingy needs to subract 1 from Z or not.
	if Config.MinusOne then
		local x, y, z = table.unpack(coords)
		ped = CreatePed(genderNum, GetHashKey(model), x, y, z - 1, heading, false, true)
	else
		ped = CreatePed(genderNum, GetHashKey(v.model), coords, heading, false, true)
	end

	SetEntityAlpha(ped, 0, false)

	if Config.Frozen then
		FreezeEntityPosition(ped, true) --Don't let the ped move.
	end

	if Config.Invincible then
		SetEntityInvincible(ped, true) --Don't let the ped die.
	end

	if Config.Stoic then
		SetBlockingOfNonTemporaryEvents(ped, true) --Don't let the ped react to his surroundings.
	end

	--Add an animation to the ped, if one exists.
	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Citizen.Wait(1)
		end
		TaskPlayAnim(ped, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end

	if scenario then
		TaskStartScenarioInPlace(ped, scenario, 0, true) -- begins peds animation
	end

	if Config.Fade then
		for i = 0, 255, 51 do
			Citizen.Wait(50)
			SetEntityAlpha(ped, i, false)
		end
	end

	if options and distance then
		exports["nmsh-target"]:AddEntityZone("ped_spawner-" .. ped, ped, {
			name = "ped_spawner-" .. ped,
			heading = GetEntityHeading(ped),
			debugPoly = false,
		}, {
			options = options,
			distance = distance
		})
	end

	return ped
end

function InsertPed(isTable, data)
	if isTable then
		for k, v in pairs(data) do
			if data[k].options and data[k].distance then
				Config.PedList[#Config.PedList + 1] = data[k]
			end
		end
	else
		if data.options and data.distance then
			Config.PedList[#Config.PedList + 1] = data
		end
	end
end

exports('InsertPed', InsertPed)
