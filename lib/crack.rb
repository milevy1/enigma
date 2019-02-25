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

end
