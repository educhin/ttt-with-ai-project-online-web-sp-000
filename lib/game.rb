class Game

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5], # Middle row
      [6,7,8], # Bottom Row
      [0,3,6], # Left column
      [1,4,7], # Middle column
      [2,5,8], # Right column
      [0,4,8], # Left to Right diagonal
      [2,4,6] # Right to Left diagonal
    ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    turns = turn_count
    turns % 2 == 0 ? player_1 : player_2
  end

  def turn
    input = current_player.move(@board)
    # cur_player = current_player
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else
      turn
    end
  end

  def turn_count
    turns = 0
    @board.cells.each do |turn|
      if turn == "X" || turn == "O"
        turns +=1
      end
    end
    return turns
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
         return win_combo
      end
    end
    false
  end

  def full?
    @board.cells.all? do |moves|
      moves == "X" || moves == "O"
    end
  end

  def draw?
    if won?
      false
    else
      if full?
        true
      else
        false
      end
    end
  end

  def over?
    if won?
      true
    elsif draw?
      true
    else
      false
    end
  end

  def winner
    if won?
     return @board.cells[won?[0]]
    else
      return nil
    end
  end

  def play
    @board.display
     until over?
        turn
     end
     if won?
        winner == "X" || winner == "O"
        puts "Congratulations #{winner}!"
     elsif draw?
        puts "Cat's Game!"
     end
  end
end
