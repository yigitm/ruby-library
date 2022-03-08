class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def self.path
    'data/rental.json'
  end

  def self.write_file(data = [])
    data_arr = []
    data.each do |d|
      data_arr << { date: d.date, person_id: d.person.id, book_id: d.book.id }
    end
    File.write(Rental.path, JSON.generate(data_arr))
  end

  def self.read_file(people, books)
    data_arr = []
    if Rental.check_file
      JSON.parse(File.read(Rental.path)).each do |element|
        person = people.select { |p| p.id == element['person_id'] }[0]
        book = books.select { |b| b.id == element['book_id'] }[0]
        data_arr << Rental.new(element['date'], book, person)
      end
    end
    data_arr
  end

  def self.check_file
    File.exist?(Rental.path)
  end
end
