require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'is valid with valid attributes' do
      @category = Category.create(name: 'Furniture')
      @product = Product.new(
        name: 'Test chair',
        price: 255,
        quantity: 10,
        category: @category
      )

      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @category = Category.create(name: 'Furniture')
      @product = Product.new(
        name: nil,
        price: 255,
        quantity: 10,
        category: @category
      )

      expect(@product).to_not be_valid
    end

    it 'is not valid without price' do
      @category = Category.create(name: 'Furniture')
      @product = Product.new(
        name: 'Test chair',
        price: nil,
        quantity: 10,
        category: @category
      )

      expect(@product).to_not be_valid
    end

    it 'is not valid without quantity' do
      @category = Category.create(name: 'Furniture')
      @product = Product.new(
        name: 'Test chair',
        price: 255,
        quantity: nil,
        category: @category
      )

      expect(@product).to_not be_valid
    end

    it 'is not valid without a category' do
      @category = Category.create(name: 'Furniture')
      @product = Product.new(
        name: 'Test chair',
        price: 255,
        quantity: 10,
        category: nil
      )

      expect(@product).to_not be_valid
    end
  end
end
