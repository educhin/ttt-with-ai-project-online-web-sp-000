require 'pry'

class Players
  class Computer < Player
    # def move(board)
    #     best_move(board, self)[0]
    # end

    def available_moves(board)
      available_moves = []
      board.cells.each_with_index do |cell, i|
        # cell != "O" || cell != "X"
        move = "#{i + 1}"
        if board.valid_move?(move)
          available_moves.push(move)
        end
      end
      available_moves
    end

    def copy_board(board)
      copy = Board.new
      copy.cells = board.cells
      copy
    end
  end
end

computer = Players::Computer.new("X")
board = Board.new
computer.available_moves(board)
