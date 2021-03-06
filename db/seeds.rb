
users_data = []
10.times do
  users_data << {
                 email: Faker::Internet.email,
                 password: 123456, 
                 name: Faker::Name.name, 
                 phone_number: '056416999'
                }
end

categories_data = [
                    {name: "Restaurant"},
                    {name: "Telecommunication"},
                    {name: "Automotive"},
                    {name: "Service"},
                    {name: "Cosmetic"},
                    {name: "Health"},
                    {name: "Fashion"}
                  ]

organisations_data = []
15.times do
  organisations_data << { 
                          user_id: rand(1..11),
                          name: Faker::Company.name,
                          email: Faker::Internet.email,
                          street: Faker::Address.street_name,
                          postcode: Faker::Address.zip_code,
                          city: Faker::Address.city,
                          state: Faker::Address.state,
                          phone_number: '0111111111',
                          description: Faker::Lorem.paragraph(2),
                          website: 'www.example.com',
                          facebook: 'www.facebook.com',
                          instagram: 'www.instagram.com',
                          twitter: 'www.twitter.com'
                        }
end

products_data = []
10.times do
  products_data <<  {
                      name: Faker::Commerce.product_name,
                      description: Faker::Lorem.paragraph(2),
                      price: Faker::Commerce.price
                    }
end


tags_data = []
5.times do 
  tags_data <<  {
                  name: Faker::Lorem.word
                }
end

tags = Tag.create(tags_data)

categories = Category.create(categories_data)

users_data << {email: 'syafiqfaiz@gmail.com', password: 123456, name: 'faiz', phone_number: '056416999'}
users = User.create(users_data)


organisations = Organisation.create(organisations_data)
organisations.each do |organisation|
  categories.sample.organisations << organisation
  tags.sample.products << organisation.products.create(products_data)
end


