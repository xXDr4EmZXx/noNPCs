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

Config = {}

-- Density
Config.VehicleDensity  = 0.0
Config.PedDensity      = 0.0
Config.ParkedDensity   = 0.0
Config.ScenarioDensity = 0.0

-- Clear
Config.ClearRadius          = 600.0
Config.GeneratorClearRadius = 350.0
Config.ClearInterval        = 5000 -- 5 seconds (that's plenty)

-- Features
Config.DisableCops          = true
Config.DisableGarbageTrucks = true
Config.DisableBoats         = true

-- Advanced
Config.DisableWhenPaused    = true
