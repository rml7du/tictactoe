class Player
    attr_reader :player_name, :token

    def initialize(player_name, token)
        @player_name = player_name
        @token = token
    end
end

class Board
    def initialize()
        @array = Array.new(9){" "}
    end

    def selection(player)
        selection = gets.chomp
        if !('0'..'9').include?("#{selection}")
            puts "invalid selection, please try again"
            return false
        elsif @array[selection.to_i - 1] != " "
            puts "that space is taken, try again"
            return false
        else 
            @array[selection.to_i - 1] = player.token
        end
    end

    def print_board
        puts "
      #{@array[0]}  |  #{@array[1]}  |  #{@array[2]}  
    -----|-----|-----
      #{@array[3]}  |  #{@array[4]}  |  #{@array[5]}  
    -----|-----|-----
      #{@array[6]}  |  #{@array[7]}  |  #{@array[8]}  "
    end

    def check_winner()
        if 
            @array[0] + @array[1] + @array[2] == "XXX" ||
            @array[3] + @array[4] + @array[5] == "XXX" ||
            @array[6] + @array[7] + @array[8] == "XXX" ||
            @array[0] + @array[3] + @array[6] == "XXX" ||
            @array[1] + @array[4] + @array[7] == "XXX" ||
            @array[2] + @array[5] + @array[8] == "XXX" ||
            @array[0] + @array[4] + @array[8] == "XXX" ||
            @array[6] + @array[4] + @array[2] == "XXX" ||
            @array[0] + @array[1] + @array[2] == "OOO" ||
            @array[3] + @array[4] + @array[5] == "OOO" ||
            @array[6] + @array[7] + @array[8] == "OOO" ||
            @array[0] + @array[3] + @array[6] == "OOO" ||
            @array[1] + @array[4] + @array[7] == "OOO" ||
            @array[2] + @array[5] + @array[8] == "OOO" ||
            @array[0] + @array[4] + @array[8] == "OOO" ||
            @array[6] + @array[4] + @array[2] == "OOO"
            return true
        else
        end
    end
        
end

class GamePlay
    attr_reader :player_turn, :turn_count

    def initialize(board, player_1, player_2)
        puts board.print_board
        @player_1 = player_1
        @player_2 = player_2
        @player_turn = player_1
        @turn_count = 1
    end

    def turn_over(board)
        @turn_count +=1
        if @player_turn == @player_1 
            @player_turn = @player_2
        else @player_turn = @player_1 
        end
        puts board.print_board
    end
end

### Set Up Game ###
puts "Player 1, what is your name?"
player_name = gets.chomp
player_1 = Player.new(player_name, "X")

puts "Player 2, what is your name?"
player_name = gets.chomp
player_2 = Player.new(player_name, "O")

puts "Great! Let us begin #{player_1.player_name} and  #{player_2.player_name}."
board = Board.new
game = GamePlay.new(board, player_1, player_2)

while game.turn_count < 10
    player = game.player_turn
    puts "#{player.player_name} is up. Please make a selection 1-9."
    while !board.selection(player)
    end 
    game.turn_over(board)

    if board.check_winner()
        puts "#{player.player_name.upcase} IS THE WINNER"
        break
    elsif game.turn_count == 10
        puts "Game Over, its a tie!"
    else
    end
end