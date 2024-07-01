--- Dispatches messages received over rednet
--- to an array of chatBoxes. See ChatClient.lua 
--- Unsafe to connect to a wireless modem or any
--- other unsecure network.

peripheral.find("modem", rednet.open)

rednet.host("chatarray", "main")

---@alias ChatBoxPeripheral {sendMessage: fun(message: string, prefix?: string, brackets?: string, bracketColor?: string, range?: number): (true| nil, string), sendMessageToPlayer: fun(message: string, username: string, prefix?: string, brackets?: string, bracketColor?: string,  range?: number): (true|nil, string), sendToastToPlayer: fun(message:string, title: string, username: string, prefix?: string, brackets?: string, bracketColor?: string, range?: number): (true| nil, string), sendFormattedMessage: fun(json: string, prefix?:string, brackets?:string, bracketColor?: string, range?: number): (true| nil, string), sendFormattedMessageToPlayer: fun(json: string, username: string, prefix?:string, brackets?: string, bracketColor?: string, range?: number): (true| nil, string), sendFormattedToastToPlayer:  fun(messageJson:string, titleJson: string, username: string, prefix?: string, brackets?: string, bracketColor?: string, range?: number): (true| nil, string)}
---@alias ChatMessageOptions {message: string, senderName?: string, senderBrackets?: string, senderColor?: string}
---@enum ChatPriority
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

local insert = table.insert
local type = type
local remove = table.remove

---@type table<1|2|3, ({type: "player", player: "string", options: ChatMessageOptions} | {type: "broadcast", options: ChatMessageOptions})[]>
local queues = {}

-- Create queues for the chat priorities
for k,v in pairs(ChatPriority) do
    queues[v] = {}
end

local function networkLuaThread()
    os.queueEvent("tick")
    while true do
        local event, sender, message, protocol = os.pullEvent()
        if event == "tick" then
            os.queueEvent("tick")
        end
        if event == "rednet_message" and protocol == "chatarray" then
            ---@cast sender number
            ---@cast message any
            -- Closure because i don't like goto
            repeat
                --Validate data
                if type(message) ~= "table" then
                    break
                end
                if type(message.options) ~= "table" then
                    break
                end
                if type(message.options.message) ~= "string" then
                    break
                end
                if message.options.senderName and type(message.options.senderName) ~= "string" then
                    break
                end
                if message.options.senderBrackets and type(message.options.senderBrackets) ~= "string" and string.len(message.options.senderBrackets) ~= 2 then
                    break
                end
                if message.options.senderColor and type(message.options.senderColor) ~= "string" then
                    break
                end
                if message.priority ~= 1 and message.priority ~= 2 and message.priority ~= 3 then
                    break
                end
                ---@cast message {type: any, priority: 1|2|3, player:string, options: ChatMessageOptions}
                -- Actual logic (call the logician)
                if message.type == "player" then
                    insert(queues[message.priority], {type = "player", player = message.player, options = message.options})
                elseif message.type == "broadcast" then
                    insert(queues[message.priority], {type = "broadcast", options = message.options})
                end
            until true
        end
    end    
end

---@param chatBox ChatBoxPeripheral
---@return function
local function createChatBoxLuaThread(chatBox)
    return function ()
        while true do
            for _, queue in ipairs(queues) do
                if #queue > 0 then
                    ---@type {type: "player", player: "string", options: ChatMessageOptions} | {type: "broadcast", options: ChatMessageOptions}
                    local message = remove(queue, 1)
                    if message.type == "player" then
                        chatBox.sendMessageToPlayer(message.options.message, message.player, message.options.senderName or "", message.options.senderBrackets or "[]", message.options.senderColor or "&f")
                    elseif message.type == "broadcast" then
                        chatBox.sendMessage(message.options.message, message.options.senderName or "", message.options.senderBrackets or "[]", message.options.senderColor or "&f")
                    end
                    sleep(0.95)
                    break
                else
                end
            end
            sleep(0.05)
        end
    end
end
local chatboxThreads = {}
local chatBoxes = {peripheral.find("chatBox")}

for k, v in pairs(chatBoxes) do
    insert(chatboxThreads, createChatBoxLuaThread(v))
end

parallel.waitForAny(networkLuaThread, table.unpack(chatboxThreads))
