require "yaml"
require "./address.rb"
require "./phone_number.rb"
require "./contact.rb"

class AddressBook
        attr_reader :contacts
        def initialize
                @contacts = []
                open();
        end
        def open
                if File.exists?("contacts.yml")
                        @contacts = YAML.load_file("contacts.yml")
                end
        end

        def save
                File.open("contacts.yml", "w") do |file|
                        file.write(contacts.to_yaml)
                end
        end

        def run
                puts "Address Book"
                loop do
                        puts "="*50 + "\n"
                        puts "Enter a command."
                        puts "a: Add Contact"
                        puts "s: Search"
                        puts "e: Exit"
                        puts "p: Print Contact List"

                        cmd = gets.chomp
                        case cmd
                        when "a"
                                add_contact
                        when "e"
                                break
                        when "p"
                                print_contact_list
                        when "s"
                                print "Find by (n)ame, (a)ddress, or (p)hone number, or just (e)xit this menu?"
                                input = gets.chomp
                                puts "Search for: "
                                search = gets.chomp
                                case input
                                when "e"
                                        save()
                                        break
                                when "n"
                                        find_by_name(search)
                                when "a"
                                        find_by_address(search)
                                when "p"
                                        find_by_phone(search)
                                end
                        end
                end
        end
	def delete_contact
	end


        def print_contact_list
                contacts.each do |contact|
                        puts contact.to_s
                        puts "-"*50
                end
        end

        def add_contact
                contact = Contact.new
                print "Enter first name: "
                first = gets.chomp
                print "\nEnter middle name: "
                middle = gets.chomp
                print "\nEnter last name: "
                last = gets.chomp
                contact.first_name = first
                contact.middle_name = middle
                contact.last_name = last

                loop do
                        puts "Add Phone number or address?"
                        puts "p: Phone number"
                        puts "a: Address"
                        puts "e: Exit"
                        input = gets.chomp
                        case input 
                        when "p"
                                phone = PhoneNumber.new
                                puts "What kind of phone number is it (phone,cell,work,etc)?"
                                kind = gets.chomp
                                puts "Enter the phone number."
                                number = gets.chomp
                                phone.kind = kind
                                phone.number = number
                                contact.phone_numbers.push(phone)
                        when "a"
                                address = Address.new
                                puts "What kind of address is it (home,work,etc)? "
                                kind = gets.chomp
                                puts "Enter the first line of the street"
                                street1 = gets.chomp
                                puts "Enter the second line of the street"
                                street2 = gets.chomp
                                puts "Enter the city."
                                city = gets.chomp
                                puts "Enter the state."
                                state = gets.chomp
                                puts "Enter the Postal Code."
                                pcode = gets.chomp
                                address.street1 = street1
                                address.street2 = street2
                                address.city = city
                                address.state = state
                                address.postal_code = pcode
                                contact.addresses.push(address)
                        when "e"
                                break
                        end
                end

                contacts.push(contact)
        end

        def find_by_name(name)
                results = []
                search = name.downcase
                contacts.each do |contact|
                        if contact.full_name.downcase.include?(search)
                                results.push(contact)
                        end
                end
                print_search(results, search)
       end

        def find_by_number(number)
                results = []
                search = number.gsub("-", "").gsub("(", "").gsub(")", "").gsub(" ", "")
                contacts.each do |contact|
                        contact.phone_numbers.each do |p_number|
                                if p_number.number.gsub("-", "").gsub("(", "").gsub(")", "").gsub(" ", "").include?(search)
                                        results.push(contact)
                                        break
                                end
                        end
                end
                print_search(results, search)
        end

        def find_by_address(query)
                results = []
                search = query.downcase
                contacts.each do |contact|
                        contact.addresses.each do |address|
                                if address.to_s('long').downcase.include?(search)
                                        results.push(contact) unless results.include?(contact)
                                end
                        end
                end
                print_search(results, search)
        end

        def print_search(results, search)
                puts "Results for '#{search}':\n" 
                results.each do |result|
                        puts "#{result.full_name}\n"
                        result.print_phone_numbers
                        result.print_addresses
                end
        end

                                

end

contact = Contact.new
contact.first_name = "Wesley"
contact.last_name = "Wright"

phone = PhoneNumber.new
phone.kind = "cell"
phone.number = "1234567890"

address = Address.new

address.kind="home"
address.street1="123 Main Street"
address.street2="Suite 2001"
address.city = "Louisville"
address.state = "Kentucky"
address.postal_code = "12345"

contact.add_phone_number("home", "1234567890")
contact.add_phone_number("work", "0987653321")

contact.add_address("home", "123 East Main Street", "", "Louisville", "Kentucky", "12345")
contact.add_address("work", "321 East Main Street", "", "Louisville", "Kentucky", "12345")
adbook = AddressBook.new

adbook.contacts.push(contact)

adbook.run

