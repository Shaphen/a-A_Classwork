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
        # @parent = parent_node #node2 parent is nil
        # if !parent #node parent doesn't exist?
        #     # @parent.children.delete(self)
        #     return nil
        # else
        #     parent.children.delete(self) #node1.children = [node2,node3].delete(self)
        #     parent.children << self #node1.children << self
        # end
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
        
        # if self.value == target
        #     return self
        # else
        #     if self.children
        #         self.children.each do |child|
        #             result = child.dfs(target)
        #             return result unless result.nil?
        #         end
        #     end
        # end
        
        nil
    end
    
    def bfs(target)

        queue = [self] #array starting at root node
        until queue/empty?
            node = queue.pop
            return node if node.value == target
            node.children.each do |child|
                queue.unshift(child)
            end
        end

        # queue = Queue.new
        # queue.push(self)
        # until queue.empty?
        #     node = queue.shift
        #     return node if node.value == target
        #     node.children.each do |child|
        #         queue.push(child)
        #     end
        # end

        nil
    end
end


