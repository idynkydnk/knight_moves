class Node
  attr_accessor :value, :children, :parent

  def initialize(value = nil, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end
end

class Graph
  attr_reader :root
  def initialize
    @root = Node.new
  end

  def add_node(data, parent_node)
    if @root.value.nil?
      @root.value = data
    else
      parent_node.children << data
    end
  end
end
