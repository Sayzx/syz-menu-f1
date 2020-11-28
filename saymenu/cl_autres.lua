ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	end
  end)

  ragdol = true

  RegisterNetEvent("Ragdoll") 
  AddEventHandler("Ragdoll", function()
      if ( ragdol ) then
          setRagdoll(true)
          ragdol = false
          ESX.ShowColoredNotification("Vous etes par terre !", 6)
      else
  
          setRagdoll(false)
          ragdol = true
          ESX.ShowColoredNotification("Vous etes debout !", 18)
      end
  end)

  
  function startScenario(anim)
      TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
  end
  
  function startAttitude(lib, anim)
      ESX.Streaming.RequestAnimSet(lib, function()
          SetPedMovementClipset(PlayerPedId(), anim, true)
      end)
  end
  
  function startAnim(lib, anim)
      ESX.Streaming.RequestAnimDict(lib, function()
          TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
      end)
  end


local papiers = {
    "Montrer",
    "Regarder"
}
 
local dev = {
    "~r~Sayzun",
    "~g~Say#8314",
}

local f5 = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = GetPlayerServerId() },
	Data = { currentMenu = "Menu Server", GetPlayerName() }, 
    Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)
			
			
		if btn == "Vetements  " then                                      
            OpenMenu('Menu')

      
 


    
end
end




	},
	
	Menu = { 
		["Menu Server"] = { 
			b = { 
                {name = "Développed", slidemax = dev},
                {name = "Touches", ask = ">", askX = true}, 
                {name = "Liens", ask = ">", askX = true}, 


			}
        },
        ["touches"] = { 
			b = { 
                {name = "~y~F1 > Menu Serveur", ask = ">", askX = true}, 
                {name = "~r~F2 > Télephone", ask = ">", askX = true}, 
                {name = "~r~F3 > Menu Emotes", ask = ">", askX = true}, 
                {name = "~r~F5 > Menu Personnel", ask = ">", askX = true},
                {name = "~r~F6 > Menu Métiers", ask = ">", askX = true},
                {name = "~r~F7 > Menu Gangs", ask = ">", askX = true},
                {name = "~r~F8 > Console", ask = ">", askX = true},
                {name = "~p~G > Croiser les bras", ask = ">", askX = true},
                {name = "~p~= > Lever les mains", ask = ">", askX = true},
                {name = "~b~K > Ceinture", ask = ">", askX = true},
                {name = "~b~B > Pointer du Doigt", ask = ">", askX = true},
                {name = "~r~/report > Faire un Report pour un STAFF", ask = ">", askX = true},

			}
        },
        ["liens"] = { 
			b = { 
                {name = "~g~Discord > discord.gg/r6zjs2cB", ask = ">", askX = true}, 
                {name = "~g~Top Serveur > https://cutt.ly/0hiW2gU", ask = ">", askX = true}, 
                {name = "~g~Site > https://cutt.ly/UhiW64M", ask = ">", askX = true}, 



			}
        },

        ["menu serveur"] = { 
			b = { 
                {name = "~g~Discord > discord.gg/r6zjs2cB", ask = ">", askX = true}, 
                {name = "~g~Top Serveur > https://cutt.ly/0hiW2gU", ask = ">", askX = true}, 
                {name = "~g~Site > https://cutt.ly/UhiW64M", ask = ">", askX = true}, 



			}
        },
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    }
}
		






Citizen.CreateThread(function()
    while true do
        Wait(1)
        if IsControlJustReleased(0, 288) then
            CreateMenu(f5)
        end  
    end
end)

local ragdoll = false
function setRagdoll(flag)
  ragdoll = flag
end
Citizen.CreateThread(function()
  while true do
	Citizen.Wait(0)
	if ragdoll then
	  SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
	end
  end
end)
----haut
RegisterNetEvent('RiZiePersoMenu:haut')

AddEventHandler('RiZiePersoMenu:haut', function()

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)

        TriggerEvent('skinchanger:getSkin', function(skinb)

            local lib, anim = 'clothingtie', 'try_tie_neutral_a'

            ESX.Streaming.RequestAnimDict(lib, function()

                TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

            end)

            Citizen.Wait(1000)

            ClearPedTasks(PlayerPedId())



            if skina.torso_1 ~= skinb.torso_1 then

                vethaut = true

                TriggerEvent('skinchanger:loadClothes', skinb, {['torso_1'] = skina.torso_1, ['torso_2'] = skina.torso_2, ['tshirt_1'] = skina.tshirt_1, ['tshirt_2'] = skina.tshirt_2, ['arms'] = skina.arms})

            else

                TriggerEvent('skinchanger:loadClothes', skinb, {['torso_1'] = 15, ['torso_2'] = 0, ['tshirt_1'] = 15, ['tshirt_2'] = 0, ['arms'] = 15})

                vethaut = false

            end



        end)

    end)

end)
----bas
RegisterNetEvent('RiZiePersoMenu:bas')

AddEventHandler('RiZiePersoMenu:bas', function()

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)

        TriggerEvent('skinchanger:getSkin', function(skinb)

            local lib, anim = 'clothingtrousers', 'try_trousers_neutral_c'

            ESX.Streaming.RequestAnimDict(lib, function()

                TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

            end)

            Citizen.Wait(1000)

            ClearPedTasks(PlayerPedId())



            if skina.pants_1 ~= skinb.pants_1 then

                TriggerEvent('skinchanger:loadClothes', skinb, {['pants_1'] = skina.pants_1, ['pants_2'] = skina.pants_2})

                vetbas = true

            else

                vetbas = false

                if skina.sex == 1 then

                    TriggerEvent('skinchanger:loadClothes', skinb, {['pants_1'] = 15, ['pants_2'] = 0})

                else

                    TriggerEvent('skinchanger:loadClothes', skinb, {['pants_1'] = 61, ['pants_2'] = 1})

                end

            end





        end)

    end)

end)
---chaussure
RegisterNetEvent('RiZiePersoMenu:chaussures')

AddEventHandler('RiZiePersoMenu:chaussures', function()

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)

        TriggerEvent('skinchanger:getSkin', function(skinb)

            local lib, anim = 'clothingshoes', 'try_shoes_positive_a'

            ESX.Streaming.RequestAnimDict(lib, function()

                TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

            end)

            Citizen.Wait(1000)

            ClearPedTasks(PlayerPedId())



            if skina.shoes_1 ~= skinb.shoes_1 then

                TriggerEvent('skinchanger:loadClothes', skinb, {['shoes_1'] = skina.shoes_1, ['shoes_2'] = skina.shoes_2})

                vetch = true

            else

                vetch = false

                if skina.sex == 1 then

                    TriggerEvent('skinchanger:loadClothes', skinb, {['shoes_1'] = 35, ['shoes_2'] = 0})

                else

                    TriggerEvent('skinchanger:loadClothes', skinb, {['shoes_1'] = 34, ['shoes_2'] = 0})

                end

            end





        end)

    end)

end)
---sac
RegisterNetEvent('RiZiePersoMenu:sac')

AddEventHandler('RiZiePersoMenu:sac', function()

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)

        TriggerEvent('skinchanger:getSkin', function(skinb)

            local lib, anim = 'clothingtie', 'try_tie_neutral_a'

            ESX.Streaming.RequestAnimDict(lib, function()

                TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

            end)

            Citizen.Wait(1000)

            ClearPedTasks(PlayerPedId())



            if skina.bags_1 ~= skinb.bags_1 then

                TriggerEvent('skinchanger:loadClothes', skinb, {['bags_1'] = skina.bags_1, ['bags_2'] = skina.bags_2})

                vetsac = true

            else

                TriggerEvent('skinchanger:loadClothes', skinb, {['bags_1'] = 0, ['bags_2'] = 0})

                vetsac = false

            end

        end)

    end)

end)
-----Gilet
RegisterNetEvent('RiZiePersoMenu:gilet')

AddEventHandler('RiZiePersoMenu:gilet', function()

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)

        TriggerEvent('skinchanger:getSkin', function(skinb)

            local lib, anim = 'clothingtie', 'try_tie_neutral_a'

            ESX.Streaming.RequestAnimDict(lib, function()

                TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

            end)

            Citizen.Wait(1000)

            ClearPedTasks(PlayerPedId())



            if skina.bproof_1 ~= skinb.bproof_1 then

                TriggerEvent('skinchanger:loadClothes', skinb, {['bproof_1'] = skina.bproof_1, ['bproof_2'] = skina.bproof_2})

                vetgilet = true

            else

                TriggerEvent('skinchanger:loadClothes', skinb, {['bproof_1'] = 0, ['bproof_2'] = 0})

                vetgilet = false

            end

        end)

    end)

end)
---accessoire
RegisterNetEvent('RiZiePersoMenu:access')

AddEventHandler('RiZiePersoMenu:access', function(accesstype)

    ESX.TriggerServerCallback('esx_accessories:get', function(eskilaunAccessoires, accessorySkin)

        _accessoire = string.lower(accesstype)

        if eskilaunAccessoires then  

            TriggerEvent('skinchanger:getSkin', function(skin)

                local accessoire = -1

                local couleur = 0



                if _accessoire == "glasses" then

                    accessoire = 0

                    local lib, anim = 'clothingspecs', 'try_glasses_positive_a'

                    ESX.Streaming.RequestAnimDict(lib, function()

                        TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, 1000, 0, 0, false, false, false)

                    end)

                    Citizen.Wait(1000)

                    ClearPedTasks(PlayerPedId())

                elseif _accessoire == "mask" then

                    accessoire = 0

                    local lib, anim = 'missfbi4', 'takeoff_mask'

                    ESX.Streaming.RequestAnimDict(lib, function()

                        TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, 1000, 0, 0, false, false, false)

                    end)

                    Citizen.Wait(850)

					ClearPedTasks(PlayerPedId())
					

                elseif _accessoire == "helmet" then

                    local lib, anim = 'missfbi4', 'takeoff_mask'

                    ESX.Streaming.RequestAnimDict(lib, function()

                        TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, 1000, 0, 0, false, false, false)

                    end)

                    Citizen.Wait(850)

                    ClearPedTasks(PlayerPedId())

                end

                



                if skin[_accessoire .. '_1'] == accessoire then

                    accessoire = accessorySkin[_accessoire .. '_1']

                    couleur = accessorySkin[_accessoire .. '_2']

                    if _accessoire == "glasses" then

                        vetlunettes = true

                    elseif _accessoire == "mask" then

                        vetmasque = true

                    elseif _accessoire == "helmet" then

                        vetchapeau = true

                    end

                else

                    if _accessoire == "glasses" then

                        vetlunettes = false

                    elseif _accessoire == "mask" then

                        vetmasque = false

                    elseif _accessoire == "helmet" then

                        vetchapeau = false

                    end

                end



                local accessorySkin = {}

                accessorySkin[_accessoire .. '_1'] = accessoire

                accessorySkin[_accessoire .. '_2'] = couleur

                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)

            end)

        else

            if _accessoire == "glasses" then

                ESX.ShowNotification(_U('clothes_you_do_not_have_glasses'))

            elseif _accessoire == "mask" then

                ESX.ShowNotification(_U('clothes_you_do_not_have_mask'))

            elseif _accessoire == "helmet" then

                ESX.ShowNotification(_U('clothes_you_do_not_have_helmet'))

            end

        end

    end, accesstype)

end)
