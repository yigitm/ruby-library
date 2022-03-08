require_relative './nameable'

class Person < Nameable
  attr_reader :id, :parent_permission
  attr_accessor :name, :age, :rentals

  def initialize(age, name: 'unknown', parent_permission: false, id: nil)
    super()
    @id = id || rand(8..100)
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

  def self.path
    'data/person.json'
  end

  def self.write_file(data = [])
    data_arr = []
    data.each do |d|
      data_arr << if d.instance_of?(Student)
                    { type: 'student', id: d.id, age: d.age, name: d.name, parent_permission: d.parent_permission }
                  else
                    { type: 'teacher', id: d.id, age: d.age, name: d.name, specialization: d.specialization }
                  end
    end
    File.write(Person.path, JSON.generate(data_arr))
  end

  def self.read_file
    data_arr = []
    if Person.check_file
      JSON.parse(File.read(Person.path)).each do |element|
        if element['type'] == 'student'
          data_arr << Student.new(element['age'], name: element['name'],
                                                  parent_permission: element['parent_permission'], id: element['id'])
        else
          data_arr << Teacher.new(element['age'], element['specialization'], name: element['name'], id: element['id'])
        end
      end
    end
    data_arr
  end

  def self.check_file
    File.exist?(Person.path)
  end
end
