module Tracking
        def instances
                @instances ||= []
        end
        def create(name)
                object = new(name)
                instances.push(object)
                puts "Created a new #{name}"
                return object
        end
end

class Customer
        extend Tracking
        attr_accessor :name
        def initialize(name)
                @name = name
        end

        def to_s
                "[#{@name}]"
        end
end

customer = Customer.create("Wes")
