module Common
  def self.included(base)
    base_name = base.name.split('::').last.downcase
    base.send(:attr_reader, base_name.to_sym)
    base.class_eval <<-EOS
      def initialize(options={})
        @#{base_name} = options[:#{base_name}]
        include_#{base_name}
        super if defined? super
      end

      def #{base_name}=(value)
        @#{base_name} = value
        include_#{base_name}
      end

      def #{base_name}_module
        ActiveSupport::Inflector::constantize("Character::#{base_name.capitalize}::\#{@#{base_name}.capitalize}")
      end

      private
        def include_#{base_name}
          singleton_class = class << self;self;end;
          singleton_class.send(:include, #{base_name}_module)
        end
    EOS
  end
end
