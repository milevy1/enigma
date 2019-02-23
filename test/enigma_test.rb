require './test/test_helper'
require 'date'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_key_converter_converts_key_to_individual_keys
    key = "02715"
    expected = { a_key: 02,
                 b_key: 27,
                 c_key: 71,
                 d_key: 15
               }

    assert_equal expected, @enigma.key_converter(key)
  end

  def test_it_can_encrypt_with_a_key_and_date
    skip
    expected = { encryption: "keder ohulw",
                 key: "02715",
                 date: "040895" }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

end
