require_relative "List.rb"
require_relative "Node.rb"

list = List.new
list.append(22)
list.prepend(30)
list.append(10)
list.prepend(100)
p list.to_s
list.insert_at(69,2)
p list.to_s
list.remove_at(3)
p list.to_s
p list.at(1)
list.pop
p list.to_s
p list.contains?(40)
p list.contains?(100)
