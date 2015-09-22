module Inventoryable
        def self.included(c)
                c.extend(ClassMethods)
                c.extend(Enumerable)
        end

        module ClassMethods
               def create(attributes)
                       object = new(attributes)
                       instances.push(object)
                       return object
               end 
               def instances
                       @instances ||= []
               end
               def report(title, items)
                       puts title
                       items.each do |item|
                               line = []
                               line.push("Item: #{item.attributes[:name]}")
                               line.push("Stock: #{item.stock_count}")
                               if item.attributes.include?(:size)
                                       line.push("Size: #{item.attributes[:size]}")
                               end
                               puts line.join("\t")
                       end
                       puts "\n"
               end


               def in_stock_report
                       title = "#{self.to_s} In Stock Report"
                       reportable = instances.select{ |instance| instance.in_stock? }
                       report(title, reportable)
               end

               def out_of_stock_report
                       title = "#{self.to_s} Out of Stock Report"
                       reportable = instances.select{ |instance| !(instance.in_stock?)}
                       report(title, reportable)
               end

               def each(&block)
                       instances.each(&block)
               end

        end

        def stock_count
                @stock_count ||= 0
        end

        def stock_count=(number)
                @stock_count = number
        end

        def in_stock?
                @stock_count ||= 0
                @stock_count > 0
        end

end
module Treehouse
        class Pant
                include Inventoryable
                attr_accessor :attributes

                def initialize(attributes)
                        @attributes = attributes
                end
        end
        class Accessory
                include Inventoryable
                attr_accessor :attributes

                def initialize(attributes)
                        @attributes = attributes
                end
        end

        class Shirt
                include Inventoryable
                attr_accessor :attributes

                def initialize(attributes)
                        @attributes = attributes
                end
        end
end

shirt = Treehouse::Shirt.create(name: "MTF", size: "L")
shirt2 = Treehouse::Shirt.create(name: "MTF", size: "S")
pant1 = Treehouse::Pant.create(name: "Jeans", size: "M")
pant2 = Treehouse::Pant.create(name: "Khakis", size: "M")
pant3 = Treehouse::Pant.create(name: "Jeans", size: "S")
accessory = Treehouse::Accessory.create(name: "Necklace")
accessory2 = Treehouse::Accessory.create(name: "Belt", size: "M")
accessory.stock_count = 2
accessory2.stock_count = 15
pant2.stock_count = 2
pant3.stock_count = 0
shirt.stock_count = 0
shirt2.stock_count = 10
puts shirt.stock_count
puts shirt.in_stock?
puts shirt2.in_stock?

Treehouse::Shirt.in_stock_report
Treehouse::Shirt.out_of_stock_report
Treehouse::Pant.out_of_stock_report


