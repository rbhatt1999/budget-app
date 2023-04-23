require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
    @category = Category.create(name: 'Grocieries', author: @user)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@category).to be_valid
    end
    it 'is not valid without a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end
    it 'is not valid with a name shorter than 3 characters' do
      @category.name = 'as'
      expect(@category).to_not be_valid
    end
    it 'is not valid with a name longer than 50 characters' do
      @category.name = 'a' * 51
      expect(@category).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      expect(@category.author).to eq(@user)
    end
    it 'has name' do
      expect(@category.name).to eq('Grocieries')
    end
  end
end