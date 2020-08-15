# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
file_path = Rails.root.join('app', 'assets', 'images', 'logo.png')
new_product = Product.find_or_create_by!(name: 'Pasta Carbonara', description: 'Second Course', price: 9)
new_product.image.attach(io: File.open(file_path), filename: 'logo.png')
new_product = Product.find_or_create_by!(name: 'Chicken Soup', description: 'Entrees', price: 13)
new_product.image.attach(io: File.open(file_path), filename: 'logo.png')
new_product = Product.find_or_create_by!(name: 'Vitamin Salad', description: 'Salad', price: 7)
new_product.image.attach(io: File.open(file_path), filename: 'logo.png')
new_product = Product.find_or_create_by!(name: 'Pizza', description: 'Main Course', price: 13)
new_product.image.attach(io: File.open(file_path), filename: 'logo.png')
new_product = Product.find_or_create_by!(name: 'Pancakes', description: 'Dessert', price: 7)
new_product.image.attach(io: File.open(file_path), filename: 'logo.png')
User.create!(name:"Paula Pol", email: "polpaula6+2@gmail.com", password: "administrator", password_confirmation:'administrator', admin: true, activated: true,
            activated_at: Time.zone.now)
User.create!(name:"Ana Pop", email: "anapop+2@gmail.com", password:'mamaliga',  password_confirmation:'mamaliga', admin: false, activated: true,
            activated_at: Time.zone.now)