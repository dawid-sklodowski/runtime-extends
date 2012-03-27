require 'character/race/dwarf'
require 'character/race/elf'
require 'character/race/gnome'
require 'character/race/hobbit'
require 'character/race/human'
require 'character/race/ogre'

class Character
  module Race
    include Common

    def self.included(base)
      base.send(:attr_reader, :race)
    end

    def race=(value)
      @race = value
      include_race
    end

    def initialize(options={})
      @race = options[:race]
      include_race
      super if defined? super
    end

    def race_module
      ActiveSupport::Inflector::constantize("Character::Race::#{@race.capitalize}")
    end

    private
    def include_race
      eigen_class = class << self;self;end;
      eigen_class.send(:include, race_module)
    end
  end
end