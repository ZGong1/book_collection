require 'rails_helper'

RSpec.describe 'Database seeding', type: :model do
  describe 'seeded data' do
    it 'has seeded data present' do
      expect(User.count).to be >= 5
      expect(Book.count).to be >= 5
      expect(UserBook.count).to be >= 5
    end
  end
end