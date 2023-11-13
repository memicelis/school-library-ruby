require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'classroom'
require_relative 'person'
require_relative 'modules/list_printer'
require_relative 'modules/book_handler'
require_relative 'modules/people_handler'
require_relative 'modules/rental_handler'
require_relative 'modules/user_input_handler'
require_relative 'modules/select_options'


class App
  include ListPrinter
  include BookHandler
  include UserInputHandler
  include PeopleHandler
  include RentalsHandler
  include SelectOptions

  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_people
    print_people(@people)
  end

  def list_all_books
    print_books(@books)
  end

  def list_rentals
    puts "To see person's rentals enter the person ID"
    print_people_with_index(@people)
    id = get_user_input_as_integer('Your choice: ')
    print_rentals_for_person(@rentals, id)
  end
end
