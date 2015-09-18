module Fetcher
        def self.included(c)
                puts "#{c} has been included"
                attr_accessor :fetch_count
        end

        def fetch(item)
                @fetch_count ||= 0
                @fetch_count += 1
                puts "[#{@name}, #{fetch_count}] I'll bring that #{item} righ back!"
        end
end
class Cat 
        include Fetcher
        def initialize(name)
                @name = name
        end
end

class Dog
        include Fetcher
        def initialize(name)
                @name = name
        end
end

dog = Dog.new("fido")
dog.fetch("ball")
cat = Cat.new("Whiskers");
cat.fetch("mouse")
dog.fetch("stick")




