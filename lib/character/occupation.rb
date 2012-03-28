require 'character/occupation/priest'
require 'character/occupation/programmer'
require 'character/occupation/smith'
require 'character/occupation/thief'
require 'character/occupation/warrior'
require 'character/occupation/wizard'

class Character
  module Occupation
    include Common
  end
end