require 'rails_helper'

RSpec.describe "CreatingBookJustTitles", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and displays the resulting book with success flash notice' do
    visit '/books/new'
    fill_in 'Title', with: 'My Great Book'
    click_on 'Create Book'
    
    expect(page).to have_content('Book was successfully created.')
    expect(page).to have_content('My Great Book')
    
    book = Book.order("id").last
    expect(book.title).to eq('My Great Book')
  end

  it 'saves and displays book with all attributes' do
    visit '/books/new'
    fill_in 'Title', with: 'The Great Gatsby'
    fill_in 'Author', with: 'F. Scott Fitzgerald'
    fill_in 'Price', with: '15.99'
    fill_in 'Published date', with: '1925-04-10'
    click_on 'Create Book'
    
    expect(page).to have_content('Book was successfully created.')
    expect(page).to have_content('The Great Gatsby')
    expect(page).to have_content('F. Scott Fitzgerald')
    expect(page).to have_content('15.99')
    expect(page).to have_content('1925-04-10')
    
    book = Book.order("id").last
    expect(book.title).to eq('The Great Gatsby')
    expect(book.author).to eq('F. Scott Fitzgerald')
    expect(book.price).to eq(15.99)
    expect(book.published_date).to eq(Date.new(1925, 4, 10))
  end

  it 'displays error when trying to create book with blank title' do
    visit '/books/new'
    fill_in 'Title', with: ''
    click_on 'Create Book'
    
    expect(page).to have_content("Title can't be blank")
    expect(current_path).to eq('/books')
  end

  it 'displays error when trying to create book with blank author' do
    visit '/books/new'
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: ''
    click_on 'Create Book'
    
    expect(page).to have_content("Author can't be blank")
    expect(current_path).to eq('/books')
  end

  it 'displays error when trying to create book with blank price' do
    visit '/books/new'
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: ''
    click_on 'Create Book'
    
    expect(page).to have_content("Price can't be blank")
    expect(current_path).to eq('/books')
  end

  it 'displays error when trying to create book with negative price' do
    visit '/books/new'
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: '-5.99'
    click_on 'Create Book'
    
    expect(page).to have_content("Price must be greater than 0")
    expect(current_path).to eq('/books')
  end

  it 'displays error when trying to create book with blank published date' do
    visit '/books/new'
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: '19.99'
    fill_in 'Published date', with: ''
    click_on 'Create Book'
    
    expect(page).to have_content("Published date can't be blank")
    expect(current_path).to eq('/books')
  end
end
