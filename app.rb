require_relative './lib/person'
require_relative './lib/student'
require_relative './lib/teacher'
require_relative './lib/book'
require_relative './lib/rental'
require 'date'

class App
  def initialize
    @input = nil
    @people = Person.read_file
    @books = Book.read_file
    @rentals_for_person = []
    @rentals = []
    @options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental',
                'List all rentals for a given person id', 'Exit']
  end

  def run
    loop do
      options
      adjust_input
      validate(1, 7)
      action_dispatch
    end
  end

  def options
    puts "Ruby-School Library App\nPlease choose an option by entering a number:\n"
    @options.each_with_index { |option, ind| puts "#{ind + 1} #{option}" }
  end

  def adjust_input
    @input = gets.chomp
  end

  def validate(start, limit)
    return if (start.to_s..limit.to_s).to_a.include?(@input)

    loop do
      puts "Invalid entry. Please type a number between #{start}..#{limit}"
      @input = adjust_input
      break if (start.to_s..limit.to_s).to_a.include?(@input)
    end
  end

  def permission?
    return true if @input.downcase == 'y'

    false
  end

  def action_dispatch
    case @input
    when 1.to_s
      display_list_of_books(1)
    when 2.to_s
      display_list_of_person(2)
    when 3.to_s
      person
    when 4.to_s
      book
    when 5.to_s
      rental
      p(@rentals)
    when 6.to_s
      find_rental
    else
      Book.write_file(@books)
      Person.write_file(@people)
      Rental.write_file(@rentals)
      exit(false)
    end
  end

  def age
    puts 'Age:'
    adjust_input
    validate(0, 120)
    @input
  end

  def name
    puts 'Name:'
    adjust_input
  end

  def student
    age_input = age
    name_input = name
    puts 'Has parent permission? [Y/N]:'
    adjust_input

    @people << Student.new(nil, age_input, name: name_input, parent_permission: permission? )
    puts 'Student created successfully'
  end

  def teacher
    age_input = age
    name_input = name

    puts 'Specialization:'
    specialization = adjust_input

    @people << Teacher.new(nil, age_input, specialization, name: name_input)
    puts 'Teacher created successfully'
  end

  def person
    puts 'Do you want to create student (1) or teacher (2)? Type (1) or (2):'
    adjust_input
    validate(1, 2)
    @input == '1' ? student : teacher
  end

  def book
    puts 'Title:'
    title = adjust_input
    puts 'Author:'
    author = adjust_input

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def display_list_of_books(from = 1)
    @books.each_with_index do |book, index|
      print "#{index}) " if from == 5
      puts "Title: \"#{book.title}\", Author:#{book.author}"
    end
  end

  def display_list_of_person(from = 2)
    @people.each_with_index do |person, index|
      print "#{index}) " if from == 5
      puts "[#{person.class}] Name:#{person.name}, ID: #{person.id}, Age:#{person.age}"
    end
  end

  def find_person
    index = @input.to_i
    p(index)
    @people[index]
  end

  def rental
    puts 'Select a book from the following list by number'
    display_list_of_books(5)
    adjust_input
    validate(0, @books.length)
    book_for_rent = @books[@input.to_i]

    puts 'Select a person from the following list by number (not id)'
    display_list_of_person(5)
    adjust_input
    person_who_rent = find_person

    puts 'Type date like : YYYY-MM-DD'
    adjust_input
    @rentals << Rental.new(@input, book_for_rent, person_who_rent)

    puts 'Rental created successfully'
  end

  def find_rental
    @rentals_for_person = []
    print 'ID of Person: '
    adjust_input
    find_people_who_rent

    return puts "Rentals: No record found\n" if @rentals_for_person.length.zero?

    display_rentals
  end

  def find_people_who_rent
    @people.each { |person| @rentals_for_person = person.rentals if person.id == @input.to_i }
  end

  def display_rentals
    @rentals_for_person.each { |rent| puts "Rental: Date: #{rent.date}, Book: #{rent.book.title}, Author: #{rent.book.author}\n" }
  end
end
