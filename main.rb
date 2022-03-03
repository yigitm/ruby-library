require_relative './person'
require_relative './nameable'
require_relative './decorator'
require_relative './capitalize'
require_relative './trimmer'
require_relative './student'
require_relative './classroom'
require_relative './book'
require_relative './rental'
require 'date'

# Test: object & actions for decorate/capitalize/trimmer class
person = Person.new(22, 'maximilianus')
p(person.correct_name)
capitalized_person = CapitalizeDecorator.new(person)
p(capitalized_person.correct_name)
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p(capitalized_trimmed_person.correct_name)

# Test: object & actions for student/classroom has_many/belongs_to relations
mike = Student.new(23, 'Mike', 'Third Grade')
mia = Student.new(22, 'Mia', 'First Grade')
first_grade = Classroom.new('First Grade')
second_grade = Classroom.new('Second Grade')
p(second_grade.add_student(mia))
p(second_grade.students)
p(first_grade.students)
p(mike.add_classroom(first_grade))

# Test: object & actions for person/rental/book/ has_many/has_many_through relations
mia = Person.new(23, 'Mia')
book = Book.new('Book-1', 'Author-1')
rental = Rental.new(Date.today, book, mia)
p(book.add_rental(rental))
mike = Person.new(23, 'Mike')
book_two = Book.new('Book-2', 'Author-2')
Rental.new(Date.today, book_two, mike)
p(mike.rentals)
