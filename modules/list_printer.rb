require_relative '../student'
require_relative '../teacher'
module ListPrinter
    def print_books(books)
      books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    end
  
    def print_people(people)
      people.each do |person|
        role_info = person_role_info(person)
        puts "#{role_info} Name: #{person.name}, ID: #{person.object_id}, Age: #{person.age}\n"
      end
    end
  
    def print_books_with_index(books)
      books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    end
  
    def print_people_with_index(people)
      people.each_with_index do |person, index|
        role_info = person_role_info(person)
        puts "#{index}) #{role_info} Name: #{person.name}, ID: #{person.object_id}, Age: #{person.age}\n\n"
      end
    end
  
    def print_rentals_for_person(rentals, person_id)
      puts 'Rented Books:'
      rentals_for_person = rentals.select { |rental| rental.person.object_id == person_id }
      rentals_for_person.each do |rental|
        book = rental.book
        puts "Date: #{rental.date} Book \"#{book.title}\" by #{book.author}"
      end
    end
  
    private
  
    def person_role_info(person)
      if person.is_a?(Student)
        '[Student]'
      else
        person.is_a?(Teacher) ? '[Teacher]' : ''
      end
    end
  end
  