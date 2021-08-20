FactoryBot.define do
  factory :user do
    nickname              { 'tarou' }
    email                 { Faker::Internet.free_email }
    password              { '12345a' }
    password_confirmation { '12345a' }
    family_name           { '山田' }
    read_family           { 'ヤマダ' }
    first_name            { '太郎' }
    read_first            { 'タロウ' }
    birth                 { '2000-01-01' }
  end
end

