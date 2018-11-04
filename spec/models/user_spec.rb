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
end
