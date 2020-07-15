require "./lib/tictactoe.rb"

describe Board do

    it "produces a board with nine spaces" do
        test = Board.new
        expect(test.array.length).to eql(9)
    end

    it "produces an empty board" do
        test = Board.new
        expect(test.array.all? {|value| value == ' ' }). to equal(true)
    end

    describe "#selection" do
        it "should return false when an invalid selection is made" do
            player1 = Player.new("1", "X")
            player2 = Player.new("2", "O")
            board = Board.new
            test = GamePlay.new(board, player1, player2)
            allow_any_instance_of(Object).to receive(:gets).and_return "10\n"
            

            expect(board.selection(player1)).to eql(false)

        end

        it "should return false when an space is already taken" do
            player1 = Player.new("1", "X")
            player2 = Player.new("2", "O")
            board = Board.new
            test = GamePlay.new(board, player1, player2)
            allow_any_instance_of(Object).to receive(:gets).and_return "1\n"
            board.selection(player1)
            allow_any_instance_of(Object).to receive(:gets).and_return "1\n"
            expect(board.selection(player1)).to eql(false)

        end
    end


    describe "#check_winner" do

        it "identifies when somebody has won horizontally" do
            player1 = Player.new("1", "X")
            player2 = Player.new("2", "O")
            board = Board.new
            test = GamePlay.new(board, player1, player2)
            allow_any_instance_of(Object).to receive(:gets).and_return "1\n"
            board.selection(player1)
            allow_any_instance_of(Object).to receive(:gets).and_return "2\n"
            board.selection(player1)
            allow_any_instance_of(Object).to receive(:gets).and_return "3\n"
            board.selection(player1)

            expect(board.check_winner()).to eql(true)
        end
    end
end
