require_relative '../lib/corrector'

describe 'Corrector Class' do
  before :each do
    @corrector = Corrector.new
  end

  it 'should validate validate_name method' do
    expect(@corrector.correct_name('test correct')).to eq 'Test corre'
  end
end
