# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

last_user = User.last.nil? ? 0 : User.last.id

User.create!([
    {
        id:  last_user + 1,
        email: "foo@bar.com",
        password: '123456'
    },
    {
        id:  last_user + 2,
        email: "admin@bar.com",
        password: '654321'
    }
    
])

User.where("email LIKE ?", "%admin%").last.add_role(:admin)
