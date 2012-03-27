module Common
  def self.included(base)
    puts base.name
  end

  module ClassMethods
    def included(base)
      base.send(:attr_reader, )
    end
  end


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