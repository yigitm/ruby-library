require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, age, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = nil
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
