local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
PlayerJob = {}

local onDuty = false

function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function ()
    QBCore.Functions.GetPlayerData(function (PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "casino" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore.Client:OnJobUpdate', function (JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

CreateThread(function()
    for k, station in pairs(Config.Locations["stations"]) do
        local blip = AddBlipForCoord(station.coords.x, station.coords.y, station.coords.z)
        SetBlipSprite(blip, 617)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.70)
        SetBlipColour(blip, 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(station.label)
        EndTextCommandSetBlipName(blip)
    end
end)

RegisterNetEvent("qb-scasino:DutyB")
AddEventHandler("qb-scasino:DutyB", function ()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-scasino:Tray1")
AddEventHandler("qb-scasino:Tray1", function ()
    TriggerEvent("inventory:client:SetCurrentStash", "casinotray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "casinotray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-scasino:Tray2")
AddEventHandler("qb-scasino:Tray2", function ()
    TriggerEvent("inventory:client:SetCurrentStash", "casinotray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "casinotray2", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-scasino:Tray3")
AddEventHandler("qb-scasino:Tray3", function ()
    TriggerEvent("inventory:client:SetCurrentStash", "casinotray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "casinotray3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-scasino:Tray4")
AddEventHandler("qb-scasino:Tray4", function ()
    TriggerEvent("inventory:client:SetCurrentStash", "casinotray4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "casinotray4", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-scasino:Tray5")
AddEventHandler("qb-scasino:Tray5", function ()
    TriggerEvent("inventory:client:SetCurrentStash", "casinotray5")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "casinotray5", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-scasino:Tray6")
AddEventHandler("qb-scasino:Tray6", function ()
    TriggerEvent("inventory:client:SetCurrentStash", "casinotray6")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "casinotray6", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-scasino:Storage")
AddEventHandler("qb-scasino:Storage", function ()
    TriggerEvent("inventory:client:SetCurrentStash", "casinostorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "casinostorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-scasino:CherryCocktail")
AddEventHandler("qb-scasino:CherryCocktail", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-scasino:server:get:ingredientcherrycocktail', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Cherry Cocktail..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocktailglassglass", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cherry", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "cherrycocktail", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocktailglass"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cherry"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["whiskey"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cherrycocktail"], "add")
                    			QBCore.Functions.Notify("You made a Cherry Cocktail", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-scasino:AppleCocktail")
AddEventHandler("qb-scasino:AppleCocktail", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-scasino:server:get:ingredientapplecocktail', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making an Apple Cocktail..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocktailglass", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "apple", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "applecocktail", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocktailglass"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["apple"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["whiskey"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["applecocktail"], "add")
                    			QBCore.Functions.Notify("You made an Apple Cocktail", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-scasino:BananaCocktail")
AddEventHandler("qb-scasino:BananaCocktail", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-scasino:server:get:ingredientbananacocktail', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Banana Cocktail..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocktailglass", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "banana", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "bananacocktail", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocktailglass"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["whiskey"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["banana"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bananacocktail"], "add")
                    			QBCore.Functions.Notify("You made a Banana Cocktail", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-scasino:SexonthebeachCocktail")
AddEventHandler("qb-scasino:SexonthebeachCocktail", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-scasino:server:get:ingredientSexonthebeachcocktail', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Sexonthebeach..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocktailglass", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "ice", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "kiwi", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "apple", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "sexonthebeach", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocktailglass"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ice"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["kiwi"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["apple"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["whiskey"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sexonthebeach"], "add")
                    			QBCore.Functions.Notify("You made a Sexonthebeach Cocktail", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-scasino:MargaritaCocktail")
AddEventHandler("qb-scasino:MargaritaCocktail", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-scasino:server:get:ingredientMargaritacocktail', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Margarita..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocktailglass", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "ice", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "kiwi", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "apple", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "vodka", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "margarita", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocktailglass"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ice"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["kiwi"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["apple"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["vodka"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["margarita"], "add")
                    			QBCore.Functions.Notify("You made a Margarita Cocktail", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-scasino:JunglejimCocktail")
AddEventHandler("qb-scasino:JunglejimCocktail", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-scasino:server:get:ingredientJunglejimcocktail', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Junglejim..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocktailglass", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "ice", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "kiwi", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "banana", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "apple", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "vodka", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "junglejim", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocktailglass"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ice"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["kiwi"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["banana"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["apple"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["vodka"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["junglejim"], "add")
                    			QBCore.Functions.Notify("You made a Junglejim Cocktail", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-scasino:KiwiCocktail")
AddEventHandler("qb-scasino:KiwiCocktail", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-scasino:server:get:ingredientkiwicocktail', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Kiwi Cocktail..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocktailglass", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "kiwi", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "kiwicocktail", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocktailglass"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["kiwi"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["whiskey"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["kiwicocktail"], "add")
                    			QBCore.Functions.Notify("You made a Kiwi Cocktail", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-scasino:ParadiseCocktail")
AddEventHandler("qb-scasino:ParadiseCocktail", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-scasino:server:get:ingredientparadisecocktail', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Paradise Cocktail..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocktailglass", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "apple", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cherry", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "kiwi", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "banana", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "watermelon", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "orange", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "lemon", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "lime", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "vodka", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "paradisecocktail", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocktailglass"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["apple"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cherry"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["kiwi"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["banana"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["watermelon"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["orange"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lemon"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lime"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["whiskey"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["vodka"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["paradisecocktail"], "add")
                    			QBCore.Functions.Notify("You made a Paradise Cocktail", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-scasino:shop")
AddEventHandler("qb-scasino:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "casino", Config.Items)
end)

RegisterNetEvent("qb-scasino:shopcasino")
AddEventHandler("qb-scasino:shopcasino", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "casino", Config.CasinoItems)
end)