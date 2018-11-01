# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

last_user = User.last.nil? ? 0 : User.last.id

User.create!([
    {
        id:  last_user + 1,
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
        id:  last_user + 2,
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
    
])

User.where("email LIKE ?", "%admin%").last.add_role(:admin)

Product.create!([
    {
        product_title: 'Sunshine',
        description: 'This reminds me to smile on cloudy days...',
        price: 200,
        medium: 'oil on hardboard',
        quantity: 1,
        creator: 'Sonny'
    },
    {
        product_title: 'Head of the Clowns',
        description: 'This might be frightening to some...',
        price: 149.99,
        medium: 'watercolour',
        quantity: 2,
        creator: 'Clowny McFrowny'
    },
    {
        product_title: 'Head in the Clouds',
        description: 'Like my previous work, but not as funny',
        price: 149.99,
        medium: 'watercolour',
        quantity: 1,
        creator: 'Clowny McFrowny'
    },
    {
        product_title: 'Dog\'s playing poker',
        description: 'A classic...',
        price: 300.00,
        medium: 'large',
        quantity: 4000,
        creator: 'Doggo'
    },
    {
        product_title: 'Mona Lisa\'s Ghost',
        description: 'An really, really, really, good appropriation...',
        price: 400,
        medium: 'oil',
        quantity: '1',
        creator: 'Deonardo Va Linci'
    },
])
