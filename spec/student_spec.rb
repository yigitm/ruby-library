require_relative '../lib/student'
require_relative '../lib/classroom'

describe 'Student Class' do
  before :each do
    @student = Student.new(9, name: 'student', parent_permission: false)
    @classroom = Classroom.new('Class A')
  end

  it 'should validate student age' do
    expect(@student.age).to eq 9
  end

  it 'should validate student name' do
    expect(@student.name).to eq 'student'
  end

  it 'should validate student parent permission' do
    expect(@student.parent_permission).to eq false
  end

  it 'should validate play_hooky method' do
    expect(@student.play_hooky).to eq "¯\(ツ)/¯"
  end

  it 'should validate add classroom method for student' do
    @student.add_classroom(@classroom)
    expect(@student.classroom.label).to eq 'Class A'
  end
end
