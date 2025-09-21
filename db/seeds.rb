# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create 5 users
users = User.create([
  { username: "alice_reader" },
  { username: "bob_bookworm" },
  { username: "charlie_collector" },
  { username: "diana_devotee" },
  { username: "evan_enthusiast" }
])

# Create 5 books
books = Book.create([
  {
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    price: 12.99,
    published_date: Date.new(1925, 4, 10)
  },
  {
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
    price: 14.50,
    published_date: Date.new(1960, 7, 11)
  },
  {
    title: "1984",
    author: "George Orwell",
    price: 13.25,
    published_date: Date.new(1949, 6, 8)
  },
  {
    title: "Pride and Prejudice",
    author: "Jane Austen",
    price: 11.75,
    published_date: Date.new(1813, 1, 28)
  },
  {
    title: "The Catcher in the Rye",
    author: "J.D. Salinger",
    price: 15.00,
    published_date: Date.new(1951, 7, 16)
  }
])

# Create 5 user-book associations
UserBook.create([
  { user: users[0], book: books[0] },
  { user: users[1], book: books[1] },
  { user: users[2], book: books[2] },
  { user: users[3], book: books[3] },
  { user: users[4], book: books[4] }
])
