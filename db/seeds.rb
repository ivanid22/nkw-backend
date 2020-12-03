# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create(email: "mariam@domain.com", password: "testing1234")
user_2 = User.create(email: "luca@domain.com", password: "testing1234")
user_3 = User.create(email: "lauren@domain.com", password: "testing1234")

profile_1 = UserProfile.create(name: "Mariam", location: "United Kingdom", user: user_1)
profile_2 = UserProfile.create(name: "Luca", location: "Italy", user: user_2)
profile_3 = UserProfile.create(name: "Lauren", location: "United States", user: user_3)

profile_1.avatar.attach(io: File.open('app/assets/profile1.jpg'), filename: 'profile1.jpg')
profile_2.avatar.attach(io: File.open('app/assets/profile2.jpg'), filename: 'profile2.jpg')
profile_3.avatar.attach(io: File.open('app/assets/profile3.jpg'), filename: 'profile3.jpg')

posting_1 = Posting.create(user_profile: profile_1, title: 'Laptop', description: 'Used laptop in very good condition, 5 years of use.', contact_email: 'mariam@domain.com', price: 100)
posting_1.picture.attach(io: File.open('app/assets/laptop.jpg'), filename: 'laptop.jpg')

posting_2 = Posting.create(user_profile: profile_2, title: 'Black pitcher', description: 'Black ceramic pitcher', contact_email: 'luca@domain.com', price: 15)
posting_2.picture.attach(io: File.open('app/assets/black-pitcher.jpg'), filename: 'pitcher.jpg' )

posting_3 = Posting.create(user_profile: profile_3, title: 'Pinecone', description: 'Just a pinecone I found laying on the beach', contact_email: 'lauren@domain.com', price: 10)
posting_3.picture.attach(io: File.open('app/assets/pinecone.jpg'), filename: 'pinecone.jpg')