require 'rubygems'
require 'active_support'
require 'character/race'
require 'character/occupation'

class Character
  include Character::Race
  include Character::Occupation

  def greeting
    race_greeting +
    (race_module.methods.include?(:race_modifier) ? race_module.race_modifier(occupation_greeting) : occupation_greeting)
  end

  def race_greeting
    raise 'Not implemented'
  end

  def occupation_greeting
    raise 'Not implemented'
  end
end