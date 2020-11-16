require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return @board.winner !=  evaluator && @board.winner != nil if @board.over?
    children_nodes_arr = children
    return children_nodes_arr.all?{|child| child.losing_node?(evaluator)} if evaluator == next_mover_mark
    return children_nodes_arr.any?{|child| child.losing_node?(evaluator)}  ## opponent
  end

  def winning_node?(evaluator)
    return @board.winner == evaluator if @board.over?
    children_nodes_arr = children
    return children_nodes_arr.any?{|child| child.winning_node?(evaluator)} if evaluator == next_mover_mark
    return children_nodes_arr.all?{|child| child.winning_node?(evaluator)}
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_nodes_arr = []
    @board.rows.each_with_index do |row,row_i|
      row.each_with_index do |ele, col_i|
        if @board.empty?([row_i, col_i])
          new_board = @board.dup
          new_board[[row_i, col_i]] = @next_mover_mark
          next_move_mark = @next_mover_mark == :x ? :o : :x
          children_nodes_arr << TicTacToeNode.new(new_board, next_move_mark, [row_i, col_i])
        end
      end
    end
    children_nodes_arr
  end
end
