require_relative '../decorator'
require_relative '../person'

describe Decorator do
  it 'has a new instance of Decorator' do
    person = Person.new 30, 'Elis'
    expect(Decorator.new(person)).to be_instance_of Decorator
  end
end
