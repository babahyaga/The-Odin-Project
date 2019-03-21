

class Game
    attr_accessor :winning_combos
   def initialize
    @winning_combos= [
        [0,1,2],[3,4,5],[6,7,8],
        [0,3,6],[1,4,7],[2,5,8],
        [0,4,8],[2,4,6]
    ]
    @winner = nil
    @player1 = nil
    @player2 = nil
    @board = nil
    @turn = 0
    setup_players
    create_board
    play_game
   end

   def create_board
    @board = Board.new
   end


   def setup_players
    puts "Player one please enter your name"
    name1 = gets.chomp
    @player1 = Player.new(name1, "X")
    puts "#{name1} will be Xs"

    puts "Player two please enter your name"
    name2 = gets.chomp
    @player2 = Player.new(name2, "O")
    puts "#{name2} will be Os"
   end

   def win_check(player,board)
    check = @winning_combos.any? do |combo|
        combo.all? do |index|
            board.board[index] == player.marker
        end       
    end
    if check == true
        @winner = player
        end_game(@winner)
    else
        @turn += 1
        if @turn >= 9 
            @winner = "tie"
            end_game(@winner)
        end
    end
   end

   def play_game
    until @winner != nil
        @player1.move(@board)
        win_check(@player1,@board)
        @player2.move(@board)
        win_check(@player2,@board)
    end
   end

   def end_game(winner)
    if winner != "tie"
        puts "#{winner.name} is the winner"
    else
        puts "It's a tie"
    end
    reset
   end
   
   def reset
    puts "Do you want to play again?"
    response = gets.chomp
    if response.downcase == 'yes'
        Game.new
    else
       puts "Ok goodbye sucka"
        exit
   end
end

class Board
    attr_accessor :board
    def initialize
        @board = [1,2,3,4,5,6,7,8,9]
        puts_board(@board)
    end

    def puts_board(board)
        puts "#{board[0]} | #{board[1]} | #{board[2]}"
        puts "--- --- ---"
        puts "#{board[3]} | #{board[4]} | #{board[5]}"
        puts "--- --- ---"
        puts "#{board[6]} | #{board[7]} | #{board[8]}"    
    end

    def update_board(player, position)
        @board[position] = player.marker
        puts_board(@board)
    end
end

class Player
    attr_reader :name, :marker 
    def initialize(name, marker)
        @name = name
        @marker = marker
    end

    def get_move(board)
        puts "#{name}, please choose the position of your #{marker}"
        position = gets.chomp
            until position =~ /^[0-8]{1}$/ && (board.board[position.to_i] != 'X' && board.board[position.to_i] != 'O')
                puts "Please type an integer that represents an open space"
                position = gets.chomp
            end
            position
    end

    def move(board)
        position = get_move(board)
        board.update_board(self, position.to_i)
    end
end


Game.new end