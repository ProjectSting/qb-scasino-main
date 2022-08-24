local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = true
PlayerJob = {}

local onDuty = false

Citizen.CreateThread(function ()
    exports['qb-target']:AddBoxZone("casinoDuty", vector3(966.11, 47.05, 71.7), 0.5, 0.5,{
        name = "casinoDuty",
		heading = 330,
		debugPoly = false,
        minZ=68.1,
        maxZ=72.1
    }, {
        options = {
            {
                event = "qb-scasino:dutymenu",
                icon = "far fa-clipboard",
                label = "Casino Options",
                job = "casino",
            },
        },
        distance = 1.5
    })
        exports['qb-target']:AddBoxZone("casino_tray_1", vector3(977.22, 25.34, 71.46), 1, 1,{
            name = "casino_tray_1",
            heading = 325,
            debugPoly = false,
            minZ=68.06,
            maxZ=72.06
        },{
            options = {
                {
                    event = "qb-scasino:Tray1",
                    icon = "far fa-clipboard",
                    label = "Bar Item",
                },
            },
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("casino_tray_2", vector3(345.46, -884.17, 29.34), 0.7, 0.6,{
            name = "casino_tray_2",
            heading = 270,
            debugPoly = false,
            minZ=25.54,
            maxZ=29.54
        },{
            options = {
                {
                    event = "qb-scasino:Tray2",
                    icon = "far fa-clipboard",
                    label = "Tray 2",
                },
            },
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("casino_tray_3", vector3(346.87, -884.2, 29.34), 0.7, 0.6,{
            name = "casino_tray_3",
            heading = 270,
            debugPoly = false,
            minZ=25.54,
            maxZ=29.54
        },{
            options = {
                {
                    event = "qb-scasino:Tray3",
                    icon = "far fa-clipboard",
                    label = "Tray 3",
                },
            },
            distance = 1.5
        
        })
        exports['qb-target']:AddBoxZone("casino_tray_4", vector3(990.87, 32.78, 71.47), 1, 0.2, {
            name = "casino_tray_4",
            heading = 125,
            debugPoly = false,
            minZ=67.87,
            maxZ=71.87
        },{
            options = {
                {
                    event = "qb-scasino:Tray4",
                    icon = "far fa-clipboard",
                    label = "Items",
                },
            },
            distance = 1.5
        
        })
		exports['qb-target']:AddBoxZone("casino_tray_5", vector3(989.79, 31.54, 71.47), 1, 0.2, {
            name = "casino_tray_5",
            heading = 150,
            debugPoly = false,
            minZ=67.87,
            maxZ=71.87
        },{
            options = {
                {
                    event = "qb-scasino:Tray5",
                    icon = "far fa-clipboard",
                    label = "Items",
                },
            },
            distance = 1.5
        
        })
		exports['qb-target']:AddBoxZone("casino_tray_6", vector3(989.25, 30.05, 71.47), 1, 0.2, {
            name = "casino_tray_6",
            heading = 355,
            debugPoly = false,
            minZ=67.87,
            maxZ=71.87
        },{
            options = {
                {
                    event = "qb-scasino:Tray6",
                    icon = "far fa-clipboard",
                    label = "Items",
                },
            },
            distance = 1.5
        
        })
		exports['qb-target']:AddBoxZone("Casino_CustomerMenu", vector3(981.99, 24.17, 71.46), 0.5, 0.5,{
            name = "Casino_CustomerMenu",
            heading = 285,
            debugPoly = false,
            minZ=68.06,
            maxZ=72.06
        },{
            options = {
                {
                    event = "qb-menu:ViewCasinoDrinks",
                    icon = "fas	fa-cocktail",
                    label = "View Menu",
                },
            },
            distance = 1.5
        
        })
		exports['qb-target']:AddBoxZone("Casino_CustomerMenuOne", vector3(978.71, 26.13, 71.46), 0.3, 0.4,{
            name = "Casino_CustomerMenuOne",
            heading = 305,
            debugPoly = false,
            minZ=68.06,
            maxZ=72.06
        },{
            options = {
                {
                    event = "qb-menu:ViewCasinoDrinks",
                    icon = "fas	fa-cocktail",
                    label = "View Menu",
                },
            },
            distance = 1.5
        
        })
		exports['qb-target']:AddBoxZone("Casino_CustomerMenuTwo", vector3(978.29, 21.73, 71.46), 0.3, 0.4,{
            name = "Casino_CustomerMenuTwo",
            heading = 335,
            debugPoly = false,
            minZ=68.06,
            maxZ=72.06
        },{
            options = {
                {
                    event = "qb-menu:ViewCasinoDrinks",
                    icon = "fas	fa-cocktail",
                    label = "View Menu",
                },
            },
            distance = 1.5
        
        })
		exports['qb-target']:AddBoxZone("casinodrinks", vector3(979.54, 23.84, 71.46), 1.5, 1.5, {
            name="casinodrinks",
            heading=280,
            debugPoly=false,
            minZ=69.06,
            maxZ=73.06,
            }, {
            options = {
                {
                event = "qb-scasino:DrinksMenu",
                icon = "fas fa-filter",
                label = "Make Some Drinks",
                job = "casino",
                },
            },
            distance = 1.5
            })
    
    
             exports['qb-target']:AddBoxZone("burgerfridge",vector3(979.93, 23.43, 71.46), 1, 1, {
                name="burgerfridge",
                heading=310,
                debugPoly=false,
                minZ=67.46,
                maxZ=71.46,
            }, {
                    options = {
                        {
                            event = "qb-scasino:OrderMenu",
                            icon = "fas fa-laptop",
                            label = "Order Ingredients!",
                            job = "casino",
                        },
                    },
                    distance = 1.5
                })
    
            exports['qb-target']:AddBoxZone("casinodisplay",vector3(981.39, 21.95, 71.46), 1, 2,  {
                name="casinodisplay",
                heading=225,
                debugPoly=false,
                minZ=67.46,
                maxZ=71.46,
            }, {
                    options = {
                        {
                            event = "qb-scasino:Storage",
                            icon = "fas fa-box",
                            label = "Storage",
                            job = "casino",
                        },
                    },
                    distance = 1.5
                })
    
            exports['qb-target']:AddBoxZone("casino_register_1", vector3(980.69, 26.04, 71.46), 0.5, 0.5, {
                name="casino_register_1",
                debugPoly=false,
                heading=340,
                minZ=67.86,
                maxZ=71.86,
            }, {
                    options = {
                        {
                            event = "qb-scasino:bill",
                            parms = "1",
                            icon = "fas fa-credit-card",
                            label = "Charge Customer",
                            job = "casino",
                        },
                    },
                    distance = 1.5
                })
    
            exports['qb-target']:AddBoxZone("casino_register_2", vector3(977.03, 23.83, 71.46), 0.5, 0.5, {
                name="casino_register_2",
                debugPoly=false,
                heading=275,
                minZ=67.86,
                maxZ=71.86,
                }, {
                        options = {
                            {
                                event = "qb-scasino:bill",
                                parms = "2",
                                icon = "fas fa-credit-card",
                                label = "Charge Customer",
                                job = "casino",
                            },
                        },
                        distance = 1.5
                    })  
            
			
    
            exports['qb-target']:AddBoxZone("casino_register_3", vector3(980.76, 21.69, 71.46), 0.5, 0.5, {
                name="casino_register_3",
                debugPoly=false,
                heading=305,
                minZ=67.86,
                maxZ=71.86,
                }, {
                        options = {
                            {
                                event = "qb-scasino:bill",
                                parms = "3",
                                icon = "fas fa-credit-card",
                                label = "Charge Customer",
                                job = "casino",
                            },
                        },
                        distance = 1.5
                    })  
    

   
            exports['qb-target']:AddBoxZone("casino_register_4", vector3(991.05, 32.57, 71.47), 0.2, 0.2, {
                name="casino_register_4",
                debugPoly=false,
                heading=305,
                minZ=67.67,
                maxZ=71.67,
                }, {
                        options = {
                            {
                                event = "qb-scasino:bill",
                                parms = "4",
                                icon = "fas fa-credit-card",
                                label = "Charge Customer",
                                job = "casino",
                            },
                        },
                        distance = 1.5
                    }) 

            
			
			exports['qb-target']:AddBoxZone("casino_register_5", vector3(989.87, 31.43, 71.47), 0.2, 0.2, {
                name="casino_register_5",
                debugPoly=false,
                heading=325,
                minZ=67.67,
                maxZ=71.67,
                }, {
                        options = {
                            {
                                event = "qb-scasino:bill",
                                parms = "4",
                                icon = "fas fa-credit-card",
                                label = "Charge Customer",
                                job = "casino",
                            },
                        },
                        distance = 1.5
                    }) 



            exports['qb-target']:AddBoxZone("casino_register_6", vector3(989.39, 29.88, 71.47), 0.2, 0.2, {
                name="casino_register_6",
                debugPoly=false,
                heading=325,
                minZ=67.67,
                maxZ=71.67,
                }, {
                        options = {
                            {
                                event = "qb-scasino:bill",
                                parms = "4",
                                icon = "fas fa-credit-card",
                                label = "Charge Customer",
                                job = "casino",
                            },
                        },
                        distance = 1.5
                    })




            exports['qb-target']:AddBoxZone("casino_chips", vector3(991.61, 32.81, 71.47), 1, 0.3, {
                name="casino_chips",
                debugPoly=false,
                heading=290,
                minZ=67.67,
                maxZ=71.67,
                }, {
                        options = {
                            {
                                event = "qb-scasino:OrderMenu1",
                                icon = "fas fa-credit-card",
                                label = "Casino Chips",
                                job = "casino",
                            },
                        },
                        distance = 1.5
                    }) 
			
			
			
			exports['qb-target']:AddBoxZone("casino_chips1", vector3(990.31, 31.93, 71.47), 1, 0.3, {
                name="casino_chips1",
                debugPoly=false,
                heading=140,
                minZ=67.67,
                maxZ=71.67,
                }, {
                        options = {
                            {
                                event = "qb-scasino:OrderMenu1",
                                icon = "fas fa-credit-card",
                                label = "Casino Chips",
                                job = "casino",
                            },
                        },
                        distance = 1.5
                    }) 
			
			

            exports['qb-target']:AddBoxZone("casino_chips2", vector3(989.52, 30.46, 71.47), 1, 0.3, {
                name="casino_chips2",
                debugPoly=false,
                heading=350,
                minZ=67.67,
                maxZ=71.67,
                }, {
                        options = {
                            {
                                event = "qb-scasino:OrderMenu1",
                                icon = "fas fa-credit-card",
                                label = "Casino Chips",
                                job = "casino",
                            },
                        },
                        distance = 1.5
                    })    
			
			
			


end)

-- MENU - CONTCT ---

RegisterNetEvent('qb-scasino:dutymenu', function(data)

    exports['qb-menu']:openMenu({
       {
           header = "Casino Options",
           isMenuHeader = true, -- Set to true to make a nonclickable title
       },
       {
           header = "Clock On or Off",
           txt = "Duty On/Off",
           params = {
               event = "qb-scasino:DutyB", 
               args = {
                   number = 0,
               }
           }
       },
       {
           header = "• Manage Business",
           txt = "Manage Casino",
           params = {
               event = "qb-bossmenu:client:OpenMenu", 
               args = {
                   number = 1,
               }
           }
       },
	   {
           header = "close",
           txt = "",
           params = {
               event = "",
               args = {
                   number = 2,
               }
           }
       },
   })
   end)

RegisterNetEvent('qb-scasino:OrderMenu', function(data)

    exports['qb-menu']:openMenu({
       {
           header = "Fridge",
           isMenuHeader = true, -- Set to true to make a nonclickable title
       },
       {
           header = "• Order Ingredients",
           txt = "Order Items",
           params = {
               event = "qb-scasino:shop", 
               args = {
                   number = 0,
               }
           }
       },
       {
           header = "close",
           txt = "",
           params = {
               event = "",
               args = {
                   number = 1,
               }
           }
       },
   })
   end)

RegisterNetEvent('qb-scasino:OrderMenu1', function(data)

    exports['qb-menu']:openMenu({
       {
           header = "Price $100 for 1 Chip",
           isMenuHeader = true, -- Set to true to make a nonclickable title
       },
	   {
           header = "• Order Chips",
           txt = "Order Items",
           params = {
               event = "qb-scasino:shopcasino", 
               args = {
                   number = 0,
               }
           }
       },
       {
           header = "close",
           txt = "",
           params = {
               event = "",
               args = {
                   number = 1,
               }
           }
       },
   })
   end)


    RegisterNetEvent('qb-scasino:DrinksMenu', function(data)

    exports['qb-menu']:openMenu({
       {
           header = "Drinks Menu",
           isMenuHeader = true, -- Set to true to make a nonclickable title
       },
       {
           header = "• Cherry Cocktail",
           txt = "1.Cherry 1.Wiskey 1.Glass",
           params = {
               event = "qb-scasino:CherryCocktail", 
               args = {
                   number = 0,
               }
           }
       },
       {
           header = "• Apple Cocktail",
           txt = "1.Apple 1.Wiskey 1.Glass",
           params = {
               event = "qb-scasino:AppleCocktail",
               args = {
                   number = 1,
               }
           }
       },
       {
           header = "• Banana Cocktail",
           txt = "1.Banana 1.Wiskey 1.Glass",
           params = {
               event = "qb-scasino:BananaCocktail",
               args = {
                   number = 2,
               }
           }
       },       
       {
           header = "• Kiwi Cocktail",
           txt = "1.Kiwi 1.Wiskey 1.Glass",
           params = {
               event = "qb-scasino:KiwiCocktail",
               args = {
                   number = 3,
               }
           }
       },             
       {
           header = "• Sexonthebeach",
           txt = "1.Kiwi 1.Apple 1.Wiskey 1.Glass 1.Ice",
           params = {
               event = "qb-scasino:SexonthebeachCocktail",
               args = {
                   number = 4,
               }
           }
       },
	   {
           header = "• Margarita",
           txt = "1.Kiwi 1.Apple 1.Vodka 1.Glass 1.Ice",
           params = {
               event = "qb-scasino:MargaritaCocktail",
               args = {
                   number = 5,
               }
           }
       },
	   {
           header = "• Junglejim",
           txt = "1.Kiwi 1.Apple 1.Banana 1.Vodka 1.Ice 1.Glass",
           params = {
               event = "qb-scasino:JunglejimCocktail",
               args = {
                   number = 6,
               }
           }
       },
	   {
           header = "• Paradise Cocktail",
           txt = "Livin\' a Paradise!",
           params = {
               event = "qb-scasino:ParadiseCocktail",
               args = {
                   number = 7,
               }
           }
       },              
       {
           header = "close",
           txt = "",
           params = {
               event = "",
               args = {
                   number = 8,
               }
           }
       },
   })
   end)

    RegisterNetEvent('qb-menu:ViewCasinoDrinks', function(data)
    
	exports['qb-menu']:openMenu({
        {
            
            header = "| Drinks Menu |",
            isMenuHeader = true, 
        },
        {
            
            header = "• Cherry Cocktail",
            txt = "",
            isMenuHeader = true,
        },
        {
            
            header = "• Apple Cocktail",
            txt = "",
            isMenuHeader = true,
        },  
        {
            
            header = "• Banana Cocktail",
            txt = "",
            isMenuHeader = true,
        },
        {
            
            header = "• Kiwi Cocktail",
            txt = "",
           isMenuHeader = true,
        },
        {
            
            header = "• Paradise Cocktail",
            txt = "",
            isMenuHeader = true,
        },
		{
            
            header = "• Sexonthebeach",
            txt = "",
            isMenuHeader = true,
        },
        {
            
            header = "• Margarita",
            txt = "",
            isMenuHeader = true,
        },
		{
            
            header = "• Junglejim",
            txt = "",
            isMenuHeader = true,
        },
		{
           header = "close",
           txt = "",
           params = {
               event = "",
               args = {
                   number = 10,
               }
           }
       },
    })
    end)

-- Till Stuff --
RegisterNetEvent("qb-scasino:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Cash Register",
        submitText = "Charge Customer",
        inputs = {
            {
                type = 'number',
                name = 'id',
                text = 'Citizen Id',
                isRequired = true

            },
            {
                type = 'number',
                name = 'amount',
                text = '$0.00',
                isRequired = true

            }
        }
    })
    if bill then
        if not bill.id or not bill.amount then return end
        TriggerServerEvent("qb-scasino:bill:player", bill.id, bill.amount)
    end
end)

-- Drawtext -
function DrawText3D(x, y, z, text)
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


Citizen.CreateThread(function()
    if Config.Eye == "false" then
    local PlayerData = QBCore.Functions.GetPlayerData()
    while true do
        local sleep = 100
        if isLoggedIn then
            local pos = GetEntityCoords(PlayerPedId())
            if PlayerJob.name == 'casino' then
                for k, v in pairs(Config.Locations["duty"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 5 then
                        if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                            if onDuty then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Get off duty")
                            else
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Get on duty")
                            end
                            if IsControlJustReleased(0, 38) then
                                onDuty = not onDuty
                                TriggerServerEvent("QBCore:ToggleDuty")
                            end
                        elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "on/off duty")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["drinks"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Make Drinks")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-scasino:DrinksMenu")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "Make Drinks")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["fridge"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Open Fridge")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-scasino:shop")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "Open Fridge")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["storage"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Open Storage")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-scasino:Storage")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "Open Storage")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["cashregister"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Cash Register")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-scasino:bill")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "Cash Register")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["garage"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Garage")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("garage:casinoGarage")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "Garage")
                            end  
                        end
                    end
                end
            else
                Citizen.Wait(2000)
            end
            
            for k, v in pairs(Config.Locations["tray1"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Tray")
                            if IsControlJustReleased(0, 38) then
                                TriggerEvent("qb-scasino:Tray1")
                            end
                        elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "Tray")
                        end  
                end
            end

            for k, v in pairs(Config.Locations["tray2"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Tray")
                            if IsControlJustReleased(0, 38) then
                                TriggerEvent("qb-scasino:Tray2")
                            end
                        elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "Tray")
                        end  
                end
            end

            for k, v in pairs(Config.Locations["tray3"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Tray")
                            if IsControlJustReleased(0, 38) then
                                TriggerEvent("qb-scasino:Tray3")
                            end
                        elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "Tray")
                        end  
                end
            end
        end
        Citizen.Wait(sleep)
    end
end
end)