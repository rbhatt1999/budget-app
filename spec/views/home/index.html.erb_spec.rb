require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  before(:example) do
    visit '/'
  end
  it 'render home page' do
    expect(page).to have_content 'Budget App'
  end
  it 'click on sign up' do
    click_on 'Sign up'
    expect(current_path).to eql new_user_registration_path
  end
  it 'click on sign in' do
    click_on 'Log in'
    expect(current_path).to eql new_user_session_path
  end
end
