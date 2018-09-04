User.create!(user_name:  "yusuke",
             email: "yusuke",
             password:              "yusuke",
             password_confirmation: "yusuke")

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(user_name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
