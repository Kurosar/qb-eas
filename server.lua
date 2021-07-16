local function isAdmin(source)
    local allowed = false
    for i,id in ipairs(Config.EAS.admins) do
        for x,pid in ipairs(GetPlayerIdentifiers(source)) do
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
	end
	
	if IsPlayerAceAllowed(source, "lance.eas") then
		allowed = true
	else
		print("NOT ALLOWED TO USE EAS")
		allowed = false
	end
    return allowed
end

RegisterCommand("eas-lspd", function(source, args, rawCommand)
	if (isAdmin(source)) then
		CancelEvent()
		local msg = table.concat(args, " ")
		TriggerClientEvent("SendAlert", -1, "Los Santos Police Department", msg)
	end
end)

RegisterCommand("eas-lsfd", function(source, args, rawCommand)
	if (isAdmin(source)) then
		CancelEvent()
		local msg = table.concat(args, " ")
		TriggerClientEvent("SendAlert", -1, "Los Santos Fire Department", msg)
	end
end)

