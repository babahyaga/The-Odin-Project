require './Connect_Four'

describe Game do

    describe '#win_check' do 

        it "runs a check after a piece is placed to see whether or not the piece being placed has resulted in a win"do
        board = Board.new
        board.state = [['o','o','o','o'],[],[],[],[],[],[]]
        game = Game.new
        expect(game.connect_four?(board)).to eq(true)

        end    
    end  
    
    describe '#get_move' do 
        it 'promts the user for a position' do
            game = Game.new
            expect(game.get_move(7)).to eq(7)
        end

        it "onley accepts values between 1-7" do
            game = Game.new
            expect(game.get_move(8)).to eq("Please enter a value between 1-7")
        end
    end
end
