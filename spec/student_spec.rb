require_relative '../student'

describe Student do
  before :each do
    @student = Student.new 23, 'Samir', false, 'Math'
  end

  it 'has instance of an class' do
    expect(@student).to be_instance_of Student
  end

  it 'can add classroom' do
    classroom = @student.classroom

    expect(classroom).to eq 'Math'
  end

  it 'can play hooky service' do
    service = @student.play_hooky
    expect(service).to eql '¯\\(ツ)/¯'
  end
end
