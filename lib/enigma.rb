class Enigma

  def encrypt(message, key, date)

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

end
