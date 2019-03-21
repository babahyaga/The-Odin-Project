class LinkedList
    attr_accessor :head, :tail, :size
def initialize
    @head = nil
    @tail = nil
    @size = 0
end

def append(value)
    new_node = Node.new(value)
    if @head.nil?
        @head = new_node
        @tail = new_node
    else
        @tail.link = new_node
        @tail = new_node
    end
    @size += 1   
end
def prepend(value)
    new_node = Node.new(value)
    if @head.nil?
        @head = new_node
        @tail = new_node
    else
        new_node.link = @head
        @head = new_node
    end
    @size += 1
end

def at_index(index)
    if index < 0 || index >= size
        nil
    else
        current_node = @head
        index.times { current_node = current_node.link}
        current_node
    end
end

def pop
    return if size.zero?
    current_node = @head
    current_node = current_node.link until current_node.link == @tail
    @tail = current_node
    pop = current_node.next
    current_node.next = nil
    @size -= 1
    pop
end

def contains?(value)
    current_node = @head
   until current_node.value = value || current_node.link.nil?
    current_node = current_node.link 
   end
   current_node.value == value
end

def find(value)
    curent_node = @head
    index = 0
    until current_node.value == value || curent_node.link.nil?
        current_node = curent_node.link
        index+=1
    end
    current_node.value == value ? index : nil
end

def to_s
    current_node = @head
    str = current_node.value
    until current_node.link.nil?
        str = str + '->' + current_node.value
    end
    puts str
end
end

class Node

    attr_accessor :value, :link
def initialize(value = nil)
    @value = value
    @link = nil
end
end
list.append(1)
list.append(2)
 list.append(3)
 list.append(4)
 list.append(5)
 list.append(6)
 list.prepend("fart")

