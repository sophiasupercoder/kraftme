require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'assignment roles to users' do
    it "adds 'standard_user' default Role to a User" do
      User.create!(
          id: 2,
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

      expect(User.find(2).has_role?(:standard_user)).to be(true)
    end

    it "adds additional Role(s) to User using 'add_role' assignment method" do
      User.create!(
          id: 3,
          email: "admin@bar.com",
          password: '654321',
          username: 'admin',
          first_name: 'admin',
          last_name: 'admin',
          address: '987 last street',
          city: 'city town',
          postcode: 9876,
          state: 'ZA'
      )

      User.find(3).add_role(:admin)

      expect(User.find(3).has_role?(:standard_user)).to be(true)
      expect(User.find(3).has_role?(:admin)).to be(true)
    end
  end

  context 'associating roles with users' do
    it 'identifies all Users with a given role' do
      users = [
        {
          id: 4,
          email: "foo@bar.com",
          password: '123456',
          username: 'foo',
          first_name: 'foo',
          last_name: 'bar',
          address: '123 first street',
          city: 'town city',
          postcode: 1234,
          state: 'LAW'
        },
        {
          id: 5,
          email: "admin@bar.com",
          password: '654321',
          username: 'admin',
          first_name: 'admin',
          last_name: 'admin',
          address: '987 last street',
          city: 'city town',
          postcode: 9876,
          state: 'ZA'
        }
      ]

      User.create!(users)
      User.where("email LIKE ?", "%admin%").each { |user| user.add_role(:admin) }

      expect(Role.find_by(name: 'standard_user').users).to eq([User.find(4), User.find(5)])
      expect(Role.find_by(name: 'admin').users).to eq([User.find(5)])
    end    
  end

  context 'removing roles from users' do

  end
end
