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


-- [[ Refined Storage - rsBridge ]] --

function getRSItemStorageMaxCap(rsBridge)
    if rsBridge == "undefined" then
        print("Undefined peripheral.")
       return
    end
    if peripheral.getType(rsBridge) ~= "rsBridge" then
        print("Wrong peripheral type.")
        return
    end
    return rsBridge.getMaxItemDiskStorage()
end

function getRSItemStorage(rsBridge)
    if rsBridge == "undefined" then
        print("Undefined peripheral.")
       return
    end
    if peripheral.getType(rsBridge) ~= "rsBridge" then
        print("Wrong peripheral type.")
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

function getRSFluidStorageMaxCap(rsBridge)
    if rsBridge == "undefined" then
        print("Undefined peripheral.")
       return
    end
    if peripheral.getType(rsBridge) ~= "rsBridge" then
        print("Wrong peripheral type.")
        return
    end
    print(rsBridge.getMaxFluidDiskStorage())
end

function getRSFluidStorage(rsBridge)
    if rsBridge == "undefined" then
        print("Undefined peripheral.")
       return
    end
    if peripheral.getType(rsBridge) ~= "rsBridge" then
        print("Wrong peripheral type.")
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