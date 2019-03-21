class Node
    attr_accessor :value, :parent, :left_child,:right_child
    def initialize(value=nil)
        @value = value
        @parent = nil
        @left_child= nil
        @right_child = nil
    end
end

class BinaryTree
    attr_accessor :root, :size, :array
    def initialize(array = nil)
        @root = nil
        @size = 0
        @array = array
        build_tree(@array)
    end

    def build_tree(array)
        array.each do |item|
            node = Node.new(item)
            if @root.nil?
                @root = node
                print @root.to_s
            else
                place_node(@root,item)
                print item.to_s
            end
            @size +=1
        end
    end

    def place_node(preceding_node,item)
        if item >= preceding_node.value
            if preceding_node.right_child
                place_node(preceding_node.right_child,item)
            else
                preceding_node.right_child = Node.new(item)
            end
        else
            if preceding_node.left_child 
                place_node(preceding_node.left_child, item)
            else
                preceding_node.left_child = Node.new(item)
            end
        end
    end

    def breadth_first_search(target)
        @root = node if @root.nil?
        queue = [@root]

        until queue.empty?
            current_node = queue.shift
            puts current_node.value

            return puts "located #{current_node.value}" if current_node.value = target

            queue << current_node.left_child unless current_node.left_child.nil?
            queue << current_node.right_child unless current_node.right_child.nil?
        end
        nil
    end

    def depth_first_search(target)
        return if @root.nil?
        stack = [@root]
        # puts "Search path:"
        until stack.empty?
          current_node = stack.shift
          return puts "located #{current_node.value}" if current_node.value == target
            stack.unshift(current_node.left_child) unless current_node.left_child.nil?
            stack.unshift(current_node.right_child) unless current_node.right_child.nil?
        end
        nil
      end

    def depth_first_search_recursive(value)
        return if @root.nil?
        current_node = @root
        if current_node.value == value
            return "Value #{current_node.value} found in #{current_node.to_s}"
        else 
            depth_first_search_recursive(current_node.left_child) unless current_node.left_child.nil?
            depth_first_search_recursive(current_node.right_child)  unless current_node.right_child.nil?
        end
    end



end

test = BinaryTree.new([1,4,3,2,5,6,4,5,18,6162])
