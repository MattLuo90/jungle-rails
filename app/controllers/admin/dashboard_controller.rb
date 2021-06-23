class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  def show
    @product_count = Product.count
    @categories_count = Product.pluck(:category_id).uniq.count
  end
end
