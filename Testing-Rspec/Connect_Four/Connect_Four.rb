class Piece
    attr_accessor :coordinates, :marker
    def initialize(coords, marker)
        @coordinates =  coords
        @marker = marker
    end
end

class Board
    attr_accessor :state, :pieces_and_win_combos, :game
    def initialize(game)
        @state = [[],[],[],[],[],[],[]]
        @pieces_and_win_combos = {}
        @game = game
        display
    end

    def display
        puts "_____________________________________________\n"
        @state.first.zip(*@state[1..-1]).each{ |row| puts row.map{|spot| spot ? "%5s" % spot : '     '}.join(' ')}
        puts "_____________________________________________\n"
        print "    1     2     3     4     5     6     7"
    end


    def place_piece(column)
        column = column.to_i - 1
        piece = Piece.new(generate_coordinates(column),@game.marker)
        @state[column] << piece.marker
        @pieces_and_win_combos[:piece] = generate_possible_wins_on_piece(piece)
       
    end

    #this method is used in the any_wins? method of the Game class
    def get_piece(coords)
        col, row = coords
        return @state[col][row]
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
    attr_accessor :marker
    def initialize
        @marker = nil
        @board = Board.new(self)
        @turn = 0 
        @winner = nil
        play_game
    end

    def play_game
        until @winner != nil
            turn
        end
        puts "Thank you for playing"
    end

    def turn
        if (@turn % 2) == 0
            @marker = "X"
            puts "\nPlease choose the column you would like to drop your piece"
            column = gets.chomp
                until column =~ /^[1-7]{1}$/ && @board.state[column.to_i].length < 6
                    puts "please choose a valid column"
                    column = gets.chomp
                end
            @board.place_piece(column)
            win_check?
            @turn += 1
            @board.display
        else
            @marker = "O"
            puts "Please choose the column you would like to drop your piece"
            column = gets.chomp
                until column =~ /^[1-7]{1}$/ && @board.state[column.to_i].length < 6
                    puts "please choose a valid column"
                    column = gets.chomp
                end
            @board.place_piece(column)
            win_check?
            @turn += 1
            @board.display
        end
    end

    def any_wins?(possible_wins)
        possible_wins.each do |possible_win| 

            if possible_win.any? { |piece_coords| @board.get_piece(piece_coords).nil? }
                next
            end

            if possible_win.all? { |piece_coords| @board.get_piece(piece_coords).marker ==  @marker}
                @winner = @marker
                puts " #{@marker}s win the game!" 
                return true
            end
        end
        return false
    end

    def win_check?
        if @turn >= 7
            @board.pieces_and_win_combos.each do |piece, possible_wins|
                if any_wins?(possible_wins)
                    return true
                end
            end
        end
    end

end




Game.new 