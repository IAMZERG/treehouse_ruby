module LaserBots
        class Player
                attr_reader :name
                def initialize(name)
                        @name = name
                end
        end
end

player = LaserBots::Player.new("Jason")
puts player.name

