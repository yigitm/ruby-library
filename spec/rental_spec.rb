require_relative '../lib/book'
require_relative '../lib/student'
require_relative '../lib/rental'

describe 'Rental Class' do
  before :each do
    date = '2022-03-23'
    @book = Book.new('Title', 'Author')
    @student = Student.new(34, name: 'Test User', parent_permission: false)
    @rental = Rental.new(date, @book, @student)
  end

  it 'should validate rental date' do
    expect(@rental.date).to eq '2022-03-23'
  end

  it 'should validate person name exists' do
    expect(@rental.person.name).to eq 'Test User'
  end

  it 'should validate book title exists' do
    expect(@rental.book.title).to eq 'Title'
  end
end
