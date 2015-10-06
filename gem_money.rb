require "money"

money = Money.new(1000, "USD")

more_money = Money.new(1000, "USD")

all_the_monies = money + more_money
puts all_the_monies.inspect
