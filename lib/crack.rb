require './lib/enigma'

encrypted_file_name = ARGV[0]
cracked_file_name = ARGV[1]
date = ARGV[2]

enigma = Enigma.new
message = enigma.read_file_text(encrypted_file_name)
cracked = enigma.crack(message, date)

if cracked == "There is no possible key sequence."
  puts cracked + " Please check that you entered the correct date used for encryption."
else
  enigma.write_file_text(cracked_file_name, cracked[:decryption])
  puts "Created '#{cracked_file_name}' with the key #{cracked[:key]} and date #{cracked[:date]}"
end
