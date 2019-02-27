require 'date'
require './lib/encryption'
require './lib/file_helpers'
require './lib/crack_helpers'
require './lib/message_helpers'

class Enigma
  include Encryption
  include FileHelpers
  include CrackHelpers
  include MessageHelpers

  def encrypt(message, key = random_key, date = todays_date)
    shifts = shift_converter(key_converter(key), date_converter(date))
    encrypted_message = []
    counter = 1
    message.downcase.chars.each { |character|
      encrypted_message << encrypt_character(character, find_shift(counter, shifts))
      counter = increment_counter(counter) }
    { encryption: encrypted_message.join, key: key, date: date }
  end

  def decrypt(message, key, date = todays_date)
    shifts = shift_converter(key_converter(key), date_converter(date))
    decrypted_message = []
    counter = 1
    message.downcase.chars.each { |character|
      decrypted_message << decrypt_character(character, find_shift(counter, shifts))
      counter = increment_counter(counter) }
    { decryption: decrypted_message.join, key: key, date: date }
  end
  
end
