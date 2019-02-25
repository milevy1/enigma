module Crack

  def last_four_characters(message)
    message[-4..-1].downcase.chars
  end

  def last_four_rotated(message)
    rotate_amount = (message.length - 4) % 4
    last_four_characters(message).rotate(-rotate_amount)
  end

end
