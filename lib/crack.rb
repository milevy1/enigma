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

  def find_all_potential_keys(message, date)
    offsets = date_converter(date)
    { a_keys: find_potential_keys(message, offsets[:a_offset], :a_key),
      b_keys: find_potential_keys(message, offsets[:b_offset], :b_key),
      c_keys: find_potential_keys(message, offsets[:c_offset], :c_key),
      d_keys: find_potential_keys(message, offsets[:d_offset], :d_key) }
  end

  def find_potential_keys(message, offset, key_letter)
    ending_letter = key_values(message)[key_letter]
    encrypted_letter = ending_associations(message)[ending_letter]
    shift = find_minimum_shift(ending_letter, encrypted_letter)

    generate_potential_keys(shift, offset)
  end

  def find_minimum_shift(decrypted_letter, encrypted_letter)
    alphabet = ("a".."z").to_a << " "
    index_of_decrypted = alphabet.index(decrypted_letter)
    index_of_encrypted = alphabet.index(encrypted_letter)

    shift = index_of_encrypted - index_of_decrypted
    shift = shift + 27 if shift < 0
    shift
  end

  def generate_potential_keys(shift, offset)
    potential_keys = []
    while shift < 100
      potential_keys << shift - offset
      shift += 27
    end
    potential_keys
  end

  def crack_keys(message, date)
    potential_keys = find_all_potential_keys(message, date)
    actual_keys = {}
    potential_keys[:a_keys].each do |a_key|
      # Assume a_key is actual a_key
      actual_keys[:a_key] = a_key
      a_key_second_char = a_key.to_s[-1]

      potential_keys[:b_keys].each do |b_key|
        b_key_first_char = ("0" + b_key.to_s)[-2..-1][0]
        if a_key_second_char == b_key_first_char
          # Assume b_key is actual b_key
          actual_keys[:b_key] = b_key
          b_key_second_char = b_key.to_s[-1]

          potential_keys[:c_keys].each do |c_key|
            c_key_first_char = ("0" + c_key.to_s)[-2..-1][0]
            if b_key_second_char == c_key_first_char
              # Assume c_key is actual c_key
              actual_keys[:c_key] = c_key
              c_key_second_char = c_key.to_s[-1]

              potential_keys[:d_keys].each do |d_key|
                d_key_first_char = ("0" + d_key.to_s)[-2..-1][0]
                if c_key_second_char == d_key_first_char
                  actual_keys[:d_key] = d_key
                  return actual_keys
                end
              end

            end
          end
        end
      end
    end
    "There is no possible key sequence."
  end

  def convert_keys_to_key(keys)
    a_key = ("0" + keys[:a_key].to_s)[-2..-1]
    b_key_second = keys[:b_key].to_s[-1]
    c_key_second = keys[:c_key].to_s[-1]
    d_key_second = keys[:d_key].to_s[-1]

    a_key + b_key_second + c_key_second + d_key_second
  end

  def crack(message, date = todays_date)
    all_keys = crack_keys(message, date)
    if all_keys == "There is no possible key sequence."
      return all_keys
    end
    key = convert_keys_to_key(all_keys)
    decrypt(message, key, date)
  end

end
