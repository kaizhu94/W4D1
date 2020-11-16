require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    children_arr = node.children 
    children_arr.each do |child|
      return child.prev_move_pos if child.winning_node?(mark)
    end
    children_arr.each do |child|
      return child.prev_move_pos if !(child.losing_node?(mark))
    end
    raise "None losing nodes"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
