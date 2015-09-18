module Fetcher
        def fetch(item)
                puts "I'll bring that #{item} righ back!"
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




