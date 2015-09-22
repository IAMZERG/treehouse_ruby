require "base64"

message = "Welcome to Treehouse"

encoded = Base64.encode64(message)

puts Base64.urlsafe_encode64(message)
puts encoded

