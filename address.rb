class Address

        attr_accessor :kind, :street1, :street2, :city, :state, :postal_code

        def to_s(format='short')
                address = ""
                case format
                when 'long'
                        address += "#{kind} Address:\n"
                        address+=street1
                        if street2
                                address+= " " + street2 + "\n"
                        end
                        address += "#{city}, #{state} #{postal_code}"
                when 'short'
                        address+="#{kind} Address: "
                        address+= street1
                        if street2
                                address += " " + street2
                        end
                        address += ", #{city}, #{state} #{postal_code}"
                end
                address
        end
end

