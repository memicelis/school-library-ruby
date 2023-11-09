require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, parent_permission, classroom = 'Unknown')
    super(age, name, parent_permission:)
    @classroom = classroom
  end

  def add_classroom
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
