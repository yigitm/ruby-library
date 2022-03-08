class Rental
  attr_accessor :date, :book, :person

  @@path = "data/rental.json"

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def self.write_file(data = [])
    data_arr = []
    data.each do |d|
      data_arr << {date: d.date, person_id: d.person.id, book_id: d.book.id}
    end
    File.write(@@path, JSON.generate(data_arr))
  end
end
