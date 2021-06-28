require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "all should be valid" do
      @product = Product.new
      @categories = Category.new
      @categories.name = 'Test'
      @product.name = 'Test' 
      @product.price_cents = 100
      @product.quantity = 5
      @product.category = @categories
      expect(@product.valid?).to be true
    end
    
    it "name should be valid" do 
      @product = Product.new
      @product.name = 'Test'
      @product.valid?
      expect(@product.errors[:name]).not_to include("can't be blank")
      
      @product.name = nil
      @product.valid?
      expect(@product.errors[:name]).to include("can't be blank")
    end

    it "price should be valid" do 
      @product = Product.new
      @product.price_cents = 123
      @product.valid?
      expect(@product.errors[:price_cents]).not_to include("can't be blank")
  
      @product.price_cents = nil
      @product.valid?
      expect(@product.errors[:price_cents]).to include("is not a number")
    end

    it "quantity should be valid" do 
      @product = Product.new
      @product.quantity = 3
      @product.valid?
      expect(@product.errors[:quantity]).not_to include("can't be blank")
  
      @product.quantity = nil
      @product.valid?
      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it "quantity should be valid" do 
      @product = Product.new
      @categories = Category.new
      @product.category = @categories
      @product.valid?
      expect(@product.errors[:category]).not_to include("can't be blank")
  
      @product.category = nil
      @product.valid?
      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end
