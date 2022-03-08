require 'json'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
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
    JSON.parse(File.read(@path)).each do |element|
      p(element)
    end
  end

  def self.check_file
    File.exist?(@path) ? true : false
  end

  def self.write_file(data = [])
    data_arr = []
    data.each do |d|
      data_arr << {title: d.title, author: d.author}
    end
    p(data_arr)
    File.write(@@path, JSON.generate(data_arr))
  end
end
