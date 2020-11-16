require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)

  end

  def winning_node?(evaluator)

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_nodes_arr = []
    @board.rows.each_with_index do |row,row_i|
      row.each_with_index do |ele, col_i|
        if @board.empty?([row_i, col_i])
          children_nodes_arr << TicTacToeNode.new(@board, @next_mover_mark)

  end
end
