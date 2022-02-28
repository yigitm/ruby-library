class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, *)
    @id = rand(0..1_000_000)
    @age = age
    @name ||= 'Unknown'
    @parent_permission ||= true
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    is_of_age? && @parent_permission ? true : false
  end
end
