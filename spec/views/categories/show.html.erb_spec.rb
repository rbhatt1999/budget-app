require 'rails_helper'

RSpec.describe 'categories/show', type: :view do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
    @category = Category.create(name: 'Groceries', author: @user)
    @purchase = Purchase.create(name: 'Milk', amount: 10, author: @user)
    @purchase.categories << @category
    sign_in @user
    visit category_path(@category)
  end
  it 'renders a list of purchases' do
    expect(page).to have_content 'Milk'
  end
  it 'click on back' do
    find("a[href='/categories']").click
    sleep 1
    expect(current_path).to eql categories_path
  end
  it 'click on New Transaction' do
    find("a[href='/purchases/new?cat_id=#{@category.id}']").click
    sleep 1
    expect(current_path).to eql new_purchase_path
  end
  it 'click on logout' do
    find("button[class='login-button']").click
    expect(current_path).to eql root_path
  end
end