require_relative '../rental'

module RentalsHandler
    def create_rental
      puts 'Select a book from the following list by number'
      print_books_with_index(@books)
      selected_book = get_user_input_as_integer('Your choice: ')
  
      puts 'Select a person from the following list by number (not ID)'
      print_people_with_index(@people)
      selected_person = get_user_input_as_integer('Your choice: ')
      date = get_user_input('Date: ')
      book = @books[selected_book]
      person = @people[selected_person]
      rental = Rental.new(date, book, person)
      @rentals << rental
      puts 'Rental created successfully\n'
    end
  end