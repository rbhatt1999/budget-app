require 'rails_helper'

RSpec.describe 'categories/new', type: :view do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
    @category = Category.create(name: 'Groceries', author: @user)
    @purchase = Purchase.create(name: 'Milk', amount: 10, author: @user)
    @purchase.categories << @category
    sign_in @user
    visit new_category_path
  end
  it 'render new category page' do
    expect(page).to have_content 'ADD CATEGORIES'
  end
  it 'click on back' do
    find("a[href='/categories']").click
    sleep 1
    expect(current_path).to eql categories_path
  end

  it 'fill form and click on submit' do
    fill_in 'category[name]', with: 'Groceries'
    find("input[type='submit']").click
    sleep 1
    expect(current_path).to eql categories_path
  end
end