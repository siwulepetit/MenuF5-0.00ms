--[[si tu veux rajouter la categorie inventaire  dans mon menu

 tu mes sa sur le code ici :
RageUI.ButtonWithStyle('Inventaire', nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
    if Selected then
        TrggerEvent('siwu:openInventaire')
    end
end)

et dans ton scipt dinventaire tu mais sa
RegisterNetEvent('siwu:openInventaire')
AddEventHandler('siwu:openInventaire', function()
   ici tu mais ta fonction pour louvrir le menu inventaire
end)
]]




RegisterKeyMapping('+openF5', 'open the menu F5', 'keyboard', 'F5')





function OpenMenu()

    local menuTest = RageUI.CreateMenu("Menu personnel","infos")

    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do

        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()

            RageUI.ButtonWithStyle("→clés", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    RageUI.CloseAll()
                    TriggerEvent("vehicle_lock:mesclefs")
                end
            end)
            RageUI.ButtonWithStyle("→Divers", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    Divers()
                end
            end)
            RageUI.ButtonWithStyle("→~r~Quitter", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    RageUI.CloseAll()
                end
            end)


        end, function()
        end)

        if not RageUI.Visible(menuTest) then
            menuTest=RMenu:DeleteType("Affichage", true)
        end

    end

end


function Portefeuille()


    local menuTest = RageUI.CreateMenu("Menu personnel","infos")

    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do

        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()


        end, function()
        end)

        if not RageUI.Visible(menuTest) then
            menuTest=RMenu:DeleteType("", true)
        end

    end

end


function Divers()


    local menuTest = RageUI.CreateMenu("Diversvers","")

    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do

        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()
            RageUI.Separator("")
            RageUI.Separator("Inforamtion Personnel")

            RageUI.Separator("Ton nom  : "..GetPlayerName(PlayerId()))
            RageUI.ButtonWithStyle("→ID", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerEvent("esx:showNotification", "Ton ID est le : "..GetPlayerServerId(PlayerId()))
                    OpenMenu()
                end
            end)
            RageUI.ButtonWithStyle("→Discord", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerEvent("esx:showNotification", "Rejoin notre discord https://discord.gg/hyperiaRP" )
                    OpenMenu()
                end
            end)

            if not RageUI.Visible(menuTest) then
                menuTest=RMenu:DeleteType("", true)
            end

        end, function()
        end)

    end

end

RegisterCommand("+openF5",function()
    OpenMenu()
end)