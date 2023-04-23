require 'rails_helper'

RSpec.describe 'purchases/new', type: :view do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
    @category = Category.create(name: 'Groceries', author: @user)
    @purchase = Purchase.create(name: 'Milk', amount: 10, author: @user)
    @purchase.categories << @category
    sign_in @user
    visit new_purchase_path
  end
  it 'render new purchase page' do
    expect(page).to have_content 'ADD TRANSACTION'
  end
  it 'click on back' do
    visit category_path(@category)
    find("a[class='new-catagory-container']").click
    find("a[class='back']").click
    sleep 1
    expect(current_path).to eql category_path(@category)
  end
  it 'fill form and click on submit' do
    fill_in 'purchase[name]', with: 'Milk'
    fill_in 'purchase[amount]', with: 10
    find('#purchase_category_id').find(:xpath, 'option[1]').select_option
    find("input[type='submit']").click
    sleep 1
    expect(current_path).to eql category_path(@category)
  end
end
