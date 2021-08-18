FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/1576722134-1.png'), filename: '1576722134-1.png')
    end

    item_name	           { 'アイテム' }
    explanation	         { 'アイテムです' }
    category_id          { 3 }
    place_id   	         { 3 }
    make_day_id          { 3 }
    value { 3000 }

    association :user
  end
end
