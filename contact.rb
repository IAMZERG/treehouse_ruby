require "./phone_number.rb"
require "./address.rb"

class Contact
        attr_writer :first_name, :middle_name, :last_name
        attr_reader  :addresses, :phone_numbers
        def initialize
                @phone_numbers = []
                @addresses = []
        end


        def first_name
                @first_name
        end

        def middle_name
                @middle_name
        end

        def last_name
                @last_name
        end

        def full_name
                full_name = first_name
                if !@middle_name.nil?
                        full_name+= " "
                        full_name += middle_name
                end
                full_name += " "
                full_name += last_name
                full_name
        end

        def last_first
              full_name = last_name + ","
                if !@middle_name.nil?
                        full_name+= " "
                        full_name += middle_name
                end
                full_name += " "
                full_name += first_name
                full_name

        end

        def add_phone_number(kind, number)
                phone = PhoneNumber.new
                phone.kind = kind
                phone.number = number
                phone_numbers.push(phone)
        end

        def add_address(kind, street1, street2, city, state, postal)
                address = Address.new
                address.kind = kind
                address.street1 = street1
                address.street2 = street2
                address.city = city
                address.state = state
                address.postal_code = postal
                addresses.push(address)
        end

        def print_phone_numbers
                phone_numbers.each do |phone_number|
                        puts "#{phone_number.kind}: #{phone_number.number} \n"
                end
        end

        def print_addresses
                addresses.each do |address|
                        puts "#{address.kind} Address:\n #{address.street1} #{address.street2} \n #{address.city}, #{address.state} #{address.postal_code}\n\n"
                end
        end
        def to_s
                puts full_name
                print_phone_numbers
                print_addresses
        end
end
