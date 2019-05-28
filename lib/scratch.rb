# building an unbeatable AI
# Find all the moves the computer is able to make
# make one of those moves and check game state.

def best_move(board, player)
  moves = available_moves(board)
  # moves.shuffle
  test_board = copy_board(board)
  availableMovesAndScores = []
  game_test = Game.new
  game_test.board = test_board
  game_test.player_1 = player

  #if game.winner? == player.token then return the score of 1
  moves.each do |move|
    game_test.board.update(move, player)
    score = -1
    if game_test.winner == player.token
      score = 1
    elsif game_test.draw?
      score = 0
    else
      score = -1
    end
    availableMovesAndScores.push([move, score])
    game_test.board.reset!
    # game_test.board.cells[move]
  end
  # availableMovesAndScores.sort {|moveA, moveB| moveA[1] <=> moveB[1]}
  availableMovesAndScores[0]
  # # binding.pry
end
