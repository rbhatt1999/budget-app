class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    return unless user_signed_in?

    redirect_to categories_path
  end
end
