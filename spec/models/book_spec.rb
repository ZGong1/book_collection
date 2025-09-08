require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it 'is valid with a title' do
      book = Book.new(title: 'Test Book')
      expect(book).to be_valid
    end

    it 'is invalid without a title' do
      book = Book.new(title: nil)
      expect(book).to_not be_valid
    end

    it 'is invalid with a blank title' do
      book = Book.new(title: '')
      expect(book).to_not be_valid
    end

    it 'is valid with all attributes' do
      book = Book.new(
        title: 'Test Book',
        author: 'Test Author',
        price: 19.99,
        published_date: Date.new(2023, 1, 1)
      )
      expect(book).to be_valid
    end

    it 'is invalid without an author' do
      book = Book.new(title: 'Test Book', author: nil)
      expect(book).to_not be_valid
    end

    it 'is invalid with a blank author' do
      book = Book.new(title: 'Test Book', author: '')
      expect(book).to_not be_valid
    end

    it 'is invalid without a price' do
      book = Book.new(title: 'Test Book', price: nil)
      expect(book).to_not be_valid
    end

    it 'is invalid with a negative price' do
      book = Book.new(title: 'Test Book', price: -5.0)
      expect(book).to_not be_valid
    end

    it 'is invalid without a published_date' do
      book = Book.new(title: 'Test Book', published_date: nil)
      expect(book).to_not be_valid
    end
  end

  describe 'attributes' do
    it 'has a title attribute' do
      book = Book.new
      expect(book).to respond_to(:title)
    end

    it 'can set and get title' do
      book = Book.new(title: 'My Great Book')
      expect(book.title).to eq('My Great Book')
    end

    it 'has an author attribute' do
      book = Book.new
      expect(book).to respond_to(:author)
    end

    it 'can set and get author' do
      book = Book.new(author: 'John Doe')
      expect(book.author).to eq('John Doe')
    end

    it 'has a price attribute' do
      book = Book.new
      expect(book).to respond_to(:price)
    end

    it 'can set and get price' do
      book = Book.new(price: 25.99)
      expect(book.price).to eq(25.99)
    end

    it 'has a published_date attribute' do
      book = Book.new
      expect(book).to respond_to(:published_date)
    end

    it 'can set and get published_date' do
      test_date = Date.new(2023, 6, 15)
      book = Book.new(published_date: test_date)
      expect(book.published_date).to eq(test_date)
    end
  end
end