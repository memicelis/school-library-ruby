require_relative '../book'
module BookHandler
  def create_book
    title = get_user_input('Title:')
    author = get_user_input('Author:')

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully\n'
  end
end
