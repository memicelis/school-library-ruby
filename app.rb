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
require_relative 'save_data'
require_relative 'read_data'

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
    @save_data = SaveData.new
    @read_data = ReadData.new
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

  def save_all_data
    @save_data.save_books_to_json(@books)
    @save_data.save_people_to_json(@people)
    @save_data.save_rentals_to_json(@rentals, @books, @people)
  end

  def read_data_from_files
    @books = @read_data.read_books
    @people = @read_data.read_people
    @rentals = @read_data.read_rentals(@books, @people)
  end
end
