require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, *, classroom)
    super
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  # def classroom(classroom)
  # @classroom = classroom
  # classroom.students.push(self) unless classroom.student.include?(self)
  # end
end
