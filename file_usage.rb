File.open("saystuff.txt", "w") do |file|
        loop do
                print "Enter some text:  "
                text = gets.chomp
                if text == "exit"
                        break;
                end
                file.puts text
        end
end
                
