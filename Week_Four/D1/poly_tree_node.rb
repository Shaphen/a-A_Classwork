require 'byebug'
class PolyTreeNode

    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def inspect
        value.inspect
    end

    def parent=(parent_node)

        old_parent = self.parent
        old_parent.children.delete(self) if old_parent != nil

        @parent = parent_node
        return nil if parent_node.nil?
        parent_node.children << self unless parent_node.children.include?(self)
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "error" if !self.children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target)

        return self if value == target
        children.each do |child|
            node = child.dfs(target)
            return node if node
        end
        nil
    end
    
    def bfs(target)

        queue = [self] #array starting at root node
        until queue.empty?
            node = queue.pop
            return node if node.value == target
            node.children.each do |child|
                queue.unshift(child)
            end
        end
        nil
    end
end