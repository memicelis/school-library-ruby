require_relative '../classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'Physics'
  end

  it 'has instance of class' do
    expect(@classroom).to be_instance_of Classroom
  end

  it 'can add student' do
    student = instance_double('Student', classroom: nil)
    allow(student).to receive(:classroom=)

    @classroom.add_students(student)

    expect(@classroom.students).to include(student)
    expect(student).to have_received(:classroom=).with(@classroom).once
  end
end
