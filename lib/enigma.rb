class Enigma

  def encrypt(message, key, date)
    shifts = shift_converter(key_converter(key), date_converter(date))
    alphabet = ("a".."z").to_a << " "
    message_chars = message.downcase.chars
    encrypted_message = []

    # Iterate over each char in the messsage
    char_counter = 1
    message_chars.each do |character|
      # Check if it is a, b, c, or d shift
      shift = find_shift(char_counter, shifts)

      # Find index of char in the alphabet
      index = alphabet.index(character)
      # Rotate the alphabet to that char
      indexed_alphabet = alphabet.rotate(index)
      # then rotate by the shift
      rotated_alphabet = indexed_alphabet.rotate(shift)
      # push the new char into the encrypted_message
      encrypted_message << rotated_alphabet.first

      # Increment char counter
      if char_counter == 4
        char_counter = 1
      else
        char_counter += 1
      end

    end

    # Convert the array into a string
    encrypted_message = encrypted_message.join

    # Return the hash with string, key, and date
    { encryption: encrypted_message,
      key: key,
      date: date }
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
    case char_counter
    when 1
      return shifts[:a_shift]
    when 2
      return shifts[:b_shift]
    when 3
      return shifts[:c_shift]
    when 4
      return shifts[:d_shift]
    end
  end

end
