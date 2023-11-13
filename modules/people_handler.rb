require_relative '../person'
require_relative '../student'
require_relative '../teacher'

module PeopleHandler
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    choice = get_user_input_as_integer('Your choice: ')

    case choice
    when 1 then create_student
    when 2 then create_teacher
    else
      puts 'Invalid choice'
    end
  end

  def create_student
    age = get_user_input('Age:')
    name = get_user_input('Name:')
    parent_permission = get_user_input('Has parent permission? [Y/N]').upcase == 'Y'
    student = Student.new(age, name, parent_permission)
    @people << student
    puts 'You added student successfully\n'
  end

  def create_teacher
    age = get_user_input('Age:')
    name = get_user_input('Name:')
    specialization = get_user_input('Specialization')
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
    puts 'You added teacher successfully\n'
  end
end
