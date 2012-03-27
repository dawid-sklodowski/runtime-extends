require 'character/occupation/priest'
require 'character/occupation/programmer'
require 'character/occupation/smith'
require 'character/occupation/thief'
require 'character/occupation/warrior'
require 'character/occupation/wizard'

class Character
  module Occupation
    def included(base)
      base.send(:attr_reader, :occupation)
    end

    def occupation=(value)
      @occupation = value
      include_occupation
    end

    def initialize(options={})
      @occupation = options[:occupation]
      include_occupation
      super if defined? super
    end

    def occupation_module
      ActiveSupport::Inflector::constantize("Character::Occupation::#{@occupation.capitalize}")
    end

    private
    def include_occupation
      eigen_class = class << self;self;end;
      eigen_class.send(:include, occupation_module)
    end
  end
end