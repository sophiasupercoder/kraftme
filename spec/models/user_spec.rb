require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates new User records with correct fields" do
    User.create!(
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

    expect(User.first.email).to eq('foo@bar.com')
    # Note that user password is abstracted through encryption and cannot be 'read'
    expect(User.first.username).to eq('foo')
    expect(User.first.first_name).to eq('foo')
    expect(User.first.last_name).to eq('bar')
    expect(User.first.address).to eq('123 foo street')
    expect(User.first.city).to eq('barville')
    expect(User.first.postcode).to eq(1234)
    expect(User.first.state).to eq('LAW')
  end

  context 'associating users with products' do
    it 'identifies a user with a all of their products' do
      User.create!(
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
      
      products = [
        {
          id: 1,
          product_title: 'foo',
          description: 'barbarbarbar',
          price: 50,
          medium: 'oil',
          quantity: 1,
          creator: 'artist',
          user: User.find(1)
        },
        {
          id: 2,
          product_title: 'bar',
          description: 'foofoofoofoo',
          price: 100,
          medium: 'acrylic',
          quantity: 1,
          creator: 'artist',
          user: User.find(1)
        },
      ]
      
      images = ['Anh_Do_oil.jpeg', 'Doctor_who.jpeg']

      products.each do |attributes|
          product = Product.new(attributes)
          product.image.attach(io: File.open("test/fixtures/Artworks/#{images[products.index(attributes)]}"), filename: "#{images[products.index(attributes)]}")
          product.save!
      end

      expect(User.first.products).to eq([Product.find(1), Product.find(2)])
    end
  end

  context 'associating users with roles' do
    it 'identifies a user with a all of their roles' do
      User.create!(
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
      
      User.first.add_role(:admin)

      expect(User.first.roles).to eq([Role.find_by(name: 'standard_user'), Role.find_by(name: 'admin')])
    end
  end

  context 'updating products' do
    it 'updates User records with correct values' do
      User.create!(
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

      User.first.update!(username: 'bar')

      expect(User.first.username).to eq('bar')
    end
  end

  context 'deleting products' do
    it 'removes User records' do
      User.create!(
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

      User.first.destroy

      expect(User.first).to be(nil)
    end
  end

end
