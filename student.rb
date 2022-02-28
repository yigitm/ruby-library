require_relative './person'

class Student < Person
  def initialize(age, *, classroom)
    super
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end