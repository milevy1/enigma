require './lib/enigma'

message_file_name = ARGV[0]
encryption_file_name = ARGV[1]
enigma = Enigma.new

message = enigma.read_file_text(message_file_name)
encryption = enigma.encrypt(message)
enigma.write_file_text(encryption_file_name, encryption[:encryption])

puts "Created '#{encryption_file_name}' with the key #{encryption[:key]} and date #{encryption[:date]}"
