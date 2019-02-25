require './test/test_helper'
require './lib/file_helpers'

class FileHelpersTest < Minitest::Test
  include FileHelpers

  def test_read_file_text
    expected = "Hello World!"
    file_name = "./test/test_file_text.txt"

    assert_equal expected, read_file_text(file_name)
  end

  def test_write_file_text
    expected = "Write to file!"
    file_to_write = "./test/test_file_writer.txt"
    write_file_text(file_to_write, "Write to file!")

    assert_equal expected, read_file_text(file_to_write)
  end

end
