
local playerdetector = peripheral.find("playerDetector")
local chatbox = peripheral.find("chatBox")
local ims = {peripheral.find("inventoryManager")}
local monitor = peripheral.find("monitor")
local lobbyri = peripheral.wrap("redstoneIntegrator_16")
local gameri = peripheral.wrap("redstoneIntegrator_15")
local gamesp = peripheral.wrap("ae2:spatial_io_port_0")
local lobbysp = peripheral.wrap("ae2:spatial_io_port_1")
local swap = peripheral.wrap("minecraft:chest_9")
local GameStarted = false
local GameStarting = false
local in_range = {}

local players = {}

local Zombies = {}
function changed()
    while true do
        if GameStarted == true then
            for index, value in pairs(Zombies) do
                local target = playerdetector.getPlayerPos(index)
                for k,p in pairs(players) do
                    local pl = playerdetector.getPlayerPos(k)
                    if math.sqrt((pl.x-target.x)^2+(pl.y-target.y)^2+(pl.z-target.z)^2)<2 then
                        if not Zombies[k] then
                            for index, value in pairs(players) do
                                chatbox.sendMessageToPlayer("Player "..k.." Has Been Infected!!", index)
                            end
                            Zombies[k] = 0
                            Zombies[index] = Zombies[index]+1
                            for key, value in pairs(ims) do
                                if value.getOwner() == k then
                                    value.addItemToPlayer("east", {name="minecraft:leather_chestplate", toSlot=102, count=1})
                                end
                            end
                        end
                    end
                end
            end
        end
        sleep(.1)
    end
end


function display()
    while true do
        monitor.clear()
        local init =1
        local w,h = monitor.getSize()
        if GameStarted == true then
            local padding = w - string.len("Game In Progress")
            monitor.setCursorPos(padding/2,5)
            monitor.write("Game In Progress")
        elseif GameStarting == true then
            local padding = w - string.len("Game Starting...")
            monitor.setCursorPos(padding/2,5)
            monitor.write("Game Starting...")
        else
            for index, value in pairs(playerdetector.getPlayersInRange(4)) do
                monitor.setCursorPos(20,init)
                monitor.write(value)
                init = init+1
            end
        end
        sleep(.1)
    end
end
function Start()
    while true do
        local event, key, is_held = os.pullEvent("key")
        if key == keys.space then
            GameStarting = true
            sleep(10)
            for index, value in pairs(playerdetector.getPlayersInRange(4)) do
                for indexi, valuei in ipairs(ims) do
                    if valuei.getOwner() == value then
                        if #valuei.getItems() == 0 then
                            if #valuei.getArmor() == 0 then
                                players[value] = true
                                break
                            end
                        end
                    end
                end
            end
            GameStarted = true
            if lobbysp.getItemDetail(1) then
                lobbyri.setOutput("back", true)
                sleep()
                lobbyri.setOutput("back", false)
                gamesp.pullItems(peripheral.getName(lobbysp), 2)
                sleep()
                gameri.setOutput("back",true)
                sleep()
                gameri.setOutput("back",false)
                sleep()
                swap.pullItems(peripheral.getName(gamesp), 2)
                gamesp.pullItems(peripheral.getName(swap), 1)
            end
            sleep(60)
            local playersraw = {}
            for key, value in pairs(players) do
                playersraw[#playersraw+1] = key
                print(key)
            end
            local zombie = playersraw[math.random(1,#playersraw)]
            for index, value in pairs(players) do
                chatbox.sendMessageToPlayer("Player "..zombie.." The Alpha Zombie!!", index,"Game Master")
                for key, value in pairs(ims) do
                    if value.getOwner() == zombie then
                        value.addItemToPlayer("east", {name="minecraft:golden_chestplate", toSlot=102, count=1})
                    end
                end
                sleep(1.1)
            end
            Zombies[zombie] = 0
        end
        sleep(.1)
    end
end

function endgame()
    while true do
        local playervalue = 0
        local zombievalue =0
        for key, value in pairs(players) do
            playervalue = playervalue+1
        end
        for key, value in pairs(Zombies) do
            zombievalue = zombievalue+1
        end
        if playervalue == zombievalue and GameStarted == true then
            for index, value in pairs(players) do
                chatbox.sendMessageToPlayer("Game Over Zombies Win",index,"Game Master")
                sleep(1.1)
            end
            for index, value in pairs(Zombies) do
                for key, valuek in pairs(ims) do
                    if valuek.getOwner() == index then
                        valuek.removeItemFromPlayer("east",{fromSlot=102})
                    end
                end
            end
            gameri.setOutput("back", true)
            sleep()
            gameri.setOutput("back", false)
            lobbysp.pullItems(peripheral.getName(gamesp), 2)
            sleep()
            lobbyri.setOutput("back",true)
            sleep()
            lobbyri.setOutput("back",false)
            sleep()
            swap.pullItems(peripheral.getName(lobbysp), 2)
            lobbysp.pullItems(peripheral.getName(swap), 1)
            GameStarted = false
            GameStarting = false
            players = {}
            Zombies = {}
        end
        sleep(.1)
    end
end

parallel.waitForAll(Start,display,endgame,changed)