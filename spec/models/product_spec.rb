require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'creating products' do
    it "creates new Product records with correct fields" do

      #somehow require seed file?
      # require_relative '../../db/seeds'

      user = User.create(
        id: 1, 
        email: 'foo@bar.com', 
        password: '123456', 
        username: 'foo', 
        first_name: 'foo', 
        last_name: 'bar', 
        address: '123 foo street', 
        city: 'barville', 
        postcode: 1234, 
        state: 'LAW'
      )
      
      product = Product.new(
        product_title: 'foo',
        description: 'barbarbarbar',
        price: 50,
        medium: 'oil',
        quantity: 1,
        creator: 'artist',
        user: User.find(1)
      )    
      product.image.attach(io: File.open("test/fixtures/Artworks/Anh_Do_oil.jpeg"), filename: "Anh_Do_oil.jpeg")
      product.save!

      expect(Product.first.product_title).to eq('foo')
      expect(Product.first.description).to eq('barbarbarbar')
      expect(Product.first.price).to eq( 50 )
      expect(Product.first.medium).to eq('oil')
      expect(Product.first.quantity).to eq( 1 )
      expect(Product.first.creator).to eq('artist')
      expect(Product.first.image.blob.filename).to eq('Anh_Do_oil.jpeg')
    end
  end

  context 'associting products with users' do
    it 'identifies all products with a user' do
      user = User.create(
        id: 1, 
        email: 'foo@bar.com', 
        password: '123456', 
        username: 'foo', 
        first_name: 'foo', 
        last_name: 'bar', 
        address: '123 foo street', 
        city: 'barville', 
        postcode: 1234, 
        state: 'LAW'
      )
      
      product = Product.new(
        product_title: 'foo',
        description: 'barbarbarbar',
        price: 50,
        medium: 'oil',
        quantity: 1,
        creator: 'artist',
        user: User.find(1)
      )    
      product.image.attach(io: File.open("test/fixtures/Artworks/Anh_Do_oil.jpeg"), filename: "Anh_Do_oil.jpeg")
      product.save!

      expect(Product.first.user).to eq(User.first)
    end
  end

  context 'updating products' do
    it 'updates Product records with correct values' do
      user = User.create(
        id: 1, 
        email: 'foo@bar.com', 
        password: '123456', 
        username: 'foo', 
        first_name: 'foo', 
        last_name: 'bar', 
        address: '123 foo street', 
        city: 'barville', 
        postcode: 1234, 
        state: 'LAW'
      )
      
      product = Product.new(
        product_title: 'foo',
        description: 'barbarbarbar',
        price: 50,
        medium: 'oil',
        quantity: 1,
        creator: 'artist',
        user: User.find(1)
      )    
      product.image.attach(io: File.open("test/fixtures/Artworks/Anh_Do_oil.jpeg"), filename: "Anh_Do_oil.jpeg")
      product.save!

      Product.first.update(price: 500)

      expect(Product.first.price).to eq(500)
    end
  end

  context 'deleting products' do
    it 'removes Product records' do
      user = User.create(
        id: 1, 
        email: 'foo@bar.com', 
        password: '123456', 
        username: 'foo', 
        first_name: 'foo', 
        last_name: 'bar', 
        address: '123 foo street', 
        city: 'barville', 
        postcode: 1234, 
        state: 'LAW'
      )
      
      product = Product.new(
        product_title: 'foo',
        description: 'barbarbarbar',
        price: 50,
        medium: 'oil',
        quantity: 1,
        creator: 'artist',
        user: User.find(1)
      )    
      product.image.attach(io: File.open("test/fixtures/Artworks/Anh_Do_oil.jpeg"), filename: "Anh_Do_oil.jpeg")
      product.save!

      Product.first.destroy

      expect(Product.first).to be(nil)
    end
  end
end
