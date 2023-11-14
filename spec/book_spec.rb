require_relative '../book'

describe Book do
  before :each do
    @book = Book.new('Title', 'Author')
  end

  it 'returns the correct title' do
    expect(@book.title).to eql 'Title'
  end

  it 'returns the correct author' do
    expect(@book.author).to eql 'Author'
  end
end
