class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(index)
    @cells[index.to_i - 1]
  end

  def full?
    @cells.all? do |moves|
      moves == "X" || moves == "O"
    end
  end

  def turn_count
    turns = 0
    @cells.each do |turn|
      if turn == "X" || turn == "O"
        turns +=1
      end
    end
    return turns
  end

  def taken?(location)
    index = location.to_i - 1
    @cells[index] != " " && @cells[index] != ""
  end

  def valid_move?(move)
    index = move.to_i - 1
    index.between?(0,8) && !taken?(move)
  end

  def update(move, player)
    index = move.to_i - 1
    @cells[index] = player.token
  end
end
