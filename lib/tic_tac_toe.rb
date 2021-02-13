class TicTacToe
    WIN_COMBINATIONS =[
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    def initialize
        @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        index = user_input.to_i
        index -=1
        index
    end

    def move(index, player_token = "X")
        @board[index] = player_token
    end

    def position_taken?(index)
        if @board[index] == " " || @board[index] == ' '
            false
        else
            true
        end
    end

    def valid_move?(index)
        if position_taken?(index) == false && index >= 0 && index <= 8
            true
        else
            false
        end
    end

    def turn_count
        counter = 0
        @board.map do |tokens|
            if tokens != " "
                counter += 1
            end
        end
        counter
    end

    def current_player
        if turn_count % 2 == 0
            "X"
        else
            "O"
        end
    end

    def turn
        correct = false
        while correct != true
            puts "Choose a position on the board between 1 and 9."
            position = gets.chomp
            array_position = input_to_index(position)
            if valid_move?(array_position)
                correct = true
            end
        end
        move(array_position, current_player)
        display_board
    end

    def won?
        WIN_COMBINATIONS.each do |wins|
            if wins.all?{|win_nums| @board[win_nums] == "X"}
                return wins
            elsif wins.all?{|win_nums| @board[win_nums] == "O"}
                return wins
            end
        end
        false
    end


    def full?
        if @board.all? {|tokens| tokens != " "}
            true
        else
            false
        end
    end

    def draw?
        if full? && won? == false
            true
        else 
            false
        end
    end

    def over?
        if won? || full? 
            true
        end
    end

    def winner
        WIN_COMBINATIONS.each do |wins|
            if wins.all?{|win_nums| @board[win_nums] == "X"}
                return "X"
            elsif wins.all?{|win_nums| @board[win_nums] == "O"}
                return "O"
            end
        end
        nil
    end

    def play
        until over? || won? || draw?
            turn
        end

        if won?
            if winner == "X"
                puts "Congratulations X!"
            elsif winner == "O"
                puts "Congratulations O!"
            end

        elsif draw?
            puts "Cat's Game!"
        end
    end

end
