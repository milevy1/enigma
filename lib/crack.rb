module Crack

  def last_four_characters(message)
    message[-4..-1].downcase.chars
  end

  def last_four_rotated(message)
    rotate_amount = (message.length - 4) % 4
    last_four_characters(message).rotate(-rotate_amount)
  end

  def ending_associations(message)
    { " " => last_four_characters(message)[0],
      "e" => last_four_characters(message)[1],
      "n" => last_four_characters(message)[2],
      "d" => last_four_characters(message)[3] }
  end

  def key_values(message)
    ending = [" ", "e", "n", "d"]
    rotate_amount = (message.length - 4) % 4
    ending = ending.rotate(-rotate_amount)
    { a_key: ending[0],
      b_key: ending[1],
      c_key: ending[2],
      d_key: ending[3] }
  end

  def crack_shifts(message, date)
    offsets = date_converter(date)
    { a_shift: find_potential_keys(message, offsets[:a_offset], :a_key),
      b_shift: find_potential_keys(message, offsets[:b_offset], :b_key),
      c_shift: find_potential_keys(message, offsets[:c_offset], :c_key),
      d_shift: find_potential_keys(message, offsets[:d_offset], :d_key) }
  end

  def find_potential_keys(message, offset, key_letter)
    ending_letter = key_values(message)[key_letter]
    encrypted_letter = ending_associations(message)[ending_letter]

    shift = find_minimum_shift(ending_letter, encrypted_letter)

    potential_keys = []
    while shift < 100
      potential_keys << shift - offset
      shift += 27
    end
    potential_keys
  end

  def find_minimum_shift(decrypted_letter, encrypted_letter)
    alphabet = ("a".."z").to_a << " "
    index_of_decrypted = alphabet.index(decrypted_letter)
    index_of_encrypted = alphabet.index(encrypted_letter)

    shift = index_of_encrypted - index_of_decrypted
    shift = shift + 27 if shift < 0
    shift
  end

end
