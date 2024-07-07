local monitor = peripheral.find("monitor")
peripheral.find("modem",rednet.open)

local foundECard = false

local EcardBal = 0
function display()
    while true do
        monitor.clear()
        if foundECard == true then
            monitor.setCursorPos(1,1)
            monitor.write("Balance")
            monitor.setCursorPos(1,3)
            monitor.write(EcardBal.."C")
        else
            monitor.setCursorPos(1,1)
            monitor.write("Balance")
            monitor.setCursorPos(1,3)
            monitor.write("No Card Entered")
        end
        sleep(.1)
    end
end
function getbal()
    while true do
        if fs.exists("disk/ECard/Data") then
            local EcardFile = fs.open("disk/ECard/Data","r")
            local data = textutils.unserialise(EcardFile.readAll())
            EcardFile.close()
            local sender = {}
            sender.coms = 3210
            local sendmsg = {}
            sendmsg.status = "lookup"
            sendmsg.id = data.fulllink
            sender.message = sendmsg
            rednet.send(575,sender,"PaymentServer")
            local id, message = rednet.receive()
            if message.status == "Reply" then
                EcardBal = message.balance
                foundECard = true
            end
        else
            foundECard = false
        end
        sleep(.1)
    end
end
parallel.waitForAll(display,getbal)