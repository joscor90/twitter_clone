# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Dummy account

User.create(name: 'Dummy', email: 'dummy@mail.com', password: '123456', image_url: 'https://upload.wikimedia.org/wikipedia/commons/f/f5/Gliederpuppe.png')