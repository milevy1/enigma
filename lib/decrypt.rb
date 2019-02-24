require './lib/enigma'

encrypted_file_name = ARGV[0]
decrypted_file_name = ARGV[1]
key = ARGV[2]
date = ARGV[3]

encrypted_file = File.open(encrypted_file_name, "r")
message = encrypted_file.read.chomp
encrypted_file.close

enigma = Enigma.new
decryption = enigma.decrypt(message, key, date)

writer_file = File.open(decrypted_file_name, "w")
writer_file.write(decryption[:decryption])
writer_file.close

puts "Created '#{decrypted_file_name}' with the key #{decryption[:key]} and date #{decryption[:date]}"
