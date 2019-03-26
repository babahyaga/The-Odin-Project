require './Connect_Four'

describe Board do
    describe "#initialize" do

        it "creates an array of 7 arrays that have a max length of 6" do
        $board = Board.new
        expect($board.state).to eq([[],[],[],[],[],[],[]])
        end

        it "creates a hash to hold game pieces and the possible winning combos" do
        expect($board.pieces_and_win_combos).to eq({})
        end

    end
    
    describe "#place_piece" do

        it "adds a new piece to the array column chosen" do
            expect($board.place_piece(peice_identifier, 0)).to eql($board.state[0][0])
        end

        it "does not add more than 7 pieces to a column" do
            expect(8.times{place_piece(peice_identifier, 0)}).to eql("This column is full")
        end

        it "generates a list of all possible winning combos from that position and adds it to the pieces and win combos hash" do
            game_piece = $board.state[0][0]
            possible_wins = $board.pieces_and_win_combos[game_piece]
            expect(possible_wins).t eq([
                                        [[0,1],[0,2],[0,3]],
                                        [[1,1],[2,2],[3,3]],
                                        [[1,0],[2,0],[3,0]],
                                    ])
        end

    end

end



