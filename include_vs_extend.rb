module Includedmethods
# Include providesaccess to the methods via class INSTANCES
	def printhello
		puts "Hello include"
	end

	def printnihao
		puts "Ni hao include"
	end
end
module Extendmethods
# Extend provides access to the methods via the class name
	def extendedmethod 
		puts "Ni Hao extend"
	end
end


class Hellos
	include Includedmethods
	extend Extendmethods

	def method_that_depends_on_extended_method
		# these are from the Includedmethods
		extendedmethod	
	end
end

hello = Hellos.new
hello.printhello
hello.printnihao
# Hellos.extendedmethod would produce an error.
Hellos.printhello
Hellos.method_that_depends_on_extended_method
