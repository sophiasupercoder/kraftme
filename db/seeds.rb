# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
User.destroy_all

users = [
    {
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
        email: "admin@foo.com",
        password: '234567',
        username: 'nimda',
        first_name: 'nimda',
        last_name: 'nimda',
        address: '124 first street',
        city: 'town city',
        postcode: 1234,
        state: 'LAW'
    },
    {
        email: "bar@foo.com",
        password: '876543',
        username: 'bar',
        first_name: 'bar',
        last_name: 'bar',
        address: '123 first street',
        city: 'city town',
        postcode: 9876,
        state: 'ZA'
    },
    {
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

products = [
    {
        product_title: 'Sunshine',
        description: 'This reminds me to smile on cloudy days...',
        price: 200,
        medium: 'oil on hardboard',
        quantity: 1,
        creator: 'Sonny',
        user: User.find(1),
    },
    {
        product_title: 'Head of the Clowns',
        description: 'This might be frightening to some...',
        price: 149.99,
        medium: 'watercolour',
        quantity: 2,
        creator: 'Clowny McFrowny',
        user: User.find(3)
    },
    {
        product_title: 'Head in the Clouds',
        description: 'Like my previous work, but not as funny',
        price: 149.99,
        medium: 'watercolour',
        quantity: 1,
        creator: 'Clowny McFrowny',
        user: User.find(3)
    },
    {
        product_title: 'Dog\'s playing poker',
        description: 'A classic...',
        price: 300.00,
        medium: 'large',
        quantity: 4000,
        creator: 'Doggo',
        user: User.find(1)
    },
    {
        product_title: 'Mona Lisa\'s Ghost',
        description: 'An really, really, really, good appropriation...',
        price: 400,
        medium: 'oil',
        quantity: 1,
        creator: 'Deonardo Va Linci',
        user: User.find(1)
    },
]

images = ['Anh_Do_oil.jpeg', 'Doctor_who.jpeg', 'Dog_Oil.jpg', 'Face_WaterColour.jpeg', 'Fish_Oil.jpeg', 'julia.jpg', 'Lion_Watercolour.jpg', 'Mona_lisa.jpeg', 'park_Oil.jpeg', 'Shearing.jpeg', 'Shred_Acrylic.jpg', 'Starry_night.jpg', 'town_WaterColour.jpg']

products.each do |attributes|
    product = Product.new(attributes)
    product.image.attach(io: File.open("test/fixtures/Artworks/#{images[products.index(attributes)]}"), filename: "#{images[products.index(attributes)]}")
    product.save
end
