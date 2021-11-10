module Operations

    def prepend(value)
        head.nil? ? @head = Node.new(value) : @head = Node.new(value,head)
    end

    def append(value)
        return @head = Node.new(value) if head.nil?
        node = head
        until node.nextNode.nil?
            node = node.nextNode
        end
        node.nextNode = Node.new(value)
    end

    def my_count
        return 0 if head.nil?
        node = head
        count = 1
        until node.nextNode.nil?
            node = node.nextNode
            count += 1
        end
        count
    end

    def my_head
        return "No head" if head.nil?
        return "#{head}, value = #{head.value}"
    end

    def tail
        return "No tail" if head.nil?
        node = head
        until node.nextNode.nil?
            node = node.nextNode
        end
        "#{node}, value = #{node.value}"
        
    end

    def at(index)
        begin
           count = 0
           node = head
           until count == index
            node = node.nextNode
            count += 1
           end
           "#{node}, value= #{node.value}" 
        rescue 
            puts "No entry at given index"
        end
    end

    def pop
        return if head.nil?
        size = my_count
        node = head
        for i in 1..(size-2)
            node = node.nextNode
        end
        node.nextNode = nil
    end

    def contains?(val)
      return if head.nil?
      size = my_count
      node = head
      for i in 1..(size)
         return true if node.value == val
         node = node.nextNode
      end
      false
    end

    def find(val)
        return if head.nil?
      size = my_count
      node = head
      for i in 0..(size-1)
         return i if node.value == val
         node = node.nextNode
      end
      nil
    end

    def to_s
        return if head.nil?
        node = head
        display = "(#{node.value})"
        until node.nextNode.nil?
           node = node.nextNode
           display += " -> (#{node.value})"
        end
        "#{display} -> nil"
    end
       
    def insert_at(val,index)
        return "Invalid index" if index > (my_count - 1) || head.nil?
        read = "hecks"
        node = head
        count = 1
        prepend(val) if index == 0
        until index == count 
            node = node.nextNode
            count += 1
         end
       
        read = node.nextNode
        node.nextNode = Node.new(val,read)
    end

    def remove_at(index)
        return "Invalid Index" if index > (my_count - 1) || head.nil?
        return @head = head.nextNode if index == 0
        read = ""
        node = head
        count = 0
         until index-1 == count
            node = node.nextNode
            count += 1
         end
         rest = node.nextNode.nextNode
         return nil if rest.nil?
         node.nextNode = nil
         node.nextNode = rest
        
    end
end

class List
include Operations
    attr_accessor :head,:tail
    def initialize
        @head = nil
        @tail = nil
    end
end