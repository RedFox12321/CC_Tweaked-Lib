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

-- This table/dictionary is composed of all "CC:tweaked"/"ComputerCraft" and "Advanced Peripherals" peripherals to date (27/04/2023)

-- [ Table layout ] --
-- <peripheral alias> = "<peripheral label name>",

-- [ Rename a label ] --
-- To rename a label just change the name inside quotation marks. Just pay attention to the alias label you are changing

-- [ Rename an alias ] --
-- To rename an alias just change the name before each equal sign. Just pay attention to the the label name after the sign

-- [ Add a peripheral ] --
-- If another peripheral is needed, add another line to the peripherals with the same Table layout

local peripherals_table = {
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
function getPeripherals()
    for alias, label in pairs(peripherals_table) do
        if peripheral.find(label) then
            peripherals_table[alias] = peripheral.find(label)
        else
            peripherals_table[alias] = "undefined"
        end
    end
    return peripherals_table
end
