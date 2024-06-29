local monitor = peripheral.find("monitor")
local pieceLayout = {}
if not fs.exists("pieceLayout") then
    print("No Board File Found")
else 
    local file = fs.open("pieceLayout", "r")
    pieceLayout = textutils.unserialise(file.readAll())
    file.close()
end
    
    
local speaker = peripheral.find("speaker")
local redstoneIntegrator = peripheral.find("redstoneIntegrator")
local playersturn = "W"
local selectedpiece = ""
local GameStarted = false
local Config = {}
Config.Shield = true
Config.Sound = true
function a()
    --display
    while true do
        if GameStarted == true then
            monitor.setBackgroundColor(colors.blue)
        monitor.clear()
        monitor.setTextScale(5)
        monitor.setCursorPos(1,1)
        for index, value in pairs(pieceLayout) do
            monitor.setCursorPos(value.x,value.y)
            if value.pieceName == "pawn"then
                if value.color == "W" then
                    monitor.setTextColor(colors.lightGray)
                elseif value.color == "B" then
                    monitor.setTextColor(colors.black)
                end
                if selectedpiece == index then
                    monitor.setTextColor(colors.purple)
                end
                monitor.setCursorPos(value.x,value.y)
                monitor.write("P")
            elseif value.pieceName == "rook" then
                if value.color == "W" then
                    monitor.setTextColor(colors.lightGray)
                elseif value.color == "B" then
                    monitor.setTextColor(colors.black)
                end
                if selectedpiece == index then
                    monitor.setTextColor(colors.purple)
                end
                monitor.setCursorPos(value.x,value.y)
                monitor.write("R")
            elseif value.pieceName == "knight" then
                if value.color == "W" then
                    monitor.setTextColor(colors.lightGray)
                elseif value.color == "B" then
                    monitor.setTextColor(colors.black)
                end
                if selectedpiece == index then
                    monitor.setTextColor(colors.purple)
                end
                monitor.setCursorPos(value.x,value.y)
                monitor.write("N")
            elseif value.pieceName == "bishop" then
                if value.color == "W" then
                    monitor.setTextColor(colors.lightGray)
                elseif value.color == "B" then
                    monitor.setTextColor(colors.black)
                end
                if selectedpiece == index then
                    monitor.setTextColor(colors.purple)
                end
                monitor.setCursorPos(value.x,value.y)
                monitor.write("B")
            elseif value.pieceName == "queen" then
                if value.color == "W" then
                    monitor.setTextColor(colors.lightGray)
                elseif value.color == "B" then
                    monitor.setTextColor(colors.black)
                end
                if selectedpiece == index then
                    monitor.setTextColor(colors.purple)
                end
                monitor.setCursorPos(value.x,value.y)
                monitor.write("Q")
            elseif value.pieceName == "king" then
                if value.color == "W" then
                    monitor.setTextColor(colors.lightGray)
                elseif value.color == "B" then
                    monitor.setTextColor(colors.black)
                end
                if selectedpiece == index then
                    monitor.setTextColor(colors.purple)
                end
                monitor.setCursorPos(value.x,value.y)
                monitor.write("K")
            elseif value.pieceName == "none" then
                monitor.setTextColor(colors.red)
                monitor.setCursorPos(value.x,value.y)
                monitor.write("#")
            end
        end
        
        else
            monitor.clear()
            monitor.setTextScale(2)
            monitor.setCursorPos(3,8)
            monitor.setTextColor(colors.red)
            monitor.setBackgroundColor(colors.black)
            monitor.write("Waiting To Start")

        end
        
        sleep(.1)
    end
end
local Moves = {}
function b()
    --reciving
    while true do
        if GameStarted == true then
            local event, side, x, y = os.pullEvent("monitor_touch") 
        print("Monitor Touched At (" .. x .. ", " .. y .. ")")
        local SavedValues = {}
        SavedValues.originalSpaceX = x
        SavedValues.originalSpaceY = y
        for index, value in pairs(pieceLayout) do
        if value.color == playersturn then
            if value.x == x and value.y == y then
                print("Piece Interacted : "..value.pieceName..", "..value.color..", "..value.init)
                selectedpiece = index
                local eventt, sidet, xt, yt
                repeat
                    eventt, sidet, xt, yt = os.pullEvent("monitor_touch")
                until xt <=8 and yt <=8
                    print("Monitor Touched At (" .. xt .. ", " .. yt .. ")")
                    SavedValues.newSpaceX = xt
                    SavedValues.newSpaceY = yt
                    for indexl, valuel in pairs(pieceLayout) do
                        if valuel.x == xt and valuel.y == yt then
                            SavedValues.newSpacePieceName = valuel.pieceName
                            SavedValues.newSpaceInit = valuel.init
                            if value.x == xt and value.y == yt then
                                selectedpiece = ""
                                break
                            end
                            if valuel.color == playersturn then
                                selectedpiece = ""
                                break
                            end
                            valuel.x = value.x
                            valuel.y = value.y
                            value.x = xt
                            value.y = yt
                            Moves[#Moves+1] = SavedValues
                            print("move Saved as "..#Moves)
                            if valuel.pieceName ~= "none" then
                                valuel.pieceName = "none"
                                valuel.init = 0
                                if speaker and Config.Sound == true then
                                    speaker.playSound("entity.generic.explode",.5)
                                end
                            end

                            selectedpiece = ""
                            if playersturn == "W" then
                                playersturn = "B"
                                print("Black's Turn")
                                break
                            elseif playersturn == "B" then
                                playersturn = "W"
                                print("White's Turn")
                                break
                            end
                        end
                    end
                    break
                end
            end
        end
        end
        sleep(.1)
    end
        
end    
function c()
    local bools = true
    while true do
        if redstone.getInput("right") and bools then
            print("rewinding turn "..#Moves)
            for index, value in pairs(pieceLayout) do
                if value.x == Moves[#Moves].newSpaceX and value.y == Moves[#Moves].newSpaceY then
                    for indexl, valuel in pairs(pieceLayout) do
                        if valuel.x == Moves[#Moves].originalSpaceX and valuel.y == Moves[#Moves].originalSpaceY then
                            value.x = valuel.x
                            value.y = valuel.y
                            valuel.x = Moves[#Moves].newSpaceX
                            valuel.y = Moves[#Moves].newSpaceY
                            valuel.pieceName = Moves[#Moves].newSpacePieceName
                            valuel.init = Moves[#Moves].newSpaceInit
                            table.remove(Moves,#Moves)
                            if playersturn == "W" then
                                playersturn = "B"
                            elseif playersturn == "B" then
                                playersturn = "W"
                            end
                            print("Rewound")
                            break
                        end
                    end
                    break
                end
            end
            bools = false
            
        elseif redstone.getInput("right") == false and bools == false then
            bools = true
        else

        end
        sleep(.5)
    end
end
function d()
    --shield
    while true do
        if GameStarted == true and Config.Shield == true then
            redstoneIntegrator.setOutput("front",true)
        else
            redstoneIntegrator.setOutput("front",false)
        end
        sleep(.1)
    end
end

function e()
    while true do
        if GameStarted == false then
            term.clear()
        term.setCursorPos(1,1)
        print("Game Menu:\n  1 = Start Game\n  2 = Config")
        local promt = read()
        if promt == "1" then
            term.clear()
            term.setCursorPos(1,1)
            print("Game Starting")
            GameStarted = true
            print("Game Running")
        elseif promt == "2" then
            term.clear()
            term.setCursorPos(1,1)
            print("Config: \n  1 = Shield: "..tostring(Config.Shield).."\n  2 = Sound: "..tostring(Config.Sound))
            local promt2 = read()
            if promt2 == "1" then
                term.clear()
                term.setCursorPos(1,1)
                print("Shield:\n (true/false)")
                local promt3 = read()
                if promt3 == "true" then
                    Config.Shield = true
                    print("Config Changed")
                    sleep(.5)
                elseif promt3 == "false" then
                    Config.Shield = false
                    print("Config Changed")
                    sleep(.5)
                end
            elseif promt2 == "2" then
                term.clear()
                term.setCursorPos(1,1)
                print("Sound:\n (true/false)")
                local promt3 = read()
                if promt3 == "true" then
                    Config.Sound = true
                    print("Config Changed")
                    sleep(.5)
                elseif promt3 == "false" then
                    Config.Sound = false
                    print("Config Changed")
                    sleep(.5)
                end
            end
        end
        end
        sleep(.1)
    end
end
parallel.waitForAll(a,b,c,d,e)

