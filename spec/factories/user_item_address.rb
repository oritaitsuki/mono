FactoryBot.define do
  factory :user_item_address do
    post_number { '123-1234' }
    place_id { 2 }
    city          { '福岡' }
    address       { '1-2-3' }
    building_name { '山田マンション' }
    phone_number  { '09077770008' }
    token { 'tok_0000000000' }
  end
end
