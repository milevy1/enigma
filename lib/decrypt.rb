require './lib/enigma'

encrypted_file_name = ARGV[0]
decrypted_file_name = ARGV[1]
key = ARGV[2]
date = ARGV[3]

enigma = Enigma.new
message = enigma.read_file_text(encrypted_file_name)
decryption = enigma.decrypt(message, key, date)
enigma.write_file_text(decrypted_file_name, decryption[:decryption])

puts "Created '#{decrypted_file_name}' with the key #{decryption[:key]} and date #{decryption[:date]}"
