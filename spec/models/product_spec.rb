require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it "is valid with valid attributes" do
      @category = Category.new(name: "Test")
      @product = Product.new(name: "Product", description: "Description", category: @category, quantity: 5, image: "url", price: 50)
      expect(@product).to be_valid
    end
    it "is not valid without a name" do
      @category = Category.new(name: "Test")
      @product = Product.new(description: "Description", category: @category, quantity: 5, image: "url", price: 50)
      expect(@product).to_not be_valid
    end
    it "is not valid without a price" do
      @category = Category.new(name: "Test")
      @product = Product.new(name: "Product", description: "Description", category: @category, quantity: 5, image: "url")
      expect(@product).to_not be_valid
    end
    it "is not valid without a quantity" do
      @category = Category.new(name: "Test")
      @product = Product.new(name: "Product", description: "Description", category: @category, image: "url", price: 50)
      expect(@product).to_not be_valid
    end
    it "is not valid without a category" do
      @product = Product.new(name: "Product", description: "Description", quantity: 5, image: "url", price: 50)
      expect(@product).to_not be_valid
    end
    
  end

end
