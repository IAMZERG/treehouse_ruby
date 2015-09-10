class TodoItem

        attr_reader :name, :todo_items
        def initialize(name)
                @name = name
                @complete = false
        end

        def complete
                @complete = true
        end

        def mark_incomplete!
                @complete = false
        end

        def mark_complete!
                @complete = true
        end

        def to_s
                if complete?
                        "[C] #{name}"
                else
                        "[I] #{name}"
                end
        end

        def complete?
                @complete
        end
end
