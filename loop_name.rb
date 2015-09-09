def get_name
        name = ""
        loop do
                print "Enter your name (minimum 2 characters, no numbers): "
                name = gets.chomp
                if name.length >= 2 && !name.index(/\d/)
                        break
                else
                        puts "name must be longer than 2 characters and not contain numbers."
                end
        end
        return name
end

name = get_name()
puts "Hi #{name}."

