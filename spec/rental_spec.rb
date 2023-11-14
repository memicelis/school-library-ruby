require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
    before :each do
        @book = instance_double('Book')
        @person = instance_double('Person')

        allow(@book).to receive(:add_rental)
        allow(@person).to receive(:add_rental)
        
        @rental = Rental.new "2020-11-14", @book, @person
    end

    it "has instance of a class" do
        expect(@rental).to be_instance_of Rental
    end

end