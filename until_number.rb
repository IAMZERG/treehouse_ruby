def print_hello(number_of_times)
        i = 0
        until i >= number_of_times
                puts "hello"
                i += 1
        end
end

answer = ""
while answer.to_i < 5
        print "How many times do you want to print hello? (Enter a number >= 5 to exit)."
        answer = gets.chomp.to_i
        if answer < 5 
                print_hello(answer)
        else
                puts "Exiting"
        end
end
print_hello(answer)

