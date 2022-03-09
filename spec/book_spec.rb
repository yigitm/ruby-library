require_relative '../lib/book'
require_relative '../lib/student'
require_relative '../lib/rental'

describe 'Book Class' do
  before :each do
    @book = Book.new('Title', 'Author')
    @student = Student.new(34, name: 'Test User', parent_permission: false)
  end

  it 'should validate book title' do
    expect(@book.title).to eq 'Title'
  end

  it 'should validate book author' do
    expect(@book.author).to eq 'Author'
  end

  it 'should validate add_rental method for student' do
    date = '2022-03-23'
    @book.add_rental(date, @student)
    expect(@book.rentals.length).to eq 1
  end
end
