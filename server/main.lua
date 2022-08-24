local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("qb-scasino:bill:player")
AddEventHandler("qb-scasino:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'casino' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                       if Config.SQL == 'oxmysql' then
                        exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        else
                          exports.ghmattimysql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                            ['@citizenid'] = billed.PlayerData.citizenid,
                            ['@amount'] = amount,
                            ['@society'] = biller.PlayerData.job.name,
                            ['@sender'] = biller.PlayerData.charinfo.firstname
                           })
                       end
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)

-----COCKTAIL----------------------------------------------------

QBCore.Functions.CreateCallback('qb-scasino:server:get:ingredientapplecocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local glass = Ply.Functions.GetItemByName("cocktailglass")
    local apple = Ply.Functions.GetItemByName("apple")
    local whiskey = Ply.Functions.GetItemByName("whiskey")
    if glass ~= nil and apple ~= nil and whiskey ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-scasino:server:get:ingredientbananacocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local glass = Ply.Functions.GetItemByName("cocktailglass")
    local banana = Ply.Functions.GetItemByName("banana")
    local whiskey = Ply.Functions.GetItemByName("whiskey")
    if glass ~= nil and banana ~= nil and whiskey ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-scasino:server:get:ingredientcherrycocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local glass = Ply.Functions.GetItemByName("cocktailglass")
    local cherry = Ply.Functions.GetItemByName("cherry")
    local whiskey = Ply.Functions.GetItemByName("whiskey")
    if glass ~= nil and cherry ~= nil and whiskey ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-scasino:server:get:ingredientkiwicocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local glass = Ply.Functions.GetItemByName("cocktailglass")
    local kiwi = Ply.Functions.GetItemByName("kiwi")
    local whiskey = Ply.Functions.GetItemByName("whiskey")
    if glass ~= nil and kiwi ~= nil and whiskey ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-scasino:server:get:ingredientSexonthebeachcocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local glass = Ply.Functions.GetItemByName("cocktailglass")
    local ice = Ply.Functions.GetItemByName("ice")
	local kiwi = Ply.Functions.GetItemByName("kiwi")
    local apple = Ply.Functions.GetItemByName("apple")
	local whiskey = Ply.Functions.GetItemByName("whiskey")
    if glass ~= nil and ice ~= nil and kiwi ~= nil and apple ~= nil and whiskey ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-scasino:server:get:ingredientMargaritacocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local glass = Ply.Functions.GetItemByName("cocktailglass")
    local ice = Ply.Functions.GetItemByName("ice")
	local kiwi = Ply.Functions.GetItemByName("kiwi")
    local apple = Ply.Functions.GetItemByName("apple")
	local vodka = Ply.Functions.GetItemByName("vodka")
    if glass ~= nil and ice ~= nil and kiwi ~= nil and apple ~= nil and vodka ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-scasino:server:get:ingredientJunglejimcocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local glass = Ply.Functions.GetItemByName("cocktailglass")
    local ice = Ply.Functions.GetItemByName("ice")
	local kiwi = Ply.Functions.GetItemByName("kiwi")
    local banana = Ply.Functions.GetItemByName("banana")
	local apple = Ply.Functions.GetItemByName("apple")
	local vodka = Ply.Functions.GetItemByName("vodka")
    if glass ~= nil and ice ~= nil and kiwi ~= nil and banana ~= nil and apple ~= nil and vodka ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-scasino:server:get:ingredientparadisecocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
	local vodka = Ply.Functions.GetItemByName("vodka")
	local glass = Ply.Functions.GetItemByName("cocktailglass")
    local apple = Ply.Functions.GetItemByName("apple")
    local cherry = Ply.Functions.GetItemByName("cherry")
    local kiwi = Ply.Functions.GetItemByName("kiwi")
    local banana = Ply.Functions.GetItemByName("banana")
    local watermelon = Ply.Functions.GetItemByName("watermelon")
    local orange = Ply.Functions.GetItemByName("orange")
    local lemon = Ply.Functions.GetItemByName("lemon")
    local lime = Ply.Functions.GetItemByName("lime")
    local whiskey = Ply.Functions.GetItemByName("whiskey")
    if glass ~= nil and cherry ~= nil and apple ~= nil and kiwi ~= nil and banana ~= nil and watermelon ~= nil and orange  ~= nil and lemon ~= nil and lime ~= nil then
        cb(true)
    else
        cb(false)
    end
end)