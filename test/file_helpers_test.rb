require './test/test_helper'
require './lib/file_helpers'

class FileHelpersTest < Minitest::Test
  include FileHelpers

  def test_read_file_text
    expected = "Hello World!"
    file_name = "./test/test_file_text.txt"

    assert_equal expected, read_file_text(file_name)
  end

end
