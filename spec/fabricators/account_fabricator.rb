Fabricator(:account) do
  provider 'twitter'
  name { Faker::Name.name }
  nickname { Faker::Name.first_name }
  uid { Faker::Number.number(6) }
  url { Faker::Internet.url }
  profile_img_url { Faker::Internet.url }
  profile_img_small { Faker::Internet.url }
  token { Faker::Internet.password(8) }
  secret { Faker::Internet.password(8) }
end