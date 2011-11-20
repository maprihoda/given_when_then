require 'given_when_then'
require 'rspec/core'

describe GivenWhenThen do
  describe '#Given' do
    it 'should be defined' do
      lambda { RSpec::Core::ExampleGroup.Given }.should_not raise_exception(NoMethodError)
    end
  end

  describe '#Then' do
    it 'should be an instance of RSpec::Core::Example' do
      example_group = RSpec::Core::ExampleGroup.Given
      example_group.Then('blah', lambda {}).should be_instance_of RSpec::Core::Example
    end
  end
end

