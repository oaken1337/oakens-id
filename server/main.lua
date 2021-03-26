ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)

RegisterCommand("idoff", function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local 
    if hasPermission(xPlayer) then
		TriggerClientEvent("dontshowid", -1, source)
		--TriggerClientEvent('ESX.ShowNotification', "~w~ID's have been turned ~r~off~w~.")
		TriggerClientEvent('chatMessage', source, "[oaken's ID] ID's have been turned off.")
	end
end)
RegisterCommand("idon", function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
    if hasPermission(xPlayer) then
	    TriggerClientEvent("showid", -1, source)
	    --TriggerClientEvent('ESX.ShowNotification', "~w~ID's have been turned ~g~on~w~.")
		TriggerClientEvent('chatMessage', source, "[oaken's ID] ID's have been turned on.")
    end
end)


RegisterServerEvent('checkadmin')
AddEventHandler('checkadmin', function()
    local id = source
	local xPlayer = ESX.GetPlayerFromId(source)
    if hasPermission(xPlayer) then
		TriggerClientEvent("setadmin", source)
	end
end)


function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function havePermission(xPlayer, exclude)	-- you can exclude rank(s) from having permission to specific commands 	[exclude only take tables]
	if exclude and type(exclude) ~= 'table' then exclude = nil;print("^3[esx_admin] ^1ERROR ^0exclude argument is not table..^0") end	-- will prevent from errors if you pass wrong argument

	local playerGroup = xPlayer.getGroup()
	for k,v in pairs(Config.adminRanks) do
		if v == playerGroup then
			if not exclude then
				return true
			else
				for a,b in pairs(exclude) do
					if b == v then
						return false
					end
				end
				return true
			end
		end
	end
	return false
end