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

function Chess.GetMoves(piece,Layout)
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
        local Movespaces = 0

        for index, value in pairs(Layout) do
            if value.x == piece.x+8 and value.y == piece.y then
                
                if value.pieceName == "none" then
                    Movespaces = 8
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x+7 and value.y == piece.y  then
                if value.pieceName == "none" then
                    Movespaces = 7
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x+6 and value.y == piece.y  then
                if value.pieceName == "none" then
                    Movespaces = 6
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x+5 and value.y == piece.y  then
                if value.pieceName == "none" then
                    Movespaces = 5
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x+4 and value.y == piece.y then
                if value.pieceName == "none" then
                    Movespaces = 4
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x+3 and value.y == piece.y then
                if value.pieceName == "none" then
                    Movespaces = 3
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x+2 and value.y == piece.y  then
                if value.pieceName == "none" then
                    Movespaces = 2
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x+1 and value.y == piece.y  then
                if value.pieceName == "none" then
                    Movespaces = 1
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            end
        end
        if Movespaces == 8 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+6
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+7
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+8
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces ==7 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+6
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+7
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 6 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+6
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 5 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 4 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 3 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 2 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 1 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        end
        local Movespaces = 0
        
        for index, value in pairs(Layout) do
            if value.x == piece.x-8 and value.y == piece.y   then
                
                if value.pieceName == "none" then
                    Movespaces = 8
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
                
            elseif value.x == piece.x-7 and value.y == piece.y   then
                if value.pieceName == "none" then
                    Movespaces = 7
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x-6 and value.y == piece.y   then
                if value.pieceName == "none" then
                    Movespaces = 6
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x-5 and value.y == piece.y   then
                if value.pieceName == "none" then
                    Movespaces = 5
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x-4 and value.y == piece.y   then
                if value.pieceName == "none" then
                    Movespaces = 4
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x-3 and value.y == piece.y   then
                if value.pieceName == "none" then
                    Movespaces = 3
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x-2 and value.y == piece.y   then
                if value.pieceName == "none" then
                    Movespaces = 2
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x-1 and value.y == piece.y   then
                if value.pieceName == "none" then
                    Movespaces = 1
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            end
            if Movespaces ~= 8 then
                if value.pieceName ~= "none" and piece.color ~= value.color then
                    Movespaces = Movespaces+1
                end
            end
        end
        if Movespaces == 8 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-6
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-7
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-8
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces ==7 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-6
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-7
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 6 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-6
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 5 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 4 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 3 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 2 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 1 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        end
        local Movespaces = 0
            
        for index, value in pairs(Layout) do
            if value.x == piece.x and value.y == piece.y+8   then
                if value.pieceName == "none" then
                    Movespaces = 8
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+7   then
                if value.pieceName == "none" then
                    Movespaces = 7
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+6   then
                if value.pieceName == "none" then
                    Movespaces = 6
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+5   then
                if value.pieceName == "none" then
                    Movespaces = 5
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+4   then
                if value.pieceName == "none" then
                    Movespaces = 4
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+3   then
                if value.pieceName == "none" then
                    Movespaces = 3
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+2   then
                if value.pieceName == "none" then
                    Movespaces = 2
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+1   then
                if value.pieceName == "none" then
                    Movespaces = 1
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            end
        end
        if Movespaces == 8 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+5
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+6
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+7
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+8
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces ==7 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+5
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+6
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+7
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 6 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+5
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+6
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 5 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+5
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 4 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+4
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 3 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+3
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 2 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+2
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 1 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
        end
        local Movespaces =0
        for index, value in pairs(Layout) do
            if value.x == piece.x and value.y == piece.y-8   then
                if value.pieceName == "none" then
                    Movespaces = 8
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-7   then
                
                if value.pieceName == "none" then
                    Movespaces = 7
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-6   then
                if value.pieceName == "none" then
                    Movespaces = 6
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-5   then
                if value.pieceName == "none" then
                    Movespaces = 5
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-4   then
                if value.pieceName == "none" then
                    Movespaces = 4
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-3   then
                if value.pieceName == "none" then
                    Movespaces = 3
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-2   then
                if value.pieceName == "none" then
                    Movespaces = 2
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-1   then
                if value.pieceName == "none" then
                    Movespaces = 1
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            end
        end
        if Movespaces == 8 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-5
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-6
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-7
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-8
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces ==7 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-5
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-6
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-7
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 6 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-5
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-6
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 5 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-5
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 4 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-4
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 3 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-3
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 2 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-2
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 1 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
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
        local Movespaces =0
        for index, value in pairs(Layout) do
            if value.x == piece.x-8 and value.y == piece.y+8   then
                Movespaces = 8
                
            elseif value.x == piece.x-7 and value.y == piece.y+7   then
                Movespaces = 7
            elseif value.x == piece.x-6 and value.y == piece.y+6   then
                Movespaces = 6
            elseif value.x == piece.x-5 and value.y == piece.y+5   then
                Movespaces = 5
            elseif value.x == piece.x-4 and value.y == piece.y+4   then
                Movespaces = 4
            elseif value.x == piece.x-3 and value.y == piece.y+3   then
                Movespaces = 3
            elseif value.x == piece.x-2 and value.y == piece.y+2   then
                Movespaces = 2
            elseif value.x == piece.x-1 and value.y == piece.y+1   then
                Movespaces = 1
            end
            if Movespaces ~= 8 then
                if value.pieceName ~= "none" and piece.color ~= value.color then
                    Movespaces = Movespaces+1
                end
            end
        end
                if Movespaces == 8 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-3
                Move.y = piece.y+3
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-4
                Move.y = piece.y+4
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-5
                Move.y = piece.y+5
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-6
                Move.y = piece.y+6
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-7
                Move.y = piece.y+7
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-8
                Move.y = piece.y+8
                ValidMoves[#ValidMoves+1] = Move
                elseif Movespaces == 7 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-3
                Move.y = piece.y+3
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-4
                Move.y = piece.y+4
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-5
                Move.y = piece.y+5
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-6
                Move.y = piece.y+6
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-7
                Move.y = piece.y+7
                ValidMoves[#ValidMoves+1] = Move
                elseif Movespaces == 6 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-3
                Move.y = piece.y+3
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-4
                Move.y = piece.y+4
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-5
                Move.y = piece.y+5
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-6
                Move.y = piece.y+6
                ValidMoves[#ValidMoves+1] = Move
                elseif Movespaces == 5 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-3
                Move.y = piece.y+3
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-4
                Move.y = piece.y+4
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-5
                Move.y = piece.y+5
                ValidMoves[#ValidMoves+1] = Move
                elseif Movespaces == 4 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-3
                Move.y = piece.y+3
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-4
                Move.y = piece.y+4
                ValidMoves[#ValidMoves+1] = Move
                elseif Movespaces == 3 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-3
                Move.y = piece.y+3
                ValidMoves[#ValidMoves+1] = Move
                elseif Movespaces == 2 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                elseif Movespaces == 1 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
    
                end
                local Movespaces =0
                for index, value in pairs(Layout) do
                if value.x == piece.x+8 and value.y == piece.y+8   then
                    Movespaces = 8
                    
                elseif value.x == piece.x+7 and value.y == piece.y+7   then
                    Movespaces = 7
                elseif value.x == piece.x+6 and value.y == piece.y+6   then
                    Movespaces = 6
                elseif value.x == piece.x+5 and value.y == piece.y+5   then
                    Movespaces = 5
                elseif value.x == piece.x+4 and value.y == piece.y+4   then
                    Movespaces = 4
                elseif value.x == piece.x+3 and value.y == piece.y+3   then
                    Movespaces = 3
                elseif value.x == piece.x+2 and value.y == piece.y+2   then
                    Movespaces = 2
                elseif value.x == piece.x+1 and value.y == piece.y+1   then
                    Movespaces = 1
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            end
                    if Movespaces == 8 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+2
                    Move.y = piece.y+2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+3
                    Move.y = piece.y+3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+4
                    Move.y = piece.y+4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+5
                    Move.y = piece.y+5
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+6
                    Move.y = piece.y+6
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+7
                    Move.y = piece.y+7
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+8
                    Move.y = piece.y+8
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 7 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+2
                    Move.y = piece.y+2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+3
                    Move.y = piece.y+3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+4
                    Move.y = piece.y+4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+5
                    Move.y = piece.y+5
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+6
                    Move.y = piece.y+6
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+7
                    Move.y = piece.y+7
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 6 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+2
                    Move.y = piece.y+2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+3
                    Move.y = piece.y+3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+4
                    Move.y = piece.y+4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+5
                    Move.y = piece.y+5
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+6
                    Move.y = piece.y+6
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 5 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+2
                    Move.y = piece.y+2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+3
                    Move.y = piece.y+3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+4
                    Move.y = piece.y+4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+5
                    Move.y = piece.y+5
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 4 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+2
                    Move.y = piece.y+2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+3
                    Move.y = piece.y+3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+4
                    Move.y = piece.y+4
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 3 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+2
                    Move.y = piece.y+2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+3
                    Move.y = piece.y+3
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 2 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+2
                    Move.y = piece.y+2
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 1 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
        
                    end
                    local Movespaces =0
            for index, value in pairs(Layout) do
                if value.x == piece.x-8 and value.y == piece.y-8   then
                    if value.pieceName == "none" then
                        Movespaces = 8
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                    
                elseif value.x == piece.x-7 and value.y == piece.y-7   then
                    if value.pieceName == "none" then
                        Movespaces = 7
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                elseif value.x == piece.x-6 and value.y == piece.y-6   then
                    if value.pieceName == "none" then
                        Movespaces = 6
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                elseif value.x == piece.x-5 and value.y == piece.y-5   then
                    if value.pieceName == "none" then
                        Movespaces = 5
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                elseif value.x == piece.x-4 and value.y == piece.y-4   then
                    if value.pieceName == "none" then
                        Movespaces = 4
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                elseif value.x == piece.x-3 and value.y == piece.y-3   then
                    if value.pieceName == "none" then
                        Movespaces = 3
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                elseif value.x == piece.x-2 and value.y == piece.y-2   then
                    if value.pieceName == "none" then
                        Movespaces = 2
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                elseif value.x == piece.x-1 and value.y == piece.y-1   then
                    if value.pieceName == "none" then
                        Movespaces = 1
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                end
            end
                    if Movespaces == 8 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-2
                    Move.y = piece.y-2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-3
                    Move.y = piece.y-3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-4
                    Move.y = piece.y-4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-5
                    Move.y = piece.y-5
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-6
                    Move.y = piece.y-6
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-7
                    Move.y = piece.y-7
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-8
                    Move.y = piece.y-8
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 7 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-2
                    Move.y = piece.y-2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-3
                    Move.y = piece.y-3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-4
                    Move.y = piece.y-4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-5
                    Move.y = piece.y-5
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-6
                    Move.y = piece.y-6
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-7
                    Move.y = piece.y-7
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 6 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-2
                    Move.y = piece.y-2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-3
                    Move.y = piece.y-3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-4
                    Move.y = piece.y-4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-5
                    Move.y = piece.y-5
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-6
                    Move.y = piece.y-6
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 5 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-2
                    Move.y = piece.y-2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-3
                    Move.y = piece.y-3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-4
                    Move.y = piece.y-4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-5
                    Move.y = piece.y-5
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 4 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-2
                    Move.y = piece.y-2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-3
                    Move.y = piece.y-3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-4
                    Move.y = piece.y-4
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 3 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-2
                    Move.y = piece.y-2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-3
                    Move.y = piece.y-3
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 2 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-2
                    Move.y = piece.y-2
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 1 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
        
                    end
                    local Movespaces =0
                    for key, value in pairs(Layout) do
                        if value.x == piece.x-8 and value.y == piece.y-8   then
                            if value.pieceName == "none" then
                                Movespaces = 8
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                            
                        elseif value.x == piece.x-7 and value.y == piece.y-7   then
                            if value.pieceName == "none" then
                                Movespaces = 7
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                        elseif value.x == piece.x-6 and value.y == piece.y-6   then
                            if value.pieceName == "none" then
                                Movespaces = 6
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                        elseif value.x == piece.x-5 and value.y == piece.y-5   then
                            if value.pieceName == "none" then
                                Movespaces = 5
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                        elseif value.x == piece.x-4 and value.y == piece.y-4   then
                            if value.pieceName == "none" then
                                Movespaces = 4
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                        elseif value.x == piece.x-3 and value.y == piece.y-3   then
                            if value.pieceName == "none" then
                                Movespaces = 3
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                        elseif value.x == piece.x-2 and value.y == piece.y-2   then
                            if value.pieceName == "none" then
                                Movespaces = 2
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                        elseif value.x == piece.x-1 and value.y == piece.y-1   then
                            if value.pieceName == "none" then
                                Movespaces = 1
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                        end
                    end
                    
                        if Movespaces == 8 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+2
                        Move.y = piece.y-2
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+3
                        Move.y = piece.y-3
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+4
                        Move.y = piece.y-4
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+5
                        Move.y = piece.y-5
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+6
                        Move.y = piece.y-6
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+7
                        Move.y = piece.y-7
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+8
                        Move.y = piece.y-8
                        ValidMoves[#ValidMoves+1] = Move
                        elseif Movespaces == 7 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+2
                        Move.y = piece.y-2
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+3
                        Move.y = piece.y-3
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+4
                        Move.y = piece.y-4
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+5
                        Move.y = piece.y-5
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+6
                        Move.y = piece.y-6
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+7
                        Move.y = piece.y-7
                        ValidMoves[#ValidMoves+1] = Move
                        elseif Movespaces == 6 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+2
                        Move.y = piece.y-2
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+3
                        Move.y = piece.y-3
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+4
                        Move.y = piece.y-4
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+5
                        Move.y = piece.y-5
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+6
                        Move.y = piece.y-6
                        ValidMoves[#ValidMoves+1] = Move
                        elseif Movespaces == 5 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+2
                        Move.y = piece.y-2
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+3
                        Move.y = piece.y-3
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+4
                        Move.y = piece.y-4
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+5
                        Move.y = piece.y-5
                        ValidMoves[#ValidMoves+1] = Move
                        elseif Movespaces == 4 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+2
                        Move.y = piece.y-2
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+3
                        Move.y = piece.y-3
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+4
                        Move.y = piece.y-4
                        ValidMoves[#ValidMoves+1] = Move
                        elseif Movespaces == 3 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+2
                        Move.y = piece.y-2
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+3
                        Move.y = piece.y-3
                        ValidMoves[#ValidMoves+1] = Move
                        elseif Movespaces == 2 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+2
                        Move.y = piece.y-2
                        ValidMoves[#ValidMoves+1] = Move
                        elseif Movespaces == 1 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
            
                        end
    elseif piece.pieceName == "queen" then
        local Movespaces =0
        for index, value in pairs(Layout) do
            if value.x == piece.x-8 and value.y == piece.y+8   then
                Movespaces = 8
                
            elseif value.x == piece.x-7 and value.y == piece.y+7   then
                Movespaces = 7
            elseif value.x == piece.x-6 and value.y == piece.y+6   then
                Movespaces = 6
            elseif value.x == piece.x-5 and value.y == piece.y+5   then
                Movespaces = 5
            elseif value.x == piece.x-4 and value.y == piece.y+4   then
                Movespaces = 4
            elseif value.x == piece.x-3 and value.y == piece.y+3   then
                Movespaces = 3
            elseif value.x == piece.x-2 and value.y == piece.y+2   then
                Movespaces = 2
            elseif value.x == piece.x-1 and value.y == piece.y+1   then
                Movespaces = 1
            end
            if Movespaces ~= 8 then
                if value.pieceName ~= "none" and piece.color ~= value.color then
                    Movespaces = Movespaces+1
                end
            end
        end
                if Movespaces == 8 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-3
                Move.y = piece.y+3
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-4
                Move.y = piece.y+4
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-5
                Move.y = piece.y+5
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-6
                Move.y = piece.y+6
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-7
                Move.y = piece.y+7
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-8
                Move.y = piece.y+8
                ValidMoves[#ValidMoves+1] = Move
                elseif Movespaces == 7 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-3
                Move.y = piece.y+3
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-4
                Move.y = piece.y+4
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-5
                Move.y = piece.y+5
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-6
                Move.y = piece.y+6
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-7
                Move.y = piece.y+7
                ValidMoves[#ValidMoves+1] = Move
                elseif Movespaces == 6 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-3
                Move.y = piece.y+3
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-4
                Move.y = piece.y+4
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-5
                Move.y = piece.y+5
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-6
                Move.y = piece.y+6
                ValidMoves[#ValidMoves+1] = Move
                elseif Movespaces == 5 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-3
                Move.y = piece.y+3
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-4
                Move.y = piece.y+4
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-5
                Move.y = piece.y+5
                ValidMoves[#ValidMoves+1] = Move
                elseif Movespaces == 4 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-3
                Move.y = piece.y+3
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-4
                Move.y = piece.y+4
                ValidMoves[#ValidMoves+1] = Move
                elseif Movespaces == 3 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-3
                Move.y = piece.y+3
                ValidMoves[#ValidMoves+1] = Move
                elseif Movespaces == 2 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
                local Move = {}
                Move.x = piece.x-2
                Move.y = piece.y+2
                ValidMoves[#ValidMoves+1] = Move
                elseif Movespaces == 1 then
                    local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
    
                end
                local Movespaces =0
                for index, value in pairs(Layout) do
                if value.x == piece.x+8 and value.y == piece.y+8   then
                    Movespaces = 8
                    
                elseif value.x == piece.x+7 and value.y == piece.y+7   then
                    Movespaces = 7
                elseif value.x == piece.x+6 and value.y == piece.y+6   then
                    Movespaces = 6
                elseif value.x == piece.x+5 and value.y == piece.y+5   then
                    Movespaces = 5
                elseif value.x == piece.x+4 and value.y == piece.y+4   then
                    Movespaces = 4
                elseif value.x == piece.x+3 and value.y == piece.y+3   then
                    Movespaces = 3
                elseif value.x == piece.x+2 and value.y == piece.y+2   then
                    Movespaces = 2
                elseif value.x == piece.x+1 and value.y == piece.y+1   then
                    Movespaces = 1
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            end
                    if Movespaces == 8 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+2
                    Move.y = piece.y+2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+3
                    Move.y = piece.y+3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+4
                    Move.y = piece.y+4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+5
                    Move.y = piece.y+5
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+6
                    Move.y = piece.y+6
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+7
                    Move.y = piece.y+7
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+8
                    Move.y = piece.y+8
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 7 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+2
                    Move.y = piece.y+2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+3
                    Move.y = piece.y+3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+4
                    Move.y = piece.y+4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+5
                    Move.y = piece.y+5
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+6
                    Move.y = piece.y+6
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+7
                    Move.y = piece.y+7
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 6 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+2
                    Move.y = piece.y+2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+3
                    Move.y = piece.y+3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+4
                    Move.y = piece.y+4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+5
                    Move.y = piece.y+5
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+6
                    Move.y = piece.y+6
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 5 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+2
                    Move.y = piece.y+2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+3
                    Move.y = piece.y+3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+4
                    Move.y = piece.y+4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+5
                    Move.y = piece.y+5
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 4 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+2
                    Move.y = piece.y+2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+3
                    Move.y = piece.y+3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+4
                    Move.y = piece.y+4
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 3 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+2
                    Move.y = piece.y+2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+3
                    Move.y = piece.y+3
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 2 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x+2
                    Move.y = piece.y+2
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 1 then
                        local Move = {}
                    Move.x = piece.x+1
                    Move.y = piece.y+1
                    ValidMoves[#ValidMoves+1] = Move
        
                    end
                    local Movespaces =0
            for index, value in pairs(Layout) do
                if value.x == piece.x-8 and value.y == piece.y-8   then
                    if value.pieceName == "none" then
                        Movespaces = 8
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                    
                elseif value.x == piece.x-7 and value.y == piece.y-7   then
                    if value.pieceName == "none" then
                        Movespaces = 7
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                elseif value.x == piece.x-6 and value.y == piece.y-6   then
                    if value.pieceName == "none" then
                        Movespaces = 6
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                elseif value.x == piece.x-5 and value.y == piece.y-5   then
                    if value.pieceName == "none" then
                        Movespaces = 5
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                elseif value.x == piece.x-4 and value.y == piece.y-4   then
                    if value.pieceName == "none" then
                        Movespaces = 4
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                elseif value.x == piece.x-3 and value.y == piece.y-3   then
                    if value.pieceName == "none" then
                        Movespaces = 3
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                elseif value.x == piece.x-2 and value.y == piece.y-2   then
                    if value.pieceName == "none" then
                        Movespaces = 2
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                elseif value.x == piece.x-1 and value.y == piece.y-1   then
                    if value.pieceName == "none" then
                        Movespaces = 1
                    end
                    if Movespaces ~= 8 then
                        if value.pieceName ~= "none" and piece.color ~= value.color then
                            Movespaces = Movespaces+1
                        end
                    end
                end
            end
                    if Movespaces == 8 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-2
                    Move.y = piece.y-2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-3
                    Move.y = piece.y-3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-4
                    Move.y = piece.y-4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-5
                    Move.y = piece.y-5
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-6
                    Move.y = piece.y-6
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-7
                    Move.y = piece.y-7
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-8
                    Move.y = piece.y-8
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 7 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-2
                    Move.y = piece.y-2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-3
                    Move.y = piece.y-3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-4
                    Move.y = piece.y-4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-5
                    Move.y = piece.y-5
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-6
                    Move.y = piece.y-6
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-7
                    Move.y = piece.y-7
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 6 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-2
                    Move.y = piece.y-2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-3
                    Move.y = piece.y-3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-4
                    Move.y = piece.y-4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-5
                    Move.y = piece.y-5
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-6
                    Move.y = piece.y-6
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 5 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-2
                    Move.y = piece.y-2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-3
                    Move.y = piece.y-3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-4
                    Move.y = piece.y-4
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-5
                    Move.y = piece.y-5
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 4 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-2
                    Move.y = piece.y-2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-3
                    Move.y = piece.y-3
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-4
                    Move.y = piece.y-4
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 3 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-2
                    Move.y = piece.y-2
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-3
                    Move.y = piece.y-3
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 2 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
                    local Move = {}
                    Move.x = piece.x-2
                    Move.y = piece.y-2
                    ValidMoves[#ValidMoves+1] = Move
                    elseif Movespaces == 1 then
                        local Move = {}
                    Move.x = piece.x-1
                    Move.y = piece.y-1
                    ValidMoves[#ValidMoves+1] = Move
        
                    end
                    local Movespaces =0
                    for key, value in pairs(Layout) do
                        if value.x == piece.x-8 and value.y == piece.y-8   then
                            if value.pieceName == "none" then
                                Movespaces = 8
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                            
                        elseif value.x == piece.x-7 and value.y == piece.y-7   then
                            if value.pieceName == "none" then
                                Movespaces = 7
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                        elseif value.x == piece.x-6 and value.y == piece.y-6   then
                            if value.pieceName == "none" then
                                Movespaces = 6
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                        elseif value.x == piece.x-5 and value.y == piece.y-5   then
                            if value.pieceName == "none" then
                                Movespaces = 5
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                        elseif value.x == piece.x-4 and value.y == piece.y-4   then
                            if value.pieceName == "none" then
                                Movespaces = 4
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                        elseif value.x == piece.x-3 and value.y == piece.y-3   then
                            if value.pieceName == "none" then
                                Movespaces = 3
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                        elseif value.x == piece.x-2 and value.y == piece.y-2   then
                            if value.pieceName == "none" then
                                Movespaces = 2
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                        elseif value.x == piece.x-1 and value.y == piece.y-1   then
                            if value.pieceName == "none" then
                                Movespaces = 1
                            end
                            if Movespaces ~= 8 then
                                if value.pieceName ~= "none" and piece.color ~= value.color then
                                    Movespaces = Movespaces+1
                                end
                            end
                        end
                    end
                    
                        if Movespaces == 8 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+2
                        Move.y = piece.y-2
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+3
                        Move.y = piece.y-3
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+4
                        Move.y = piece.y-4
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+5
                        Move.y = piece.y-5
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+6
                        Move.y = piece.y-6
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+7
                        Move.y = piece.y-7
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+8
                        Move.y = piece.y-8
                        ValidMoves[#ValidMoves+1] = Move
                        elseif Movespaces == 7 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+2
                        Move.y = piece.y-2
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+3
                        Move.y = piece.y-3
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+4
                        Move.y = piece.y-4
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+5
                        Move.y = piece.y-5
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+6
                        Move.y = piece.y-6
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+7
                        Move.y = piece.y-7
                        ValidMoves[#ValidMoves+1] = Move
                        elseif Movespaces == 6 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+2
                        Move.y = piece.y-2
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+3
                        Move.y = piece.y-3
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+4
                        Move.y = piece.y-4
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+5
                        Move.y = piece.y-5
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+6
                        Move.y = piece.y-6
                        ValidMoves[#ValidMoves+1] = Move
                        elseif Movespaces == 5 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+2
                        Move.y = piece.y-2
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+3
                        Move.y = piece.y-3
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+4
                        Move.y = piece.y-4
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+5
                        Move.y = piece.y-5
                        ValidMoves[#ValidMoves+1] = Move
                        elseif Movespaces == 4 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+2
                        Move.y = piece.y-2
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+3
                        Move.y = piece.y-3
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+4
                        Move.y = piece.y-4
                        ValidMoves[#ValidMoves+1] = Move
                        elseif Movespaces == 3 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+2
                        Move.y = piece.y-2
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+3
                        Move.y = piece.y-3
                        ValidMoves[#ValidMoves+1] = Move
                        elseif Movespaces == 2 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
                        local Move = {}
                        Move.x = piece.x+2
                        Move.y = piece.y-2
                        ValidMoves[#ValidMoves+1] = Move
                        elseif Movespaces == 1 then
                            local Move = {}
                        Move.x = piece.x+1
                        Move.y = piece.y-1
                        ValidMoves[#ValidMoves+1] = Move
            
                        end
        local Movespaces = 0

        for index, value in pairs(Layout) do
            if value.x == piece.x+8 and value.y == piece.y then
                
                if value.pieceName == "none" then
                    Movespaces = 8
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x+7 and value.y == piece.y  then
                if value.pieceName == "none" then
                    Movespaces = 7
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x+6 and value.y == piece.y  then
                if value.pieceName == "none" then
                    Movespaces = 6
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x+5 and value.y == piece.y  then
                if value.pieceName == "none" then
                    Movespaces = 5
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x+4 and value.y == piece.y then
                if value.pieceName == "none" then
                    Movespaces = 4
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x+3 and value.y == piece.y then
                if value.pieceName == "none" then
                    Movespaces = 3
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x+2 and value.y == piece.y  then
                if value.pieceName == "none" then
                    Movespaces = 2
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x+1 and value.y == piece.y  then
                if value.pieceName == "none" then
                    Movespaces = 1
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            end
        end
        if Movespaces == 8 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+6
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+7
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+8
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces ==7 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+6
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+7
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 6 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+6
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 5 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 4 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 3 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 2 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x+2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 1 then
            local Move = {}
            Move.x = piece.x+1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        end
        local Movespaces = 0
        
        for index, value in pairs(Layout) do
            if value.x == piece.x-8 and value.y == piece.y   then
                
                if value.pieceName == "none" then
                    Movespaces = 8
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
                
            elseif value.x == piece.x-7 and value.y == piece.y   then
                if value.pieceName == "none" then
                    Movespaces = 7
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x-6 and value.y == piece.y   then
                if value.pieceName == "none" then
                    Movespaces = 6
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x-5 and value.y == piece.y   then
                if value.pieceName == "none" then
                    Movespaces = 5
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x-4 and value.y == piece.y   then
                if value.pieceName == "none" then
                    Movespaces = 4
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x-3 and value.y == piece.y   then
                if value.pieceName == "none" then
                    Movespaces = 3
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x-2 and value.y == piece.y   then
                if value.pieceName == "none" then
                    Movespaces = 2
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x-1 and value.y == piece.y   then
                if value.pieceName == "none" then
                    Movespaces = 1
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            end
            if Movespaces ~= 8 then
                if value.pieceName ~= "none" and piece.color ~= value.color then
                    Movespaces = Movespaces+1
                end
            end
        end
        if Movespaces == 8 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-6
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-7
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-8
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces ==7 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-6
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-7
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 6 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-6
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 5 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-5
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 4 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-4
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 3 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-3
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 2 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x-2
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 1 then
            local Move = {}
            Move.x = piece.x-1
            Move.y = piece.y
            ValidMoves[#ValidMoves+1] = Move
        end
        local Movespaces = 0
            
        for index, value in pairs(Layout) do
            if value.x == piece.x and value.y == piece.y+8   then
                if value.pieceName == "none" then
                    Movespaces = 8
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+7   then
                if value.pieceName == "none" then
                    Movespaces = 7
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+6   then
                if value.pieceName == "none" then
                    Movespaces = 6
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+5   then
                if value.pieceName == "none" then
                    Movespaces = 5
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+4   then
                if value.pieceName == "none" then
                    Movespaces = 4
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+3   then
                if value.pieceName == "none" then
                    Movespaces = 3
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+2   then
                if value.pieceName == "none" then
                    Movespaces = 2
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y+1   then
                if value.pieceName == "none" then
                    Movespaces = 1
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            end
        end
        if Movespaces == 8 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+5
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+6
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+7
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+8
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces ==7 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+5
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+6
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+7
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 6 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+5
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+6
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 5 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+5
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 4 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+4
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 3 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+3
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 2 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+2
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 1 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y+1
            ValidMoves[#ValidMoves+1] = Move
        end
        local Movespaces =0
        for index, value in pairs(Layout) do
            if value.x == piece.x and value.y == piece.y-8   then
                if value.pieceName == "none" then
                    Movespaces = 8
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-7   then
                
                if value.pieceName == "none" then
                    Movespaces = 7
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-6   then
                if value.pieceName == "none" then
                    Movespaces = 6
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-5   then
                if value.pieceName == "none" then
                    Movespaces = 5
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-4   then
                if value.pieceName == "none" then
                    Movespaces = 4
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-3   then
                if value.pieceName == "none" then
                    Movespaces = 3
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-2   then
                if value.pieceName == "none" then
                    Movespaces = 2
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            elseif value.x == piece.x and value.y == piece.y-1   then
                if value.pieceName == "none" then
                    Movespaces = 1
                end
                if Movespaces ~= 8 then
                    if value.pieceName ~= "none" and piece.color ~= value.color then
                        Movespaces = Movespaces+1
                    end
                end
            end
        end
        if Movespaces == 8 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-5
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-6
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-7
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-8
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces ==7 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-5
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-6
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-7
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 6 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-5
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-6
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 5 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-4
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-5
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 4 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-3
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-4
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 3 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-2
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-3
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 2 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-2
            ValidMoves[#ValidMoves+1] = Move
        elseif Movespaces == 1 then
            local Move = {}
            Move.x = piece.x
            Move.y = piece.y-1
            ValidMoves[#ValidMoves+1] = Move
        end
    elseif piece.pieceName == "king" then
        for key, value in pairs(Layout) do
            if piece.x+1 == value.x and piece.y == value.y and piece.color ~= value.color then
                
                local Move = {}
                Move.x = piece.x+1
                Move.y = piece.y
                ValidMoves[#ValidMoves+1] = Move
            
            end
            if piece.x == value.x and piece.y+1 == value.y and piece.color ~= value.color then
                
                local Move = {}
                Move.x = piece.x
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
            end
            if piece.x-1 == value.x and piece.y == value.y and piece.color ~= value.color then
                local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y
                ValidMoves[#ValidMoves+1] = Move
            end
            if piece.x == value.x and piece.y-1 == value.y and piece.color ~= value.color then
                local Move = {}
                Move.x = piece.x
                Move.y = piece.y-1
                ValidMoves[#ValidMoves+1] = Move
                
            end
            if piece.x+1 == value.x and piece.y-1 == value.y and piece.color ~= value.color then
                local Move = {}
                Move.x = piece.x+1
                Move.y = piece.y-1
                ValidMoves[#ValidMoves+1] = Move
            end
            if piece.x-1 == value.x and piece.y-1 == value.y and piece.color ~= value.color then
                local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y-1
                ValidMoves[#ValidMoves+1] = Move
            end
            if piece.x+1 == value.x and piece.y+1 == value.y and piece.color ~= value.color then
                local Move = {}
                Move.x = piece.x+1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
            end
            if piece.x-1 == value.x and piece.y+1 == value.y and piece.color ~= value.color then
                local Move = {}
                Move.x = piece.x-1
                Move.y = piece.y+1
                ValidMoves[#ValidMoves+1] = Move
            end
        end
    end
    return ValidMoves
end











return Chess