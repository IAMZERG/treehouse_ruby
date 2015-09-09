
array = [0,1,2,3,4,5]

i = 0

array.each do |item|
        item = array[i] + 2
        puts "The current item + 2 is #{item}"
        i +=1
end
