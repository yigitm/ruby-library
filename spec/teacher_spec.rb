require_relative '../lib/teacher'

describe 'teacher Class' do
  before :each do
    @teacher = Teacher.new(50, 'CS', name: 'test teacher', parent_permission: false)
  end

  it 'should validate teacher age' do
    expect(@teacher.age).to eq 50
  end

  it 'should validate teacher name' do
    expect(@teacher.name).to eq 'test teacher'
  end

  it 'should validate teacher parent permission' do
    expect(@teacher.parent_permission).to eq false
  end

  it 'should validate teacher specialization' do
    expect(@teacher.specialization).to eq 'CS'
  end

  it 'should validate can_use_services? method' do
    expect(@teacher.can_use_services?).to eq true
  end
end
