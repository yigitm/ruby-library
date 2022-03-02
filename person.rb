require_relative './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'unknown', *)
    super()
    @id = rand(0..1_000_000)
    @age = age
    @name = name
    @parent_permission ||= true
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
end
