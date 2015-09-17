class Player
        include Comparable
        attr_accessor :name, :score

        def initialize(name, score)
                @name = name
                @score = score
        end

        def <=>(other_player)
                score <=> other_player.score
        end
end

player1 = Player.new("jason", 100);
player2 = Player.new("Kenneth", 120);

puts "player1<player2: %s" % (player1 > player2);
