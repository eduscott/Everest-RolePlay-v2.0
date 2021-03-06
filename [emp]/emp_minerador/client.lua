local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("emp_minerador")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local servico = false
local selecionado = 1
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = { ['x'] = 2964.17, ['y'] = 2773.75, ['z'] = 40.07 },
	[2] = { ['x'] = 2972.28, ['y'] = 2775.42, ['z'] = 39.22 },
	[3] = { ['x'] = 2980.95, ['y'] = 2782.13, ['z'] = 40.11 },
	[4] = { ['x'] = 2982.18, ['y'] = 2786.82, ['z'] = 41.18 },
	[5] = { ['x'] = 2979.33, ['y'] = 2791.14, ['z'] = 41.66 },
	[6] = { ['x'] = 2977.03, ['y'] = 2792.15, ['z'] = 41.39 },
	[7] = { ['x'] = 2948.17, ['y'] = 2820.82, ['z'] = 43.59 },
	[8] = { ['x'] = 2944.89, ['y'] = 2819.99, ['z'] = 43.50 },
	[9] = { ['x'] = 2938.12, ['y'] = 2813.31, ['z'] = 43.50 },
	[10] = { ['x'] = 2928.33, ['y'] = 2788.93, ['z'] = 40.59 },
	[11] = { ['x'] = 2928.17, ['y'] = 2790.70, ['z'] = 40.80 },
	[12] = { ['x'] = 2925.87, ['y'] = 2792.45, ['z'] = 41.29 },
	[13] = { ['x'] = 2928.54, ['y'] = 2765.76, ['z'] = 44.54 },
	[14] = { ['x'] = 2930.78, ['y'] = 2762.25, ['z'] = 45.05 },
	[15] = { ['x'] = 2988.33, ['y'] = 2753.90, ['z'] = 43.53 },
	[16] = { ['x'] = 2991.33, ['y'] = 2776.70, ['z'] = 43.74 },
	[17] = { ['x'] = 2947.16, ['y'] = 2754.87, ['z'] = 43.90 },
	[18] = { ['x'] = 2993.83, ['y'] = 2753.21, ['z'] = 43.70 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if not servico then
			local ped = PlayerPedId()
			local vehicle = GetPlayersLastVehicle()
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z,GetEntityCoords(ped),true)

			if distance <= 100.0 then
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.3,0,0,0,0,180.0,130.0,0.6,0.8,0.5,255,0,0,50,1,0,0,1)
				if distance <= 1.2 and IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) and (GetEntityModel(vehicle) == -1705304628 or emP.checkPermissionMafia()) then
					servico = true
					TriggerEvent("cancelando",true)
					SetEntityCoords(ped,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-1)
					vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,28422)
					local tempo = 10000
					if emP.checkPermissionMafia() then
						tempo = 3000
					end
					SetTimeout(tempo,function()
						servico = false
						vRP._DeletarObjeto()
						vRP._stopAnim(false)
						TriggerEvent("cancelando",false)
						backentrega = selecionado
						while true do
							if backentrega == selecionado then
								selecionado = math.random(#locs)
							else
								break
							end
							Citizen.Wait(10)
						end
						emP.checkPayment()
					end)	
				end
			end
		end
	end
end)





-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAL 2
-----------------------------------------------------------------------------------------------------------------------------------------



local selecionado2 = 1
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs2 = {
	{x=2354.19, y=3588.11, z=52.68, h=299.61},
	{x=2351.26, y=3579.63, z=51.22, h=177.52},
	{x=2365.93, y=3565.14, z=55.23, h=269.8},
	{x=2372.14, y=3538.62, z=63.59, h=210.59},
	{x=2352.33, y=3553.99, z=54.07, h=162.06},
	{x=2310.1, y=3608.5, z=47.8, h=132.2},
	{x=2315.55, y=3627.85, z=45.99, h=3.12},
	{x=2250.74, y=3632.07, z=45.5, h=80.31},
	{x=2275.94, y=3665.85, z=41.3, h=20.42},
	{x=2271.03, y=3674.63, z=41.95, h=304.02},
	{x=2297.95, y=3676.87, z=50.41, h=337.93},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if not servico then
			local ped = PlayerPedId()
			local vehicle = GetPlayersLastVehicle()
			local distance = GetDistanceBetweenCoords(locs2[selecionado2].x,locs2[selecionado2].y,locs2[selecionado2].z,GetEntityCoords(ped),true)

			if distance <= 100.0 then
				DrawMarker(20,locs2[selecionado2].x,locs2[selecionado2].y,locs2[selecionado2].z-0.3,0,0,0,0,180.0,130.0,0.6,0.8,0.5,255,0,0,50,1,0,0,1)
				if distance <= 1.2 and IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) and (GetEntityModel(vehicle) == -1705304628 or emP.checkPermissionMafia()) then
					servico = true
					TriggerEvent("cancelando",true)
					SetEntityCoords(ped,locs2[selecionado2].x,locs2[selecionado2].y,locs2[selecionado2].z-1)
					vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,28422)
					local tempo = 10000
					if emP.checkPermissionMafia() then
						tempo = 6000
					end
					SetTimeout(tempo,function()
						servico = false
						vRP._DeletarObjeto()
						vRP._stopAnim(false)
						TriggerEvent("cancelando",false)
						backentrega = selecionado2
						while true do
							if backentrega == selecionado2 then
								selecionado2 = math.random(#locs2)
							else
								break
							end
							Citizen.Wait(10)
						end
						emP.checkPayment()
					end)	
				end
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAL 3
-----------------------------------------------------------------------------------------------------------------------------------------



local selecionado3 = 1
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs3 = {
	{x=-576.63, y= 2111.31, z= 132.8, h=299.61},
	{x=-594.84, y= 2094.2, z= 131.78, h=177.52},
	{x=-579.4, y= 2122.59, z= 132.42, h=269.8},
	{x=-583.32, y= 2140.71, z= 131.15, h=210.59},
	{x=-601.19, y= 2088.65, z= 132.63, h=162.06},
	{x=-609.74, y= 2086.33, z= 132.14, h=132.2},
	{x=-611.75, y= 2128.58, z= 128.57, h=3.12},
	{x=-593.08, y= 2148.67, z= 130.41, h=80.31},
	{x=-607.32, y= 2098.23, z= 128.98, h=20.42},
	{x=-619.31, y= 2130.41, z= 124.19, h=304.02},
	{x=-598.89, y= 2098.68, z= 130.51, h=337.93},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if not servico then
			local ped = PlayerPedId()
			local vehicle = GetPlayersLastVehicle()
			local distance = GetDistanceBetweenCoords(locs3[selecionado3].x,locs3[selecionado3].y,locs3[selecionado3].z,GetEntityCoords(ped),true)

			if distance <= 100.0 then
				DrawMarker(21,locs3[selecionado3].x,locs3[selecionado3].y,locs3[selecionado3].z-0.3,0,0,0,0,180.0,130.0,0.6,0.8,0.5,255,0,0,50,1,0,0,1)
				if distance <= 1.2 and IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) and (GetEntityModel(vehicle) == -1705304628 or emP.checkPermissionMafia()) then
					servico = true
					TriggerEvent("cancelando",true)
					SetEntityCoords(ped,locs3[selecionado3].x,locs3[selecionado3].y,locs3[selecionado3].z-1)
					vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,28422)
					local tempo = 10000
					if emP.checkPermissionMafia() then
						tempo = 6000
					end
					SetTimeout(tempo,function()
						servico = false
						vRP._DeletarObjeto()
						vRP._stopAnim(false)
						TriggerEvent("cancelando",false)
						backentrega = selecionado3
						while true do
							if backentrega == selecionado3 then
								selecionado3 = math.random(#locs3)
							else
								break
							end
							Citizen.Wait(10)
						end
						emP.checkPayment()
					end)	
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAL 4
-----------------------------------------------------------------------------------------------------------------------------------------



local selecionado4 = 1
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs4 = {
	{x=1940.36, y= 3447.14, z= 43.29, h=299.61},
	{x=1936.72, y= 3458.13, z= 43.91, h=177.52},
	{x=1922.11, y= 3457.92, z= 48.04, h=269.8},
	{x=1936.41, y= 3476.61, z= 45.84, h=210.59},
	{x=1960.94, y= 3462.78, z= 41.92, h=162.06},
	{x=1942.46, y= 3476.22, z= 43.36, h=132.2},
	{x=1935.65, y= 3442.76, z= 42.27, h=3.12},
	{x=1921.94, y= 3453.12, z= 47.62, h=80.31},
	{x=1907.34, y= 3453.54, z= 46.48, h=20.42},
	{x=1900.79, y= 3446.56, z= 46.01, h=304.02},
	{x=1894.03, y= 3462.29, z= 46.29, h=337.93},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if not servico then
			local ped = PlayerPedId()
			local vehicle = GetPlayersLastVehicle()
			local distance = GetDistanceBetweenCoords(locs4[selecionado4].x,locs4[selecionado4].y,locs4[selecionado4].z,GetEntityCoords(ped),true)

			if distance <= 100.0 then
				DrawMarker(21,locs4[selecionado4].x,locs4[selecionado4].y,locs4[selecionado4].z-0.3,0,0,0,0,180.0,130.0,0.6,0.8,0.5,255,0,0,50,1,0,0,1)
				if distance <= 1.2 and IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) and (GetEntityModel(vehicle) == -1705304628 or emP.checkPermissionMafia()) then
					servico = true
					TriggerEvent("cancelando",true)
					SetEntityCoords(ped,locs4[selecionado4].x,locs4[selecionado4].y,locs4[selecionado4].z-1)
					vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,28422)
					local tempo = 10000
					if emP.checkPermissionMafia() then
						tempo = 6000
					end
					SetTimeout(tempo,function()
						servico = false
						vRP._DeletarObjeto()
						vRP._stopAnim(false)
						TriggerEvent("cancelando",false)
						backentrega = selecionado4
						while true do
							if backentrega == selecionado4 then
								selecionado4 = math.random(#locs4)
							else
								break
							end
							Citizen.Wait(10)
						end
						emP.checkPayment()
					end)	
				end
			end
		end
	end
end)
