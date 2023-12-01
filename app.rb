require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'classroom'
require_relative 'person'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def selected_option(option)
    case option
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    else
      'Please select valid option from the list!'
    end
  end

  def list_all_people
    @people.each do |person|
      role_info = if person.is_a?(Student)
                    '[Student]'
                  else
                    person.is_a?(Teacher) ? '[Teacher]' : ''
                  end
      puts "#{role_info} Name: #{person.name}, ID: #{person.object_id}, Age: #{person.age}\n"
    end
  end

  def list_all_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    choice = gets.chomp

    case choice
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Your input is wrong'
    end
  end

  def create_student
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.upcase == 'Y'
    student = Student.new(age, name, parent_permission)
    @people << student
    puts 'You added student successfully'
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization'
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
    puts 'You added teacher successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def list_all_books_with_index
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_all_people_with_index
    @people.each_with_index do |person, index|
      role_info = if person.is_a?(Student)
                    '[Student]'
                  else
                    person.is_a?(Teacher) ? '[Teacher]' : ''
                  end
      puts "#{index}) #{role_info} Name: #{person.name}, ID: #{person.object_id}, Age: #{person.age}\n\n"
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_all_books_with_index
    selected_book = gets.chomp.to_i
    puts 'Select a person from the following list by number (not ID)'
    list_all_people_with_index
    selected_person = gets.chomp.to_i
    puts 'Date: '
    date = gets.chomp
    book = @books[selected_book]
    person = @people[selected_person]
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals
    puts "To see person's rentals enter the person ID"
    id = gets.chomp.to_i
    puts 'Rented Books:'
    @rentals.select { |rental| rental.person.object_id == id }.each do |rental|
      book = rental.book
      puts "Date: #{rental.date} Book \"#{book.title}\" by #{book.author}"
    end
  end
end
