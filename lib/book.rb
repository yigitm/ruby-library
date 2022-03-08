require 'json'

class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(id = nil, title, author)
    @id = id || rand(8..100)
    @title = title
    @author = author
    @rentals = []
  end

  @@path = "data/book.json"

  def add_rental(rental)
    @rentals = rental
    rental.book = self
  end

  def self.read_file
    data_arr = []
    if Book.check_file
      JSON.parse(File.read(@@path)).each do |element|
        data_arr << Book.new(element['id'], element['title'], element['author'])
      end
    end
    data_arr
  end

  def self.check_file
    File.exist?(@@path) ? true : false
  end

  def self.write_file(data = [])
    data_arr = []
    data.each do |d|
      data_arr << {id: d.id, title: d.title, author: d.author}
    end
    File.write(@@path, JSON.generate(data_arr))
  end
end
