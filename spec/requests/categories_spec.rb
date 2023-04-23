require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asd@gmail.com', password: 'password', confirmed_at: Time.now)
    @category = Category.create(name: 'Grocieries', author: @user)
    @purchase = Purchase.create(name: 'Purchase', amount: 45, author: @user)
    @purchase.categories << @category
  end

  describe 'GET /index' do
    before do
      sign_in @user
      get categories_path
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      expect(response.body).to include 'Grocieries'
    end
  end

  describe 'GET /show' do
    before do
      sign_in @user
      get category_path(@category)
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      expect(response.body).to include '45'
    end
  end

  describe 'GET /new' do
    before do
      sign_in @user
      get new_category_path
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      expect(response.body).to include 'ADD CATEGORIES'
    end
  end
  describe 'POST /create' do
    before do
      sign_in @user
      post categories_path, params: { category: { name: 'Grocieries2' } }
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:found)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      get categories_path
      expect(response.body).to include 'Grocieries2'
    end
  end
end
