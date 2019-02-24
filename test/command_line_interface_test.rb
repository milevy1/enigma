require './test/test_helper'
require 'date'
require './lib/enigma'
require './lib/encryption'
require './lib/command_line_interface'

class CommandLineInterfaceTest < Minitest::Test
  include Encryption

  def setup
    @enigma = Enigma.new
  end

end
