# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
  {name: 'Computer Science'},
  {name: 'Data Sciences'},
  {name: 'Electronic Systems Design'},
  {name: 'Information Technology & Society'},
  {name: 'Mathematics & Basic Sciences'},
  {name: 'Networking, Communication & Signal Processing'},
  {name: 'Software Engineering'},
])

Page.create({title: "Home", slug: "home", content:""})

user = User.create({name: "Administrator", email:"admin@iiitb.org", password:"thanks123", password_confirmation:"thanks123", organisation:"IIIT-B"})
user.add_role :admin

Site.create(meta: :name, value: "Name Of Website")
Site.create(meta: :reply_email, value: "noreply@iiitb.org")

