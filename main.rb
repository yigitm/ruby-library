require_relative './person'
require_relative './nameable'
require_relative './decorator'
require_relative './capitalize'
require_relative './trimmer'
require_relative './student'
require_relative './classroom'
require_relative './book'
require_relative './rental'

#Test: object & actions for decorate/capitalize/trimmer class  
person = Person.new(22, 'maximilianus')
p(person.correct_name)
capitalized_person = CapitalizeDecorator.new(person)
p(capitalized_person.correct_name)
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p(capitalized_trimmed_person.correct_name)

#Test: object & actions for student/classroom has_many/belongs_to relations  
(student = Student.new(23, "Mike", "First Grade"))
p(classroom_obj = Classroom.new("First Grade"))
p(classroom_obj.add_student(student))
p(classroom_obj.students)
p(student.classroom)

#Test: object & actions for person/rental/book/ has_many/has_many_through relations
p(book = Book.new("Sapiens", "Harrari"))
p(person = Person.new(23, "Mike"))
p(rental = Rental.new( '2022-03-03', book, person))
p(person.rentals)
p(book.rentals)
