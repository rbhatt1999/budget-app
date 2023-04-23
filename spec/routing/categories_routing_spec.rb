require 'rails_helper'

RSpec.describe CategoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: categories_path).to route_to('categories#index')
    end
    it 'routes to #show' do
      expect(get: '/categories/1').to route_to('categories#show', id: '1')
    end
    it 'routes to #new' do
      expect(get: '/categories/new').to route_to('categories#new')
    end
    it 'routes to #create' do
      expect(post: categories_path).to route_to('categories#create')
    end
  end
end
