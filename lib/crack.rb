require './lib/enigma'

encrypted_file_name = ARGV[0]
cracked_file_name = ARGV[1]
date = ARGV[2]

enigma = Enigma.new
message = enigma.read_file_text(encrypted_file_name)
cracked = enigma.crack(message, date)
enigma.write_file_text(cracked_file_name, cracked[:decryption])

puts "Created '#{cracked_file_name}' with the key #{cracked[:key]} and date #{cracked[:date]}"
