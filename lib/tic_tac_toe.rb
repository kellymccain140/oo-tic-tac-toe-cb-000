class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #left diagonal
  [2,4,6]] #right diagonal

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, value = "X")
    @board[index] = value
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def turn_count()
    @board.count {|token| token == "X" || token == "O"}
  end

  def current_player()
    @board.each do |space|
      if turn_count() % 2 == 0
        return "X"
      else
        return "O"
      end
    end
  end

    def won?()
      WIN_COMBINATIONS.each do |winning_combo|
        if (@board[winning_combo[0]] == "X" && @board[winning_combo[1]] == "X" && @board[winning_combo[2]] == "X") ||
          (@board[winning_combo[0]]== "O" && @board[winning_combo[1]] == "O" && @board[winning_combo[2]] == "O")
          return winning_combo
        end
      end
      return false
    end

    def full?()
      if @board.include?(" ")
        return false
      end
        return true
      end

    def draw?()
      if won?() == false && full?() == true
        return true
      else
        return false
      end
    end

    def over?()
      if full?() != false && (won?() != false || draw?() != false)
        return true
      else
        return false
      end
    end

    def winner()
      if won? != false
        return @board[won?[0]]
      end
      return nil
    end

    def play()
    until over? || won? || draw?
      turn()
      end

      if winner == "X" || winner == "O"
        puts "Congratulations #{winner()}!"
      else
        if draw?()
          puts "Cat's Game!"
      end
    end
  end
end
