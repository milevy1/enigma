require './test/test_helper'
require 'date'
require './lib/enigma'
require './lib/encryption'
require './lib/crack'

class EnigmaTest < Minitest::Test
  include Encryption
  include Crack

  def setup
    @enigma = Enigma.new
  end

  def test_last_four_characters
    expected = ["b", "c", "d", "e"]

    assert_equal expected, @enigma.last_four_characters("abcde")
  end

  def test_crack_with_a_date
    skip
    expected = { decryption: "hello world end",
                 date: "291018",
                 key: "08304" }

    assert_equal expected, @enigma.crack("vjqtbeaweqihssi", "291018")
  end

  def test_crack_with_no_date_should_use_todays_date
    skip
    decryption = @enigma.crack("vjqtbeaweqihssi")
    expected = [:decryption, :date, :key]

    assert_equal expected, decryption.keys
  end

end
