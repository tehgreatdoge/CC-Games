--- A simple library for connecting to ChatService
local ChatClient = {}

peripheral.find("modem", rednet.open)

local rednet = rednet
local send = rednet.send

local masterComputer = rednet.lookup("chatarray","main")
if not masterComputer then error("unable to locate the chat array.") end ---@cast masterComputer integer

local ChatPriority = {
    --- Things where the user needs the information
    --- as soon as possible. This is information such
    --- as the game starting, who is the alpha,
    --- players becoming infected (to survivors), 
    --- and other things which could have an
    --- immediate impact.
    HIGH = 1,
    --- Things where a user actively needs the response
    --- within the next half second or so. Things
    --- such as picking up items, getting chosen as
    --- the alpha, or becoming infected.
    NORMAL = 2,
    --- Things where the exact time of delivery 
    --- doesn't matter such as information, notifications,
    --- game results, or getting infected.
    LOW = 3,
}

---Sends a message to the specified player.
---@param player string
---@param priority ChatPriority
---@param options ChatMessageOptions
function ChatClient.sendMessageToPlayer(player, priority, options)
    send(masterComputer, {type= "player", player = player, priority = priority, options = options}, "chatarray")
end

---Sends a message to the specified players.
---@param players string[]
---@param priority ChatPriority
---@param options ChatMessageOptions
function ChatClient.sendMessageToPlayers(players, priority, options)
    for _, player in ipairs(players) do
        send(masterComputer, {type= "player", player = player, priority = priority, options = options}, "chatarray")
    end
end
---Sends a message to global chat.
---@param priority ChatPriority
---@param options ChatMessageOptions
function ChatClient.sendMessage(priority, options)
    send(masterComputer, {type = "broadcast", priority = priority, options = options}, "chatarray")
end

ChatClient.ChatPriority = ChatPriority

return ChatClient
