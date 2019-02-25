require 'date'
require './lib/encryption'
require './lib/file_helpers'
require './lib/crack_helpers'

class Enigma
  include Encryption
  include FileHelpers
  include CrackHelpers
end
