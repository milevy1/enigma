require 'date'
require './lib/encryption'
require './lib/file_helpers'
require './lib/crack'

class Enigma
  include Encryption
  include FileHelpers
  include Crack
end
