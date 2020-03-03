require_relative "./poly_tree_node.rb"
​
class KPF
​
  attr_reader :pos, :considered_positions
  POSSIBLE_MOVES = [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [-2, -1], [2, -1]]
​
  def self.valid_moves(pos) 
    moves = []
    POSSIBLE_MOVES.each do |position|
      x, y = position
      if (pos[0] + x) >= 0 && (pos[0] + x) <= 8 && (pos[1] + y) >= 0 && (pos[1] + y) <= 8
        moves <<  [(pos[0] + x), (pos[1] + y)]
      end
    end
    moves
  end
​
  def initialize(pos) 
    @pos = pos
    @root_node = PolyTreeNode.new(pos)
    @board = Array.new(8) {Array.new(8)}
    @considered_positions = [pos]
  end
​
  def new_move_positions(pos) # use valid_moves (upgrade from valid_moves)
    result = []
    filtered = KPF.valid_moves(pos)
    filtered.each do |move|
      if !@considered_positions.include?(move)
        result << move
      end
    end
    @considered_positions += result
    return result
  end
​
  def build_move_tree 
    # moves_filtered = new_move_positions(@root_node.value) #moves_filtered is an array of first moves from start
    queue = [@root_node.value] #initialize queue with start
    until queue.empty?
      node = queue.shift #node is the first of queue
      moves = new_move_positions(node)
      moves.each do |move|
        new_child = PolyTreeNode.new(move)
        new_child.parent = node
        node.add_child(new_child)
        queue << new_child
      end
    end
  end
​
  def find_path(end_pos)
    #lets use DFS
    #return tree node instance containing end_pos
    final_node = @root_node.dfs(end_pos)
    trace_path_back(final_node)
  end
  #   return self if value == target
  #   children.each do |child|
  #       node = child.dfs(target)
  #       return node if node
  #   end
​
  def trace_path_back(end_node)
    steps = []
    steps << end_node.value
​
​
    steps.reverse
  end
end