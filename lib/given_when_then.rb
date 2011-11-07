require "rspec/core"
require "given_when_then/version"

module GivenWhenThen

  class RSpec::Core::ExampleGroup
    class << self
      %w(Given When).each do |m|
        class_eval do
          define_method(m) do |*args, &block|
            describe(m, *args, &block)
          end
        end
      end

      %w(Then And Or).each do |m|
        class_eval do
          define_method(m) do |*args, &block|
            args[0] = "#{m} " + args[0]
            it(*args, &block)
          end
        end
      end
    end
  end

end

