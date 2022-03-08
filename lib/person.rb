require_relative './nameable'

class Person < Nameable
  attr_reader :id, :parent_permission
  attr_accessor :name, :age, :rentals

  @@path = "data/person.json"

  def initialize(age, name = 'unknown', *, parent_permission: false)
    super()
    @id = rand(8..100)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    is_of_age? && @parent_permission ? true : false
  end

  def correct_name
    @name
  end

  def self.write_file(data = [])
    data_arr = []
    data.each do |d|
      if d.instance_of?(Student)
        data_arr << {type: 'student', id: d.id, age: d.age, name: d.name, parent_permission: d.parent_permission}
      else
        data_arr << {type: 'teacher', id: d.id, age: d.age, name: d.name, specialization: d.specialization}
      end
    end
    File.write(@@path, JSON.generate(data_arr))
  end
end
