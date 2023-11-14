require_relative '../teacher'

describe Teacher do
    before :each do
        @teacher = Teacher.new "Math", 34, "John"
    end
    
    it " has instance of a class" do
        expect(@teacher).to be_instance_of Teacher
    end

    it "can use services" do
        services = @teacher.can_use_services?

        expect(services).to be_truthy
    end
end