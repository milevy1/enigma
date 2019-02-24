class Enigma

  def encrypt(message, key = random_key, date = todays_date)
    shifts = shift_converter(key_converter(key), date_converter(date))
    encrypted_message = []
    counter = 1
    message.downcase.chars.each do |character|
      encrypted_message << encrypt_character(character, find_shift(counter, shifts))
      counter = increment_counter(counter)
    end
    { encryption: encrypted_message.join, key: key, date: date }
  end

  def decrypt(message, key, date = todays_date)
    shifts = shift_converter(key_converter(key), date_converter(date))
    decrypted_message = []
    counter = 1
    message.downcase.chars.each do |character|
      decrypted_message << decrypt_character(character, find_shift(counter, shifts))
      counter = increment_counter(counter)
    end
    { decryption: decrypted_message.join, key: key, date: date }
  end

  def key_converter(key)
    { a_key: key[0..1].to_i,
      b_key: key[1..2].to_i,
      c_key: key[2..3].to_i,
      d_key: key[3..4].to_i }
  end

  def date_converter(date)
    date = date.to_i
    date_squared = date * date
    last_four = date_squared.to_s[-4..-1]

    { a_offset: last_four[0].to_i,
      b_offset: last_four[1].to_i,
      c_offset: last_four[2].to_i,
      d_offset: last_four[3].to_i }
  end

  def shift_converter(keys, offsets)
    { a_shift: keys[:a_key] + offsets[:a_offset],
      b_shift: keys[:b_key] + offsets[:b_offset],
      c_shift: keys[:c_key] + offsets[:c_offset],
      d_shift: keys[:d_key] + offsets[:d_offset] }
  end

  def find_shift(char_counter, shifts)
    return shifts[:a_shift] if char_counter == 1
    return shifts[:b_shift] if char_counter == 2
    return shifts[:c_shift] if char_counter == 3
    return shifts[:d_shift] if char_counter == 4
  end

  def encrypt_character(character, shift)
    alphabet = ("a".."z").to_a << " "
    index_of_character = alphabet.index(character)

    return character if index_of_character.nil?

    alphabet_starting_at_char = alphabet.rotate(index_of_character)
    alphabet_shifted_to_encrypted_char = alphabet_starting_at_char.rotate(shift)
    alphabet_shifted_to_encrypted_char.first
  end

  def decrypt_character(character, shift)
    alphabet = ("a".."z").to_a << " "
    index_of_character = alphabet.index(character)

    return character if index_of_character.nil?

    alphabet_starting_at_char = alphabet.rotate(index_of_character)
    alphabet_shifted_to_decrypted_char = alphabet_starting_at_char.rotate(-shift)
    alphabet_shifted_to_decrypted_char.first
  end

  def increment_counter(counter)
    if counter == 4
      counter = 1
    else
      counter += 1
    end
  end

  def random_key
    ("0000" + rand(100_000).to_s)[-5..-1]
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

end
