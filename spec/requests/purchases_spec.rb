require 'rails_helper'

RSpec.describe PurchasesController, type: :request do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asd@gmail.com', password: 'password', confirmed_at: Time.now)
    @category = Category.create(name: 'Grocieries', author: @user)
    @purchase = Purchase.create(name: 'Purchase', amount: 45, author: @user)
    @purchase.categories << @category
  end

  describe 'GET /new' do
    before do
      sign_in @user
      get new_purchase_path
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      expect(response.body).to include 'ADD TRANSACTION'
    end
  end

  describe 'POST /create' do
    before do
      sign_in @user
      post purchases_path, params: { purchase: { name: 'Purchase', amount: 77, category_id: @category.id } }
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:found)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      get category_path(@category)
      expect(response.body).to include '77'
    end
  end
end