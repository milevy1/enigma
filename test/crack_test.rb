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

end
