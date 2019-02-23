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
    skip
    expected = { encryption: "keder ohulw",
                 key: "02715",
                 date: "040895" }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

end
