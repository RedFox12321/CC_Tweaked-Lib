--[#]                                 [#]--
 --   ██▓ ███▄    █   █████▒▒█████      --
 --   ▓██▒ ██ ▀█   █ ▓██   ▒▒██▒  ██▒   --
 --   ▒██▒▓██  ▀█ ██▒▒████ ░▒██░  ██▒   --
 --   ░██░▓██▒  ▐▌██▒░▓█▒  ░▒██   ██░   --
 --   ░██░▒██░   ▓██░░▒█░   ░ ████▓▒░   --
 --   ░▓  ░ ▒░   ▒ ▒  ▒ ░   ░ ▒░▒░▒░    --
 --    ▒ ░░ ░░   ░ ▒░ ░       ░ ▒ ▒░    --
 --    ▒ ░   ░   ░ ░  ░ ░   ░ ░ ░ ▒     --
 --    ░           ░            ░ ░     --
--[#]                                 [#]--

-- Info library

-- [#] Purpose [#] --

-- A library dedicated to processing information, mainly from peripherals


--####################--
-- Required Dependencies:
require "Peripherals"

--####################--

-- [[ Refined Storage - rsBridge]] --

--#0
function getRSItemStorageMaxCap(rsBridge)
    if not isPeripheralType(rsBridge, "rsBridge") then
        return
    end
    return rsBridge.getMaxItemDiskStorage()
end

--#1
function getRSItemStorage(rsBridge)
    if not isPeripheralType(rsBridge, "rsBridge") then
        return
    end
    local count
    for item_number, item_info in pairs(rsBridge.listItems()) do
        for info_name, info_value in pairs(item_info) do
            if info_name == "amount" then
                count = (count or 0) + info_value
            end
        end
    end
    return count
end

--#2
function getRSFluidStorageMaxCap(rsBridge)
    if not isPeripheralType(rsBridge, "rsBridge") then
        return
    end
    return rsBridge.getMaxFluidDiskStorage()
end

--#3
function getRSFluidStorage(rsBridge)
    if not isPeripheralType(rsBridge, "rsBridge") then
        return
    end
    local count
    for fluid_number, fluid_info in pairs(rsBridge.listFluids()) do
        for info_name, info_value in pairs(fluid_info) do
            if info_name == "amount" then
                count = (count or 0) + info_value
            end
        end
    end
    return count
end

-- [[ Applied Energistics 2 - meBridge]] --

--#4
function getAEItemStorageMaxCap(meBridge)
    if not isPeripheralType(meBridge, "meBridge") then
        return
    end
    return meBridge.getTotalItemStorage()
end

--#5
function getAEItemStorage(meBridge)
    if not isPeripheralType(meBridge, "meBridge") then
        return
    end
    return meBridge.getUsedItemStorage()
end

--#6
function getAEFluidStorageMaxCap(meBridge)
    if not isPeripheralType(meBridge, "meBridge") then
        return
    end
    return meBridge.getTotalFluidStorage()
end

--#7
function getAEFluidStorage(meBridge)
    if not isPeripheralType(meBridge, "meBridge") then
        return
    end
    return meBridge.getUsedFluidStorage()
end

-- [[ Player Detector - playerDetector ]] --

function getOnlinePlayers(playerDetector)
    if not isPeripheralType(playerDetector, "playerDetector") then
        return
    end
    return playerDetector.getOnlinePlayers()
end

function getPlayersInRange(playerDetector, range)
    if not isPeripheralType(playerDetector, "playerDetector") then
        return
    end
    return playerDetector.getPlayersInRange(range)
end

function getPlayersInCoords(playerDetector, Xpos1, Ypos1, Zpos1, Xpos2, Ypos2, Zpos2)
    if not isPeripheralType(playerDetector, "playerDetector") then
        return
    end
    local pos1
    local pos2
    if type(Xpos1) == "table" and type(Ypos1) == "table" then
        pos1 = Xpos1
        pos2 = Ypos1
    else
        pos1 = {Xpos1, Ypos1, Zpos1}
        pos2 = {Xpos2, Ypos2, Zpos2}
    end
    return playerDetector.getPlayersInCoords(pos1, pos2)
end

function getPlayersInCubic(playerDetector, Xsize, Ysize, Zsize, byRadius)
    if not isPeripheralType(playerDetector, "playerDetector") then
        return
    end
    byRadius = byRadius or false
    if byRadius then
        Xsize = Xsize*2; Ysize = Ysize*2; Zsize = Zsize*2
    end
    return playerDetector.getPlayersInCubic(Xsize, Ysize, Zsize)
end

function isPlayerInRange(playerDetector, username, range)
    if not isPeripheralType(playerDetector, "playerDetector") then
        return
    end
    if type(username) ~= "string" and type(username) ~= "table" then
        return
    end
    local len
    if type(username) == "string" then
        return playerDetector.isPlayerInRange(range, username)
    else
        for i = 1, username.lenght(), 1 do
            if playerDetector.isPlayerInRange(range, username[i]) then
                return 1
            end
        end
        return 0
    end
end

function isPlayerInCoords(playerDetector, username, Xpos1, Ypos1, Zpos1, Xpos2, Ypos2, Zpos2)
    if not isPeripheralType(playerDetector, "playerDetector") then
        return
    end
    if type(username) ~= "string" and type(username) ~= "table" then
        return
    end
    if type(Xpos1) == "table" and type(Ypos1) == "table" then
        pos1 = Xpos1
        pos2 = Ypos1
    else
        local pos1 = {Xpos1, Ypos1, Zpos1}
        local pos2 = {Xpos2, Ypos2, Zpos2}
    end
    if type(username) == "string" then
        return playerDetector.isPlayerInCoords(pos1, pos2, username)
    else
        for i = 1, username.lenght(), 1 do
            if type(username[i]) ~= "string" then
                return
            end
            if playerDetector.isPlayerInCoords(pos1, pos2, username[i]) then
                return 1
            end
        end
        return 0
    end
end