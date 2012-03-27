class Character
  module Race
    module Gnome
      def race_greeting
        'Guten Tag.'
      end
      def self.race_modifier(value)
        value.split(' ').map(&:capitalize).join
      end
    end
  end
end