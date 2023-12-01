require_relative 'app'
require_relative 'save_data'

class Main
  def start
    new_app = App.new
    new_app.read_data_from_files

    loop do
      display_options
      option = gets.chomp

      break if option == '7'

      new_app.selected_option(option)
    end

    new_app.save_all_data
  end

  private

  def display_options
    puts 'Options:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'
  end
end

def main
  app = Main.new
  app.start
end

main
