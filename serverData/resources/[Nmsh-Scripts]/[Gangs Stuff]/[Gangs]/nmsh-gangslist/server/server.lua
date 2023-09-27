local nmsh = exports[Nmsh.FilesSetup.CoreName]:GetCoreObject()

-- Get Employees
nmsh.Functions.CreateCallback('nmsh-gangmenu:server:GetGangMember', function(source, cb, gangname)
	local src = source
	local gangers = {}

	local players = nmsh.Functions.GetQBPlayers()
	local amount = 0
    for _, v in pairs(players) do
        if v.PlayerData.gang.name == gangname then
			amount = amount + 1
			gangers[#gangers+1] = {
				gSource = v.PlayerData.source,
				citizenId = v.PlayerData.citizenid,
				grade = v.PlayerData.gang.grade.name,
				name = v.PlayerData.charinfo.firstname .. ' ' .. v.PlayerData.charinfo.lastname,
				radioC = GetRadioChannel(v.PlayerData.source),
				vehicle = GetVehiclePedIsIn(GetPlayerPed(v.PlayerData.source))
			}
		end
	end
	cb(gangers, amount)
end)

function GetRadioChannel(source)
    return Player(source).state['radioChannel']
end