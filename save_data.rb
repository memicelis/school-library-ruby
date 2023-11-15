require 'json'
require 'fileutils'

class SaveData
  DATA_FOLDER = './data'.freeze

  def initialize
    FileUtils.mkdir_p(DATA_FOLDER) unless File.directory?(DATA_FOLDER)
  end

  def save_books_to_json(books)
    books_array = []
    books.each do |book|
      books_array << { title: book.title, author: book.author }
    end
    return if books_array.empty?

    File.write(File.join(DATA_FOLDER, 'books.json'), JSON.pretty_generate(books_array))
  end

  def save_people_to_json(people)
    people_array = []
    people.each do |person|
      person_obj = {
        name: person.name,
        age: person.age,
        type: person.class.name
      }
      if person.instance_of?(::Teacher)
        person_obj[:specialization] = person.specialization
      else
        person_obj[:has_permission] = person.parent_permission
      end
      people_array << person_obj
    end
    return if people_array.empty?

    File.write(File.join(DATA_FOLDER, 'people.json'), JSON.pretty_generate(people_array))
  end

  def save_rentals_to_json(rentals, books, people)
    rentals_array = []
    rentals.each do |rental|
      rental_obj = {
        date: rental.date,
        people_index: people.index(rental.person),
        book_index: books.index(rental.book)
      }

      rentals_array << rental_obj
    end
    return if rentals_array.empty?

    File.write(File.join(DATA_FOLDER, 'rentals.json'), JSON.pretty_generate(rentals_array))
  end
end
