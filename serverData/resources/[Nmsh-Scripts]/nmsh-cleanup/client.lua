-- add any hashes here we do not want effected by clean up scripts.
-- should delete any light / chair / fence that is damaged to prevent it lying there for 33 days and 12 minutes.

local ActivePolyZones = {}

local BlackListedPropsByZone = {
    ["prison"] = {
        -- Prison Scrap Yard Fences
        [-21288878] = true,
        [874386199] = true,
        [1357335721] = true,
    }
    
}

local BlackListedProps = { 
    -- PD Security Case
    [-105439435] = true,
    -- PD ground bar things
    [-1868050792] = true,
    [-1635161509] = true,

    -- hot dog stands possibly exploding?
    -- readd this if the court house explodes again
   -- [1129053052] = true,



    -- doors?
    [1501451068] = true,
    [741314661] = true,
    [-1765048490] = true,
    [-1501157055] = true,
    [-1167410167] = true,
    [-1156020871] = true,
    [1309269072] = true,
    [-222270721] = true,
    [1956494919] = true,
    [746855201] = true,
    [-1508355822] = true,
    [-1023447729] = true,
    [-1011692606] = true,
    [-1932297301] = true,
    [-341973294] = true,
    [-147325430] = true,
    [-1116041313] = true,
    [668467214] = true,
    [-495720969] = true,
    [-681066206] = true,
    [245182344] = true,
    [2271212864] = true,
    [551491569] = true,
    [933053701] = true,
    [-1591004109] = true,
    [1286392437] = true,
    [-1821777087] = true,
    [91564889] = true,
    [631614199] = true,
    [-543490328] = true,
    [190770132] = true,
    [1888438146] = true,
    [272205552] = true,
    [1289778077] = true,
    [-626684119] = true,
    [-1320876379] = true,
    [-1437850419] = true,
    [-1033001619] = true,
    [1425919976] = true,
    [9467943] = true,
    [1373390714] = true,
    [-2109504629] = true,
    [-574290911] = true,
    [1773345779] = true,
    [1971752884] = true,
    [534758478] = true,
    [988364535] = true,
    [-1141522158] = true,
    [1641293839] = true,
    [1507503102] = true,
    [3610585061] = true,
    [-434783486] = true,
    [-1700911976] = true,
    [854291622] = true,
    [-1687047623] = true,
    [1015445881] = true,
    [-2051651622] = true,
    [-550347177] = true,
    [447044832] = true,
    [1335311341] = true,
    [4007304890] = true,
    [-129553421] = true,
    [749848321] = true,
    [-1573772550] = true,
    [1286535678] = true,
    [-1368913668] = true,
    [-1657444801] = true,
    [-692649124] = true,
    [149284793] = true,
    [-288803980] = true,
    [-53345114] = true,
    [-1406685646] = true,
    [-96679321] = true,
    [1830360419] = true,
    [2130672747] = true,
    [-1547307588] = true,
    [-1603817716] = true,
    [-1563799200] = true,
    [-1259801187] = true,
    [-551608542] = true,
    [-1887114592] = true,
    [-219532439] = true,
    [-2023754432] = true,
    [736699661] = true,
    [-519068795] = true,
    [605731446] = true,
    [693714950] = true,
    [-190780785] = true,
    [-664582244] = true,
    [-117185009] = true,
    [517369125] = true,
    [237621997] = true,
    [362975687] = true,
    [1335309163] = true,
    [110411286] = true,
    [-43433986] = true,
    [569833973] = true,
    [-952356348] = true,
    [97297972] = true,
    [-820650556] = true,
    [-1421582160] = true,
    [1248599813] = true,
    [-823173123] = true,
    [1709680887] = true,
    [-752680088] = true,
    [-1663450520] = true,
    [-1854854241] = true,
    [-429115342] = true,
    [-1204133321] = true,
    [-1193319547] = true,
    [1967988229] = true,
    [1566764593] = true,
    [-2066395222] = true,
    [-901044889] = true,
    [-1795835524] = true,
    [21324050] = true,
    [558771340] = true,
    [680601509] = true,
    [-1253427798] = true,
    [-1877571861] = true,
    [-822900180] = true,
    [-1475798232] = true,
    [1517256706] = true,
    [-1871759441] = true,
    [`denis3d_hayes_auto_shuttergate`] = true,
    [-1152174184] = true,
    [73386408] = true,
    [-8873588] = true,
    [972297972] = true,
    [304890864] = true,
    [-994492850] = true,
    [1196685123] = true,
    [997554217] = true,
    [1130240275] = true,
    [1411103374] = true,
    [-1950573712] = true,
    [992069095] = true,
    [1114264700] = true,
    [-654402915] = true,
    [690372739] = true,
    [-742198632] = true,
    [1151364435] = true,
    [-870868698] = true,
    [506770882] = true,
    [303280717] = true,
    [`prop_vend_snak_01`] = true,
    [`prop_vend_coffe_01`] = true,
    [`prop_vend_soda_01`] = true,
    [`prop_vend_soda_02`] = true,
    [`prop_vend_fridge01`] = true,
    [`prop_vend_water_01`] = true,
    [`prop_atm_01`] = true,
    [`prop_atm_02`] = true,
    [`prop_atm_03`] = true,
    [`prop_fleeca_atm`] = true,
    [`v_5_b_atm1`] = true,
    [`v_5_b_atm2`] = true,
    [`p_phonebox_02_s`] = true,
    [`np_cs_door_l`] = true,
    [`np_cs_door_r`] = true,
    [`np_cs_win1`] = true,
    [`np_cs_win2`] = true,
    [`np_cs_win3`] = true,

    -- Booth
    [304890764] = true,


    -- robberies
    [`prop_tv_flat_02`] = true,
    [`prop_speaker_06`] = true,
    [`prop_coffee_mac_02`] = true,
    [`prop_micro_02`] = true,
    [`prop_dyn_pc_02`] = true,
    [`hei_prop_hei_bust_01`] = true,
    [`prop_cs_street_binbag_01`] = true,

    -- Racing
    [`prop_offroad_tyres02`] = true,
    [`prop_beachflag_01`] = true,

    -- Bumper ball
    [`v_ilev_exball_blue`] = true,

    [`w_ex_cash`] = true,
    [`w_ex_book`] = true,

    [`prop_windmill_01`] = true,
    [`prop_windmill_01_l1`] = true,
    [`prop_aircon_l_01`] = true,
    [`prop_aircon_l_03`] = true,
    [`prop_aircon_l_03_dam`] = true,
    [`prop_aircon_l_04`] = true,
    [`prop_aircon_m_05`] = true,
    [`prop_aircon_m_06`] = true,
    [`prop_aircon_m_07`] = true,
    [`prop_aircon_m_08`] = true,
    [`prop_aircon_m_09`] = true,
    [`prop_aircon_m_10`] = true,
    [`prop_aircon_t_03`] = true,
    [`prop_aircon_tna_02`] = true,
    [`prop_cs_aircon_01`] = true,

    -- Lifts 
    [`denis3d_carlift_01`] = true,
    [`denis3d_carlift_02`] = true,
    [`denis3d_carlift_03`] = true,
}

local RoadCheckObjects = {
    [`prop_dumpster_01a`] = true,
    [`prop_dumpster_02a`] = true,
    [`prop_dumpster_02b`] = true,
    [`prop_dumpster_3a`] = true,
    [`prop_dumpster_4a`] = true,
    [`prop_dumpster_4b`] = true,
    [`prop_bin_01a`] = true,
    [`prop_bin_14b`] = true,
    [`prop_bin_14a`] = true,
    [`prop_bin_08a`] = true,
    [`prop_bin_05a`] = true,
    [`prop_bin_07c`] = true,
    [`prop_rub_binbag_03`] = true,
    [`prop_rub_binbag_01b`] = true,
    [`prop_rub_binbag_06`] = true,
}

local BlackListedVehicles = {
    [`npwheelchair`] = true,
}

local isInVeh = false
local racing = false

local skipCleanupChecks = false

AddEventHandler("nmsh-cleanup:enableCleanup", function(pEnabled)
  skipCleanupChecks = not pEnabled
end)

RegisterNetEvent("baseevents:enteredVehicle")
AddEventHandler("baseevents:enteredVehicle", function()
    isInVeh = true
end)

RegisterNetEvent("mkr_racing:api:currentRace")
AddEventHandler("mkr_racing:api:currentRace", function(currentRace)
    racing = currentRace ~= nil
end)


Citizen.CreateThread(function()
    while true do

        local WaitTime = 10000
        if racing then
            WaitTime = 500
        elseif isInVeh then
            WaitTime = 2500
        end

        local ShitList = {}
        local propList = GetGamePool("CObject")
        
        if skipCleanupChecks then
          Citizen.Wait(WaitTime)
          goto skipwhile
        end
        
        for _,handle in ipairs(propList) do
            local success, model = pcall(function()
                return GetEntityModel(handle)
            end)
            
            if not success then
                print("[CLEANUP]Error: Could not get entity model for handle:", handle)
                print("[CLEANUP]Position:", GetEntityCoords(handle), GetEntityHeading(handle))
                DeleteEntity(handle)
                print("[CLEANUP] entity:", handle)
                goto continue 
            end
            
            if BlackListedProps[model] then
                --failed blacklist check
                goto continue 
            end

            -- If theyre in any of the active polyzones and that zone has blacklisted props skip them
            for zone, active in pairs(ActivePolyZones) do
                if BlackListedPropsByZone[zone] and active and BlackListedPropsByZone[zone][model] then
                    goto continue     
                end

            end



             -- make sure player isnt carrying?
            if IsEntityAttached(handle) then
                goto continue
            end

            if (GetObjectFragmentDamageHealth(handle,true) ~= nil and (GetEntityHealth(handle) >= GetEntityMaxHealth(handle)) and (GetEntityRotation(handle).x < 25.0 and GetEntityRotation(handle).x > -25.0)) then
                --failed frag health check
                goto continue 
            end

            ShitList[#ShitList+1] = handle

            ::continue::
        end

        Citizen.Wait(WaitTime)

        for _,prop in ipairs(ShitList) do 
            local success, model = pcall(function()
                return GetEntityModel(prop)
            end)
            
            if not success then
                print("[CLEANUP]Error: Could not get entity model for prop:", prop)
                goto continue 
            end

            if not DoesEntityHaveFragInst(prop) then 
                --failed frag check
                goto continue 
            end

            if prop == PlayerPedId() then
                --don't yeet ourselves
                goto continue
            end

            local propCoords = GetEntityCoords(prop)

            if IsEntityOnFire(prop) then
                StopFireInRange(propCoords.x, propCoords.y, propCoords.z, 10.0)
            end

            if RoadCheckObjects[model] then
                local worked, groundZ, normal = GetGroundZAndNormalFor_3dCoord(propCoords.x, propCoords.y, propCoords.z) 
                if not IsPointOnRoad(propCoords.x, propCoords.y, groundZ) then
                    goto continue
                end
            end

            SetEntityCoords(prop, -14204.15,-1923.68,-161.7)

            if IsEntityAMissionEntity(prop) then
                print("[CLEANUP] entity:", prop)
                DeleteObject(prop)
            end

            ::continue::
        end

        ::skipwhile::

        Citizen.Wait(250)
    end
end)


RegisterNetEvent("baseevents:leftVehicle")
AddEventHandler("baseevents:leftVehicle", function()
    isInVeh = false
end)

RegisterNetEvent('nmsh-cleanup:clearAreaOfEverything')
AddEventHandler('nmsh-cleanup:clearAreaOfEverything', function (vectors, radius)
    ClearAreaOfEverything(vectors.x, vectors.y, vectors.z, radius, false, false, false, false)
end)

RegisterNetEvent('nmsh-cleanup:clearAreaOfObjects')
AddEventHandler('nmsh-cleanup:clearAreaOfObjects', function (vectors, radius)
    ClearAreaOfObjects(vectors.x, vectors.y, vectors.z, radius)
end)

RegisterNetEvent('nmsh-cleanup:clearAreaOfPeds')
AddEventHandler('nmsh-cleanup:clearAreaOfPeds', function (vectors, radius)
    ClearAreaOfPeds(vectors.x, vectors.y, vectors.z, radius)
end)

RegisterNetEvent('nmsh-cleanup:clearAreaOfVehicles')
AddEventHandler('nmsh-cleanup:clearAreaOfVehicles', function (vectors, radius)
    ClearAreaOfVehicles(vectors.x, vectors.y, vectors.z, radius, false, false, false, false)
end)


-- Listen for polyzone events for prison
AddEventHandler("nmsh-zones:enter", function(pZone, pData)
    -- Check does this zone even have black listed models?
    if BlackListedPropsByZone[pZone] then
        ActivePolyZones[pZone] = true;
    end
end)

AddEventHandler("nmsh-zones:exit", function(pZone, pData)
   -- Check does this zone even have black listed models?
    if BlackListedPropsByZone[pZone] then
        ActivePolyZones[pZone] = false;
    end
end)