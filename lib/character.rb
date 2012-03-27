require 'rubygems'
require 'active_support'
require 'character/common'
require 'character/race'
require 'character/occupation'

class Character
  include Character::Race
  include Character::Occupation


  def greeting
    if race_module.methods.include?(:race_modifier)
      race_module.race_modifier(clean_greeting)
    else
      clean_greeting
    end
  end

  def clean_greeting
    "#{race_greeting} #{occupation_greeting}"
  end

  def race_greeting
    raise 'Not implemented'
  end

  def occupation_greeting
    raise 'Not implemented'
  end
end