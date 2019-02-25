require './test/test_helper'
require 'date'
require './lib/enigma'
require './lib/encryption'
require './lib/crack_helpers'

class EnigmaTest < Minitest::Test
  include Encryption
  include CrackHelpers

  def setup
    @enigma = Enigma.new
  end

  def test_last_four_characters
    expected = ["b", "c", "d", "e"]

    assert_equal expected, @enigma.last_four_characters("abcde")
  end

  def test_rotate_last_four_to_a_shifted_character_sequence_1
    expected = ["e", "b", "c", "d"]

    assert_equal expected, @enigma.last_four_rotated("abcde")
  end

  def test_rotate_last_four_to_a_shifted_character_sequence_2
    expected = ["d", "e", "b", "c"]

    assert_equal expected, @enigma.last_four_rotated("aabcde")
  end

  def test_rotate_last_four_to_a_shifted_character_sequence_3
    expected = ["c", "d", "e", "b"]

    assert_equal expected, @enigma.last_four_rotated("aaabcde")
  end

  def test_rotate_last_four_to_a_shifted_character_sequence_4
    expected = ["b", "c", "d", "e"]

    assert_equal expected, @enigma.last_four_rotated("aaaabcde")
  end

  def test_ending_associations
    expected = { " " => "b",
                 "e" => "c",
                 "n" => "d",
                 "d" => "e" }

    assert_equal expected, @enigma.ending_associations("abcde")
  end

  def test_ending_key_values
    expected = { a_key: "d",
                 b_key: " ",
                 c_key: "e",
                 d_key: "n" }

    assert_equal expected, @enigma.key_values("abcde")
  end

  def test_find_all_potential_keys
    expected = { :a_keys=>[8, 35, 62, 89],
                 :b_keys=>[2, 29, 56, 83],
                 :c_keys=>[3, 30, 57, 84],
                 :d_keys=>[4, 31, 58, 85] }

    assert_equal expected, @enigma.find_all_potential_keys("vjqtbeaweqihssi", "291018")
  end

  def test_find_potential_keys
    offsets = date_converter("291018")
    a_offset = offsets[:a_offset]
    expected =  [8, 35, 62, 89]

    assert_equal expected, @enigma.find_potential_keys("vjqtbeaweqihssi", a_offset, :a_key)
  end

  def test_find_minimum_shift
    assert_equal 1, @enigma.find_minimum_shift("a", "b")
    assert_equal 1, @enigma.find_minimum_shift(" ", "a")
    assert_equal 26, @enigma.find_minimum_shift("a", " ")
    assert_equal 0, @enigma.find_minimum_shift("a", "a")
  end

  def test_generate_potential_keys
    shift = 2
    offset = 1

    assert_equal [1, 28, 55, 82], @enigma.generate_potential_keys(shift, offset)
  end

  def test_crack_keys
    expected = { a_key: 8,
                 b_key: 83,
                 c_key: 30,
                 d_key: 4 }

    assert_equal expected, @enigma.crack_keys("vjqtbeaweqihssi", "291018")
  end

  def test_convert_keys_to_key
    keys = { a_key: 8,
             b_key: 83,
             c_key: 30,
             d_key: 4 }

    assert_equal "08304", @enigma.convert_keys_to_key(keys)
  end

  def test_crack_with_a_date
    expected = { decryption: "hello world end",
                 date: "291018",
                 key: "08304" }

    assert_equal expected, @enigma.crack("vjqtbeaweqihssi", "291018")
  end

end
