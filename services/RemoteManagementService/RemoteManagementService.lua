local aead = require("ccryptolib.aead")
local len = string.len

---@type table<string, string>
local keys = {}

do
    local rh = fs.open(".keys", "r")
    local unserialised = textutils.unserialiseJSON(rh.readAll())
    rh.close()

    for k,v in pairs(unserialised) do
        local out = ""
        for byte in string.gmatch(v, "..") do
            out = out..string.char(tonumber(byte,16))
        end
        keys[k] = out
    end
end

rednet.open("bottom")
rednet.host("arcadeRemoteManagement", "arcadeRemoteManagementService")

---@type Modem
local modem = peripheral.wrap("top")
local selfId = os.getComputerID()

---FIXME: add logic to remove old nonces from this list
local nonces = {}

local function sendMessageToComputer(id, message, protocol)
    modem.transmit(id, os.getComputerID(), {sProtocol=protocol,nSender=os.getComputerID(),nRecipient=id,nMessageID=math.random(1, 2147483647),message = message})
end

while true do
    local sender, message, protocol = rednet.receive("arcadeRemoteManagement")
    if type(message) == "table" then
        if type(message.ciphertext) == "string" and type(message.tag) == "string" and len(message.tag) == 16 and type(message.nonce) == "string" and len(message.nonce) == 12 and type(message.user) == "string" and keys[message.user] and not nonces[message.nonce] then
            local key = keys[message.user]

            local plaintext = aead.decrypt(key, message.nonce, message.tag, message.ciphertext, message.user, 20)
            if plaintext then
                local decoded = textutils.unserialise(plaintext)
                if decoded then
                    if type(decoded) == "table" and type(decoded.ts) == "number" then
                        local now = os.epoch("utc")
                        if decoded.ts > now - 1000 and decoded.ts < now + 500 then
                            nonces[message.nonce] = decoded.ts
                            if decoded.t == "c" and type(decoded.i) == "number" and decoded.m ~= nil then
                                sendMessageToComputer(decoded.i, decoded.m, "remoteManagement")
                            end
                        end
                    end
                end
            end
        end
    end
end
