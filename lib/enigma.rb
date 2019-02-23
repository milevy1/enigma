class Enigma

  def encrypt(message, key, date)

  end

  def key_converter(key)
    key = key.to_s
    { a_key: key[0..1].to_i,
      b_key: key[1..2].to_i,
      c_key: key[2..3].to_i,
      d_key: key[3..4].to_i }
  end

end
