require_relative './rental'
require 'json'

class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author, id: nil)
    @id = id || rand(8..100)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  def self.path
    'data/book.json'
  end

  def self.read_file
    data_arr = []
    if Book.check_file
      JSON.parse(File.read(Book.path)).each do |element|
        data_arr << Book.new(element['title'], element['author'], id: element['id'])
      end
    end
    data_arr
  end

  def self.check_file
    File.exist?(Book.path)
  end

  def self.write_file(data = [])
    data_arr = []
    data.each do |d|
      data_arr << { id: d.id, title: d.title, author: d.author }
    end
    File.write(Book.path, JSON.generate(data_arr))
  end
end
