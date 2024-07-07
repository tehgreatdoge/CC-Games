local Chess = {}


function Chess.trueLocation(x,y)
    local output = ""
    if x == 1 then
        output = "A"..y
    elseif x == 2 then
        output = "B"..y
    elseif x == 3 then
        output = "C"..y
    elseif x == 4 then
        output = "D"..y
    elseif x == 5 then
        output = "E"..y
    elseif x == 6 then
        output = "F"..y
    elseif x == 7 then
        output = "G"..y
    elseif x == 8 then
        output = "H"..y
    end
    return output
end

function Chess.Identify(piece)
    local color
    local pieceIcon
    if piece.pieceName == "pawn"then
        if piece.color == "W" then
            color = colors.white
        elseif piece.color == "B" then
            color = colors.gray
        end
        pieceIcon = "P"
    elseif piece.pieceName == "rook" then
        if piece.color == "W" then
            color = colors.white
        elseif piece.color == "B" then
            color = colors.gray
        end
        pieceIcon = "R"
    elseif piece.pieceName == "knight" then
        if piece.color == "W" then
            color = colors.white
        elseif piece.color == "B" then
            color = colors.gray
        end
        pieceIcon = "N"
    elseif piece.pieceName == "bishop" then
        if piece.color == "W" then
            color = colors.white
        elseif piece.color == "B" then
            color = colors.gray
        end
        pieceIcon = "B"
    elseif piece.pieceName == "queen" then
        if piece.color == "W" then
            color = colors.white
        elseif piece.color == "B" then
            color = colors.gray
        end
        pieceIcon = "Q"
    elseif piece.pieceName == "king" then
        if piece.color == "W" then
            color = colors.white
        elseif piece.color == "B" then
            color = colors.gray
        end
        pieceIcon = "K"
    elseif piece.pieceName == "none" then
        color = colors.red
        pieceIcon = "#"
    end
    return color,pieceIcon
end

---@param piece {x: integer, y: integer, color: "W" | "B", pieceName: "none"|"pawn"|"rook"|"king"|"bishop"|"knight"}
function Chess.GetMoves(piece,Layout, moveHistory)
    ValidMoves = {}
    local Movespaces = 0
    if piece.pieceName == "pawn" then
        if piece.color == "W" then
            local Movespaces = 0
            for index, value in pairs(Layout) do
                if value.x == piece.x and value.y == piece.y-2   then
                    Movespaces = 2
                    
                elseif value.x == piece.x and value.y == piece.y-1   then
                    Movespaces = 1
                end
            end
            local Move = {}
            if Movespaces == 2 then
                Move.x = piece.x
                Move.y = piece.y-2
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x
                Move.y = piece.y-1
                ValidMoves[#ValidMoves+1] = Move
            elseif Movespaces == 1 then
                local Move = {}
                Move.x = piece.x
                Move.y = piece.y-1
                ValidMoves[#ValidMoves+1] = Move
            end
        elseif piece.color == "B" then
            local Movespaces = 0
            for index, value in pairs(Layout) do
                if value.x == piece.x and value.y == piece.y+2   then
                    Movespaces = 2
                    
                elseif value.x == piece.x and value.y == piece.y+1   then
                    Movespaces = 1
                end
            end
            local Move = {}
            if Movespaces == 2 then
                Move.x = piece.x
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
            elseif Movespaces == 1 then
                local Move = {}
                Move.x = piece.x
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
            end
        end
    elseif piece.pieceName == "rook" then
        X = 0
        Y = 0
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x+7 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x+6 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x+5 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x+4 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x+3 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x+2 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x+1 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changing = piece.x + i
                if changing >= 1 and changing <= 8 then
                    local move = {x=changing,y=piece.y}
                    table.insert(ValidMoves, move)
                end
            end
        end
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x-7 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x-6 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x-5 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x-4 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x-3 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x-2 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x-1 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changing = piece.x - i
                if changing >= 1 and changing <= 8 then
                    local move = {x=changing,y=piece.y}
                    table.insert(ValidMoves, move)
                end
            end
        end
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x and value.y == piece.y+7 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+6 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+5 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+4 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+3 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+2 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+1 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changing = piece.y + i
                if changing >= 1 and changing <= 8 then
                    local move = {x=piece.x,y=changing}
                    table.insert(ValidMoves, move)
                end
            end
        end
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x and value.y == piece.y-7 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-6 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-5 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-4 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-3 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-2 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-1 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changing = piece.y - i
                if changing >= 1 and changing <= 8 then
                    local move = {x=piece.x,y=changing}
                    table.insert(ValidMoves, move)
                end
            end
        end
            
            
    elseif piece.pieceName == "knight" then
        
        for index, value in pairs(Layout) do
            if value.x == piece.x+2 and value.y == piece.y+1 and value.color ~= piece.color then

                local Move = {}
                Move.x = piece.x+2
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
            end
            if value.x == piece.x+1 and value.y == piece.y+2 and value.color ~= piece.color then
                
                local Move = {}
                Move.x = piece.x+1
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
            end
            if value.x == piece.x+2 and value.y == piece.y-1 and value.color ~= piece.color then
                Movespaces = 6
                local Move = {}
                Move.x = piece.x+1
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
            end
            if value.x == piece.x-2 and value.y == piece.y+1 and value.color ~= piece.color then
                Movespaces = 5
                local Move = {}
                Move.x = piece.x+2
                Move.y = piece.y-1
                ValidMoves[#ValidMoves+1] = Move
            end
            if value.x == piece.x-2 and value.y == piece.y-1 and value.color ~= piece.color then
                Movespaces = 4
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y-1
                ValidMoves[#ValidMoves+1] = Move
            end
            if value.x == piece.x-1 and value.y == piece.y-2 and value.color ~= piece.color then
                local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y-2
                ValidMoves[#ValidMoves+1] = Move
                
            end
            if value.x == piece.x+1 and value.y == piece.y-2 and value.color ~= piece.color then
                local Move = {}
                Move.x = piece.x+1
                Move.y = piece.y-2
                ValidMoves[#ValidMoves+1] = Move

            end
            if value.x == piece.x-1 and value.y == piece.y+2 and value.color ~= piece.color then
                local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                
            end
        end
    elseif piece.pieceName == "bishop" then
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x+7 and value.y == piece.y+7 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x+6 and value.y == piece.y+6 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x+5 and value.y == piece.y+5 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x+4 and value.y == piece.y+4 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x+3 and value.y == piece.y+3 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x+2 and value.y == piece.y+2 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x+1 and value.y == piece.y+1 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changingX = piece.x + i
                local changingY = piece.y + i
                if changingX >= 1 and changingX <= 8 and changingY >= 1 and changingY <= 8 then
                    local move = {x=changingX,y=changingY}
                    table.insert(ValidMoves, move)
                end
            end
        end
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x-7 and value.y == piece.y+7 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x-6 and value.y == piece.y+6 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x-5 and value.y == piece.y+5 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x-4 and value.y == piece.y+4 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x-3 and value.y == piece.y+3 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x-2 and value.y == piece.y+2 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x-1 and value.y == piece.y+1 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changingX = piece.x - i
                local changingY = piece.y + i
                if changingX >= 1 and changingX <= 8 and changingY >= 1 and changingY <= 8 then
                    local move = {x=changingX,y=changingY}
                    table.insert(ValidMoves, move)
                end
            end
        end
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x-7 and value.y == piece.y-7 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x-6 and value.y == piece.y-6 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x-5 and value.y == piece.y-5 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x-4 and value.y == piece.y-4 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x-3 and value.y == piece.y-3 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x-2 and value.y == piece.y-2 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x-1 and value.y == piece.y-1 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changingX = piece.x - i
                local changingY = piece.y - i
                if changingX >= 1 and changingX <= 8 and changingY >= 1 and changingY <= 8 then
                    local move = {x=changingX,y=changingY}
                    table.insert(ValidMoves, move)
                end
            end
        end
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x+7 and value.y == piece.y-7 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x+6 and value.y == piece.y-6 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x+5 and value.y == piece.y-5 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x+4 and value.y == piece.y-4 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x+3 and value.y == piece.y-3 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x+2 and value.y == piece.y-2 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x+1 and value.y == piece.y-1 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changingX = piece.x + i
                local changingY = piece.y - i
                if changingX >= 1 and changingX <= 8 and changingY >= 1 and changingY <= 8 then
                    local move = {x=changingX,y=changingY}
                    table.insert(ValidMoves, move)
                end
            end
        end
        
    elseif piece.pieceName == "queen" then
        X = 0
        Y = 0
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x+7 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x+6 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x+5 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x+4 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x+3 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x+2 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x+1 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changing = piece.x + i
                if changing >= 1 and changing <= 8 then
                    local move = {x=changing,y=piece.y}
                    table.insert(ValidMoves, move)
                end
            end
        end
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x-7 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x-6 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x-5 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x-4 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x-3 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x-2 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x-1 and value.y == piece.y then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changing = piece.x - i
                if changing >= 1 and changing <= 8 then
                    local move = {x=changing,y=piece.y}
                    table.insert(ValidMoves, move)
                end
            end
        end
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x and value.y == piece.y+7 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+6 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+5 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+4 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+3 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+2 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+1 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changing = piece.y + i
                if changing >= 1 and changing <= 8 then
                    local move = {x=piece.x,y=changing}
                    table.insert(ValidMoves, move)
                end
            end
        end
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x and value.y == piece.y-7 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-6 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-5 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-4 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-3 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-2 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-1 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changing = piece.y - i
                if changing >= 1 and changing <= 8 then
                    local move = {x=piece.x,y=changing}
                    table.insert(ValidMoves, move)
                end
            end
        end
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x+7 and value.y == piece.y+7 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x+6 and value.y == piece.y+6 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x+5 and value.y == piece.y+5 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x+4 and value.y == piece.y+4 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x+3 and value.y == piece.y+3 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x+2 and value.y == piece.y+2 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x+1 and value.y == piece.y+1 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changingX = piece.x + i
                local changingY = piece.y + i
                if changingX >= 1 and changingX <= 8 and changingY >= 1 and changingY <= 8 then
                    local move = {x=changingX,y=changingY}
                    table.insert(ValidMoves, move)
                end
            end
        end
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x-7 and value.y == piece.y+7 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x-6 and value.y == piece.y+6 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x-5 and value.y == piece.y+5 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x-4 and value.y == piece.y+4 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x-3 and value.y == piece.y+3 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x-2 and value.y == piece.y+2 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x-1 and value.y == piece.y+1 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changingX = piece.x - i
                local changingY = piece.y + i
                if changingX >= 1 and changingX <= 8 and changingY >= 1 and changingY <= 8 then
                    local move = {x=changingX,y=changingY}
                    table.insert(ValidMoves, move)
                end
            end
        end
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x-7 and value.y == piece.y-7 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x-6 and value.y == piece.y-6 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x-5 and value.y == piece.y-5 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x-4 and value.y == piece.y-4 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x-3 and value.y == piece.y-3 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x-2 and value.y == piece.y-2 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x-1 and value.y == piece.y-1 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changingX = piece.x - i
                local changingY = piece.y - i
                if changingX >= 1 and changingX <= 8 and changingY >= 1 and changingY <= 8 then
                    local move = {x=changingX,y=changingY}
                    table.insert(ValidMoves, move)
                end
            end
        end
        local Movespaces = 7

        for index, value in pairs(Layout) do
            if value.x == piece.x+7 and value.y == piece.y-7 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 7)
                    else
                        Movespaces = math.min(Movespaces, 6)
                    end
                end
            elseif value.x == piece.x+6 and value.y == piece.y-6 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 6)
                    else
                        Movespaces = math.min(Movespaces, 5)
                    end
                end
            elseif value.x == piece.x+5 and value.y == piece.y-5 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 5)
                    else
                        Movespaces = math.min(Movespaces, 4)
                    end
                end
            elseif value.x == piece.x+4 and value.y == piece.y-4 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 4)
                    else
                        Movespaces = math.min(Movespaces, 3)
                    end
                end
            elseif value.x == piece.x+3 and value.y == piece.y-3 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 3)
                    else
                        Movespaces = math.min(Movespaces, 2)
                    end
                end
            elseif value.x == piece.x+2 and value.y == piece.y-2 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 2)
                    else
                        Movespaces = math.min(Movespaces, 1)
                    end
                end
            elseif value.x == piece.x+1 and value.y == piece.y-1 then
                if value.pieceName ~= "none" then
                    if piece.color ~= value.color then
                        Movespaces = math.min(Movespaces, 1)
                    else
                        Movespaces = math.min(Movespaces, 0)
                    end
                end
            end
        end
        if Movespaces >= 1 then
            for i=1, Movespaces do
                local changingX = piece.x + i
                local changingY = piece.y - i
                if changingX >= 1 and changingX <= 8 and changingY >= 1 and changingY <= 8 then
                    local move = {x=changingX,y=changingY}
                    table.insert(ValidMoves, move)
                end
            end
        end
    end
    return ValidMoves
end











return Chess
