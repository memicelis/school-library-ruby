require_relative '../person'

describe Person do

    before :each do
        @person = Person.new 30,"Elis"
    end

    it "has an instance of the class" do
        expect(@person).to be_instance_of Person
    end

    it "has age and name" do
        age = @person.age
        name = @person.name

        expect(age).to eq 30
        expect(name).to eq "Elis"
    end

    it "can use services" do
        services = @person.can_use_services?
        expect(services).to be_truthy
    end

    it "is younger than 18" do
        person = Person.new 12,"Enis"
        expect(person.send(:of_age?)).to be_falsy
    end

    it "cannot use services if it is younger than 18 and does not have parent permission" do
        young = Person.new 14,"Amir", parent_permission: false
        services = young.can_use_services?
        expect(services).to be_falsy
    end

    it "returns the correct name" do
        expect(@person.correct_name).to eq (@person.name)
    end

    it "can add rentals" do
        rental = instance_double('Rental')
        @person.add_rental(rental)

        expect(@person.rentals.length).to eq 1
    end
end