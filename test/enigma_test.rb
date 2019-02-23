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
                 d_key: 15 }

    assert_equal expected, @enigma.key_converter(key)
  end

  def test_date_converter_converts_date_to_indivudual_offsets
    date = "040895"
    expected = { a_offset: 1,
                 b_offset: 0,
                 c_offset: 2,
                 d_offset: 5 }

    assert_equal expected, @enigma.date_converter(date)
  end

  def test_shift_converter_converts_keys_and_offsets_to_shifts
    keys = { a_key: 02,
             b_key: 27,
             c_key: 71,
             d_key: 15 }

    offsets = { a_offset: 1,
                b_offset: 0,
                c_offset: 2,
                d_offset: 5 }

    expected = { a_shift: 3,
                 b_shift: 27,
                 c_shift: 73,
                 d_shift: 20 }

    assert_equal expected, @enigma.shift_converter(keys, offsets)
  end

  def test_it_can_encrypt_with_a_key_and_date
    expected = { encryption: "keder ohulw",
                 key: "02715",
                 date: "040895" }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_encrypt_ignores_characters_not_in_alphabet
    expected = { encryption: "keder ohulw!",
                 key: "02715",
                 date: "040895" }

    assert_equal expected, @enigma.encrypt("hello world!", "02715", "040895")
  end

  def test_encrypt_treats_uppercase_letters_as_lower_case
    expected = { encryption: "keder ohulw",
                 key: "02715",
                 date: "040895" }

    assert_equal expected, @enigma.encrypt("HELLO WoRlD", "02715", "040895")
  end

  def test_find_shift_helper_method
    char_counter = 1
    shifts = { a_shift: 3,
               b_shift: 27,
               c_shift: 73,
               d_shift: 20 }

    assert_equal 3, @enigma.find_shift(char_counter, shifts)
  end

  def test_encrypt_single_character_helper_method
    character = "h"
    shift = 3

    assert_equal "k", @enigma.encrypt_character(character, shift)
  end

  def test_increment_counter
    assert_equal 2, @enigma.increment_counter(1)
    assert_equal 3, @enigma.increment_counter(2)
    assert_equal 4, @enigma.increment_counter(3)
    assert_equal 1, @enigma.increment_counter(4)
  end

  def test_random_key_generates_5_integer_key
    key = @enigma.random_key

    assert_equal 5, key.length
  end

  def test_random_key_generates_integer_betweeen_0_to_99999
    key_as_integer = @enigma.random_key.to_i
    range = (0..99_999)

    assert_equal true, range.include?(key_as_integer)
  end

end
