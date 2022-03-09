require_relative '../lib/classroom'
require_relative '../lib/student'

describe 'classroom Class' do
  before :each do
    @classroom = Classroom.new('Class A')
    @student = Student.new(9, name: 'student', parent_permission: false)
  end
  
  it 'should validate classroom label' do
    expect(@classroom.label).to eq 'Class A'
  end

  it 'should validate add_student method' do
    @classroom.add_student(@student)
    expect(@classroom.students.length).to eq 1
  end
end