-- =============================================================
-- Script: noNPCs
-- Author: xXDr4EmZXx
-- Copyright © 2026
-- All rights reserved.
--
-- Description:
--   Locks the steering wheel angle when vehicle is stationary.
--   Prevents unwanted steering reset in FiveM vehicles.
--
-- License:
--   Free to use on personal FiveM servers only.
--   Redistribution, sale, or public sharing is prohibited.
--   Modifications allowed for personal use only.
--   See LICENSE.txt for full license details.
-- =============================================================

-- ========= UNIQUE OPTIMIZATIONS =========
CreateThread(function()
    -- Populations-Budgets (HUGE Performance K)
    SetPedPopulationBudget(0)
    SetVehiclePopulationBudget(0)
end)

-- ========= PLAYER STATE =========
local playerPed
local playerActive = false

CreateThread(function()
    while true do
        Wait(1000)
        playerPed = PlayerPedId()
        playerActive = DoesEntityExist(playerPed)
    end
end)

-- ========= FRAME THREAD (MINIMAL) =========
CreateThread(function()
    while true do
        if not playerActive or IsPauseMenuActive() then
            Wait(500)
        else
            -- ⚠️ bdeliberately 1 instead of 0
            Wait(1)

            SetVehicleDensityMultiplierThisFrame(0.0)
            SetPedDensityMultiplierThisFrame(0.0)
            SetRandomVehicleDensityMultiplierThisFrame(0.0)
            SetParkedVehicleDensityMultiplierThisFrame(0.0)
            SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
        end
    end
end)

-- ========= SPAWN FLAGS (NOT PER FRAME) =========
CreateThread(function()
    while true do
        Wait(1000)

        SetCreateRandomCops(false)
        SetCreateRandomCopsNotOnScenarios(false)
        SetCreateRandomCopsOnScenarios(false)

        SetGarbageTrucks(false)
        SetRandomBoats(false)
    end
end)

-- ========= CLEAR THREAD (ULTRA LIGHT) =========
CreateThread(function()
    while true do
        Wait(8000) -- intentionally high → Time ↓↓↓

        if not playerActive then goto skip end

        local coords = GetEntityCoords(playerPed)

        ClearAreaOfVehicles(
            coords.x, coords.y, coords.z,
            500.0,
            false, false, false, false, false
        )

        RemoveVehiclesFromGeneratorsInArea(
            coords.x - 300.0, coords.y - 300.0, coords.z - 300.0,
            coords.x + 300.0, coords.y + 300.0, coords.z + 300.0
        )

        ::skip::
    end
end)
