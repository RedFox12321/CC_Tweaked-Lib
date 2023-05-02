--[#]                                                                                           [#]--
 --   ██▓███  ▓█████  ██▀███   ██▓ ██▓███   ██░ ██ ▓█████  ██▀███   ▄▄▄       ██▓      ██████     --
 --   ▓██░  ██▒▓█   ▀ ▓██ ▒ ██▒▓██▒▓██░  ██▒▓██░ ██▒▓█   ▀ ▓██ ▒ ██▒▒████▄    ▓██▒    ▒██    ▒    --
 --   ▓██░ ██▓▒▒███   ▓██ ░▄█ ▒▒██▒▓██░ ██▓▒▒██▀▀██░▒███   ▓██ ░▄█ ▒▒██  ▀█▄  ▒██░    ░ ▓██▄      --
 --   ▒██▄█▓▒ ▒▒▓█  ▄ ▒██▀▀█▄  ░██░▒██▄█▓▒ ▒░▓█ ░██ ▒▓█  ▄ ▒██▀▀█▄  ░██▄▄▄▄██ ▒██░      ▒   ██▒   --
 --   ▒██▒ ░  ░░▒████▒░██▓ ▒██▒░██░▒██▒ ░  ░░▓█▒░██▓░▒████▒░██▓ ▒██▒ ▓█   ▓██▒░██████▒▒██████▒▒   --
 --   ▒▓▒░ ░  ░░░ ▒░ ░░ ▒▓ ░▒▓░░▓  ▒▓▒░ ░  ░ ▒ ░░▒░▒░░ ▒░ ░░ ▒▓ ░▒▓░ ▒▒   ▓▒█░░ ▒░▓  ░▒ ▒▓▒ ▒ ░   --
 --   ░▒ ░      ░ ░  ░  ░▒ ░ ▒░ ▒ ░░▒ ░      ▒ ░▒░ ░ ░ ░  ░  ░▒ ░ ▒░  ▒   ▒▒ ░░ ░ ▒  ░░ ░▒  ░ ░   --
 --   ░░          ░     ░░   ░  ▒ ░░░        ░  ░░ ░   ░     ░░   ░   ░   ▒     ░ ░   ░  ░  ░     --
 --               ░  ░   ░      ░            ░  ░  ░   ░  ░   ░           ░  ░    ░  ░      ░     --
--[#]                                                                                           [#]--

-- Peripherals library

-- [#] Purpose [#] -- 

-- A library dedicated to get information of existing or to exist peripherals


--####################--


-- [[ Table/Dictionary of peripherals ]] --

-- This table/dictionary is composed of all "CC:tweaked"/"ComputerCraft" and "Advanced Peripherals" peripherals to date (02/05/2023)
-- Table/Dictionary modification through this library is deprecated.
-- All functions who need peripheral tables/dictionarys must accept custom tables/dictionarys else default to local table/dictionary.


-- [ Table layout ] --
-- <peripheral alias> = "<peripheral label name>",

-- [ Rename a label ] --
-- To rename a label just change the name inside quotation marks. Just pay attention to the alias label you are changing

-- [ Rename an alias ] --
-- To rename an alias just change the name before each equal sign. Just pay attention to the the label name after the sign

-- [ Add a peripheral ] --
-- If another peripheral is needed, add another line to the peripherals with the same Table layout

local peripherals_default_table = {
    Floppy = "drive",
    Printy = "printer",
    Sound = "speaker",
    Monitor = "monitor",
    Chat = "chatBox",
    EnergyDetector = "energyDetector",
    Environment = "environmentDetector",
    Player = "playerDetector",
    InvManager = "inventoryManager",
    NBTStorage = "NBTStorage",
    BlockReader = "blockReader",
    GeoScan = "geoScanner",
    RedIntegrator = "redstoneIntegrator",
    AR_Controller = "arController",
    AE2 = "meBridge",
    RefinedS = "rsBridge",
    MineColonies = "colonyIntegrator",
}


--[[ getPeripherals #0 ]]--
function getPeripherals(peripherals_custom_table)
    local table = defaultTable(peripherals_custom_table)
    for alias, label in pairs(table) do
        if peripheral.find(label) then
            table[alias] = peripheral.find(label)
        else
            table[alias] = "undefined"
        end
    end
    return table
end

--[[ defaultTable #1 ]]--
function defaultTable(peripherals_custom_table)
    return peripherals_custom_table or peripherals_default_table
end

--[[ isPeripheralType #2 ]]--
function isPeripheralType(peripheralAlias, compareThisLabel)
    if peripheralAlias == "undefined" then
       return 0
    end
    if peripheral.getType(peripheralAlias) ~= tostring(compareThisLabel) then
        return 0
    end
    return 1
end