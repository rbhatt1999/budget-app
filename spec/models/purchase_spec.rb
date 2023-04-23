require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
    @category = Category.create(name: 'Grocieries', author: @user)
    @purchase = Purchase.create(name: 'apple', amount: 45, author: @user)
    @purchase.categories << @category
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@purchase).to be_valid
    end
    it 'is not valid without a name' do
      @purchase.name = nil
      expect(@purchase).to_not be_valid
    end
    it 'is not valid without an amount' do
      @purchase.amount = nil
      expect(@purchase).to_not be_valid
    end
    it 'is not valid with a name shorter than 3 characters' do
      @purchase.name = 'as'
      expect(@purchase).to_not be_valid
    end
    it 'is not valid with a name longer than 50 characters' do
      @purchase.name = 'a' * 51
      expect(@purchase).to_not be_valid
    end
    it 'is not valid with an amount less than 1' do
      @purchase.amount = 0
      expect(@purchase).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      expect(@purchase.author).to eq(@user)
    end
    it 'has name' do
      expect(@purchase.name).to eq('apple')
    end
    it 'has amount' do
      expect(@purchase.amount).to eq(45)
    end
    it 'has categories' do
      expect(@purchase.categories).to eq([@category])
    end
  end
end