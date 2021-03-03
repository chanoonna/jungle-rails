class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_AUTHENTICATION_USERNAME'], password: ENV['HTTP_AUTHENTICATION_PASSWORD']

  def show
    @num_of_products = Product.count
    @num_of_categories = Category.count
  end
end
