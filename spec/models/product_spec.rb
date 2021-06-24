require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  
    before(:all) do
      @category = Category.create(name: 'Stuff')
    end

    it "creates a new product" do
      @product = @category.products.create(name: 'Thing', price: 9.99, quantity: 100)
      expect(@product).to be_valid
    end

    it "should not create a new product with name value nil" do
      @product = @category.products.create(name: nil, price: 9.99, quantity: 100)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    
    it "should not create a new product with category_id value nil" do
      @product = Product.create(name: 'Thing', category_id: nil, price: 9.99, quantity: 100)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    
    it "should not create a new product with price value nil" do
      @product = @category.products.create(name: 'Thing', price: nil, quantity: 100)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "should not create a new product with quantity value nil" do
      @product = @category.products.create(name: 'Thing', price: 9.99, quantity: nil)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
  
  end
end