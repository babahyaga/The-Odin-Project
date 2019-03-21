

class Knight

    attr_reader :board
    def initialize
       make_board
        @root = nil
    end

    def make_board
        @board = []
        (1..8).to_a.each do |x|
            (1..8).to_a.each do |y|
                @board << [x,y]
            end
        end
    end
    

    def valid_moves(current_position)
        available_moves = []
        available_moves << [(current_position[0] +2), (current_position[1]+1)]
        available_moves << [(current_position[0] +2), (current_position[1]-1)]
        available_moves << [(current_position[0] -2), (current_position[1]+1)]
        available_moves << [(current_position[0] -2), (current_position[1]-1)]
        available_moves << [(current_position[0] +1), (current_position[1]+2)]
        available_moves << [(current_position[0] -1), (current_position[1]+2)]
        available_moves << [(current_position[0] +1), (current_position[1]-2)]
        available_moves << [(current_position[0] -1), (current_position[1]-2)]

        @valid_moves = []
        available_moves.each do |move|
            @valid_moves << move if @board.include?(move)
        end
        @valid_moves
    end

    def knight_moves(current_position, target,route = [], queue = [])
        @root = current_position if @root.nil?

        if valid_moves(current_position).include?(target)
            route.unshift(target)
            knight_moves(@root,current_position,route) until route.include?(@root)
            return "You made it in #{route.size - 1} moves! Your Route : #{route}"
        else
            @valid_moves.each do |value|
                queue << value
            end
            current_position = queue.shift
            knight_moves(current_position, target, route, queue)
        end
    end



end

x = Knight.new
puts x.knight_moves([1,1],[7,3])