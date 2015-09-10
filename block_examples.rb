3.times { puts "hello world"}

def block_method
        puts "This is the first line in block_method"
        yield
        puts "This statement is after the yield keyword."
        yield
end

block_method do
        puts "This statement is called from the block."
end
# when a method takes a block as an argument as in the example above
# the block is executed wherever the yield keyword appears.
#
# the yield keyword is also how Ruby knows that the method takes a block as an argument.

def get_name
        print "Enter your name: "
        name = gets.chomp
        yield name
        name
end

my_name = get_name do |name|
        puts "That's a cool name, #{name}!"
end

puts "My name: #{my_name}" 

def filter(array)
        new_array = []
        array.each do |item|
                matched = yield item
                if matched
                        new_array.push(item)
                end
        end
        return new_array
end

my_array = [1,2,3,4,5,6,7,8,9,10,11,12,14,15,6,1,5,11,101]

new_array = filter(my_array) {|item| item > 9}

puts new_array

                        
