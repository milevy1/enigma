require './test/test_helper'
require 'date'
require './lib/enigma'
require './lib/message_helpers'

class MessageHelpersTest < Minitest::Test
  include MessageHelpers
  
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

end
