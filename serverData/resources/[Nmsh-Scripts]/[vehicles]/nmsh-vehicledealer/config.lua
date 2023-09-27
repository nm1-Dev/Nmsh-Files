QBCore = exports['qb-core']:GetCoreObject()

VehicleShop = {}
VehicleShop.UseCustomFile = false

Config = {
  StockStolenPedVehicles    = false,
  StockStolenPlayerVehicles = false, 
  RefreshTimer              = (5 * 60 * 1000), -- Warehouse refresh timer. Milliseconds.

  BankAccountName = "bank",
  CashAccountName = "cash",
  UseCustomFile = false,
}

Warehouse = {  
  entry = vector4(-170.18, -2659.46, 6.0, 85.37),
  exit  = vector4(-1243.92,-3023.24,-48.48, 90.00),

  defaults = {
    gridStart   = vector3(-1281.30,-3042.80,-48.48),
    gridHead    = 0.0,

    gridWidth   = 7,
    gridLength  = 6,

    gridSpacingX = 4.98,
    gridSpacingY = 8.00,

    randomPriceVariation = 10, -- % random variation
  },

  purchasedSpawns = {
    vector4(-283.40,-2647.91,6.0,46.0),
    vector4(-286.43,-2649.76,6.0,46.0),
    vector4(-288.64,-2652.12,6.0,46.0),
    vector4(-290.94,-2654.26,6.0,46.0),
    vector4(-293.12,-2656.53,6.0,46.0),
  },
}

Controls = {
  ["Moving_Vehicle"] = {
    zUp       = 314,
    zDown     = 315,
    xUp       = 125,
    xDown     = 124,
    yUp       = 127,
    yDown     = 126,
    rotLeft   = 117,
    rotRight  = 118,
    ground    = 113,
    cancel    = 101,
    place     = 305,
  }
}