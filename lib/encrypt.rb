require './lib/enigma'

message_file_name = ARGV[0]
encryption_file_name = ARGV[1]

message_file = File.open(message_file_name, "r")
message = message_file.read.chop
message_file.close

enigma = Enigma.new
encryption = enigma.encrypt(message)

writer_file = File.open(encryption_file_name, "w")
writer_file.write(encryption[:encryption])
writer_file.close

puts "Created '#{encryption_file_name}' with the key #{encryption[:key]} and date #{encryption[:date]}"
