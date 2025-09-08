require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'validates presence of title' do
    book = Book.new(author: 'Test Author', price: 19.99, published_date: Date.new(2023, 1, 1))
    expect(book).to_not be_valid
    expect(book.errors[:title]).to include("can't be blank")
  end

  it 'validates presence of author' do
    book = Book.new(title: 'Test Book', price: 19.99, published_date: Date.new(2023, 1, 1))
    expect(book).to_not be_valid
    expect(book.errors[:author]).to include("can't be blank")
  end

  it 'validates presence and positive value of price' do
    book = Book.new(title: 'Test Book', author: 'Test Author', published_date: Date.new(2023, 1, 1))
    expect(book).to_not be_valid
    expect(book.errors[:price]).to include("can't be blank")
  end

  it 'validates presence of published_date' do
    book = Book.new(title: 'Test Book', author: 'Test Author', price: 19.99)
    expect(book).to_not be_valid
    expect(book.errors[:published_date]).to include("can't be blank")
  end
end