require './test/test_helper'
require 'date'
require './lib/enigma'
require './lib/encryption'
require './lib/command_line_interface'

class CommandLineInterfaceTest < Minitest::Test
  include Encryption

  def setup
    @enigma = Enigma.new
    @command_line = CommandLine.new
  end

  def test_it_exists
    assert_instance_of CommandLine, @command_line
  end

end
