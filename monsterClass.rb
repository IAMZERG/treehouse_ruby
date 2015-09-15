class Monster

        attr_reader :name, :actions
        def initialize(name)
                @name = name
                @actions = { screams: 0, runs: 0, scares: 0}
        end
        def say(&block)

                print "#{name} says..."
                yield
        end
        def scream(&block)
                actions[:screams]+=1
                print "#{name} screams..."
                yield
        end
        def scare(&block)
                actions[:scares]+=1
                print "#{name} scares you."
                yield self if block_given?
        end
        def print_scoreboard
                puts "-------------------------------"
                puts "#{name} Actions"
                puts "-------------------------------"
                actions.each do |key, value|
                        puts "#{key}: #{value}"
                end
        end

end


monster = Monster.new("Spleen Bleed")

monster.scream do
        puts "'Boo!!!!'"
end

monster.say do
        puts "\nHello.  Welcome to my home!  Please excuse the bloody mess."
end
monster.scare do |m|
        puts "He sneaks up behind you and taps you on the shoulder."
        m.scream { puts "'RaWR!!!'"}
end
monster.print_scoreboard
