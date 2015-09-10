require "./todo_item"

class TodoList
        attr_reader :name, :todo_items
        def initialize(name)
                @name = name
                @todo_items = []
        end

        def add_item(name)
                todo_items.push(TodoItem.new(name))
        end

        def remove_item(name)
                index = index_of(name)
                if index != nil
                        found = true
                end
                if found 
                        todo_items.delete_at(index)
                        return true
                else
                        return false
                end
        end

        def mark_complete(name)
                index = index_of(name)
                if index != nil
                        @todo_items[index].mark_complete!()
                        return true
                else
                        return false
                end
        end

        def index_of (name)
                index = 0;
                found = false;
                todo_items.each do |todo_item|
                        if todo_item.name == name
                                found=true
                        end
                        if found
                                break
                        else
                                index+=1
                        end
                end

                if index
                        return index
                else
                        return nil
                end
        end

        def print_list(kind="all")
                puts "#{name} List (#{kind})"
                puts "-"*30
                case kind
                when "incomplete"
                        todo_items.each do |todo_item|
                                if !todo_item.complete?
                                        puts todo_item
                                end
                        end
                        puts "\n"
                when "complete"
                        todo_items.each do |todo_item|
                                if todo_item.complete?
                                        puts todo_item
                                end
                        end
                        puts "\n"
                when "all"
                        todo_items.each do |todo_item|
                                puts todo_item
                        end
                end
        end
end

todo_list = TodoList.new("Groceries")
todo_list.add_item("Milk")
todo_list.add_item("Eggs")
todo_list.add_item("bread")
todo_list.mark_complete("Eggs");
todo_list.mark_complete("bread");

todo_list.print_list("all")
todo_list.print_list("complete")
todo_list.print_list("incomplete")

