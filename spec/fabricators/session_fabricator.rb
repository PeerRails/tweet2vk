Fabricator(:session) do
  user
  ip { Faker::Internet.ip_v4_address }
  expires_at { Faker::Date.forward(2) }
end