class BankAccount
        attr_reader :name

        def initialize(name)
                @name = name
                @transactions = []
                add_transaction("Beginning Balance", 0)
        end
        def add_transaction(description, amount)
                @transactions.push(description: description, amount: amount)
        end
        def credit(description, amount)
                add_transaction(description, amount)
        end
        def debit(description, amount)
                add_transaction(description, -amount)
        end
        def balance
                balance = 0
                @transactions.each do |item|
                        balance += item[:amount]
                end
                balance
        end
        def to_s
                "Name: #{name}, Balance #{sprintf("%0.2f", balance)}"
        end

        def print_register
                puts "#{name}'s Bank Account"

                puts "Description".ljust(30) + "Amount".rjust(10)
                puts "-"*40

                
                @transactions.each do |item|
                        puts item[:description].ljust(30) + sprintf("%0.2f",item[:amount]).rjust(10)
                end
                puts "-"*40
                puts "Balance".ljust(30) + balance().to_s.rjust(10)
                puts "-"*40
        end
end

bank_account = BankAccount.new("Jason")
bank_account.credit("Paycheck", 100)
bank_account.debit("groceries", 40)
puts bank_account
puts bank_account.print_register()
