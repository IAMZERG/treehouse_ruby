def benchmark
        start_time = Time.now()
        yield
        stop_time = Time.now()
        return stop_time-start_time 
end

the_times = benchmark {puts "Hello World! "*100}

puts "\ntotal time:  #{the_times}"

