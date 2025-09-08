require 'rails_helper'

RSpec.describe "CreatingBookJustTitles", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'successfully creates book with all valid attributes' do
    visit '/books/new'
    fill_in 'Title', with: 'The Great Gatsby'
    fill_in 'Author', with: 'F. Scott Fitzgerald'
    fill_in 'Price', with: '15.99'
    select '1925', from: 'book_published_date_1i'
    select 'April', from: 'book_published_date_2i'
    select '10', from: 'book_published_date_3i'
    click_on 'Create Book'
    
    expect(page).to have_content('Book was successfully created.')
    expect(page).to have_content('The Great Gatsby')
    
    book = Book.order("id").last
    expect(book.title).to eq('The Great Gatsby')
  end

  it 'displays error when title is blank' do
    visit '/books/new'
    fill_in 'Title', with: ''
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: '19.99'
    click_on 'Create Book'
    
    expect(page).to have_content("Title can't be blank")
    expect(current_path).to eq('/books')
  end

  it 'displays error when author is blank' do
    visit '/books/new'
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: ''
    fill_in 'Price', with: '19.99'
    click_on 'Create Book'
    
    expect(page).to have_content("Author can't be blank")
    expect(current_path).to eq('/books')
  end

  it 'displays error when price is blank' do
    visit '/books/new'
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: ''
    click_on 'Create Book'
    
    expect(page).to have_content("Price can't be blank")
    expect(current_path).to eq('/books')
  end
end
