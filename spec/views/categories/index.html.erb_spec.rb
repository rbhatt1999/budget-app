require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
    @category = Category.create(name: 'Groceries', author: @user)
    @purchase = Purchase.create(name: 'Milk', amount: 10, author: @user)
    @purchase.categories << @category
    sign_in @user
    visit categories_path
  end
  it 'renders a list of categories' do
    expect(page).to have_content 'Groceries'
  end
  it 'click on new category' do
    find("a[href='/categories/new']").click
    sleep 1
    expect(current_path).to eql new_category_path
  end
  it 'click on category' do
    find("a[href = '/categories/#{@category.id}']").click
    sleep 1
    expect(current_path).to eql category_path(@category)
  end
  it 'click on logout' do
    find("button[class='login-button']").click
    sleep 1
    expect(current_path).to eql root_path
  end
end