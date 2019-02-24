require './lib/enigma'

enigma = Enigma.new

message_file = File.open(ARGV[0], "r")
message = message_file.read.chop
message_file.close

encryption = enigma.encrypt(message)

writer_file = File.open(ARGV[1], "w")
writer_file.write(encryption[:encryption])
writer_file.close

puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
