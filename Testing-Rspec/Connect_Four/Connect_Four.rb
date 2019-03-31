class Board
    attr_accessor :state, :pieces_and_win_combos
    def initialize
        @state = [["x","x","x","x","x","x"],["o","o","o","o","o","o"],["x","x","x","x","x","x"],["o","o","o","o","o","o"],["x","x","x","x","x","x"],["o","o","o","o","o","o"],["x","x","x","x","x","x"]]
        @pieces_and_win_combos = {}
    end

    def display
        puts "_____________________________________________\n"
        @state.first.zip(*@state[1..-1]).each{ |row| puts row.map{|spot| spot ? "%5s" % spot : '     '}.join(' ')}
        puts "_____________________________________________\n"
        print "    1     2     3     4     5     6     7"
    end

    def place_piece(player, column)
        column -= 1
        if @state[column].length >= 7 
            puts "please select a column that is not full"
        else
            piece = Piece.new(generate_coordinates(column),player)
            @state[column] << piece
            @pieces_and_win_combos[:piece] = generate_possible_wins_on_piece(piece)
        end
    end

    def inbounds?(col,row)
        return false if (col > 7 || col < 0) || (row > 6 || row < 0)
        return true
    end

    def generate_coordinates(col)
        row = @state[col].length
        coordinates = [col, row]
    end

    def generate_possible_wins(col,row,col_mod,row_mod)
        possible_wins = []
        3.times do
            col += col_mod
            row += row_mod
            possible_wins << [col,row]
        end
        return possible_wins
    end

    def generate_possible_wins_on_piece(piece)
        col_row_mods = [[-1,-1],[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1]]
        col, row = piece.coordinates
        possible_wins_on_piece = []
        col_row_mods.each do |mod|
            col_mod, row_mod = mod
            test_col = col + (col_mod*3)
            test_row = row + (row_mod*3)
            if inbounds?(test_col,test_row)
                possible_wins_on_piece.push(generate_possible_wins(col,row,col_mod,row_mod))
            else
                next
            end
        end
        return possible_wins_on_piece
    end


end

class Game
    def initialize
    end
end

class Piece
    attr_accessor :coordinates, :player
    def initialize(coords,player)
        @coordinates =  coords
        @player = player
    end
end