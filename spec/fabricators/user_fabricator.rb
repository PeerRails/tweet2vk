Fabricator(:user) do
  full_name { Faker::Name.name }
  last_ip { Faker::Internet.ip_v4_address }
  last_login { Faker::Date.between(2.days.ago, Date.today) }
  mail { Faker::Internet.email }
  profile_img { Faker::Internet.url }
end