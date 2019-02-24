require 'date'
require './lib/encryption'
require './lib/file_helpers'

class Enigma
  include Encryption
  include FileHelpers
end
