class UserItemAddress
  include ActiveModel::Model
  attr_accessor :post_number, :city, :address, :phone_number, :building_name, :prefectures_id, :user_item_id, :item_id, :user_id,
                :token

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :prefectures_id
  end

  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :user_id
    validates :token
    validates :item_id
  end
  def save
    user_item = UserItem.create(item_id: item_id, user_id: user_id)
    Address.create(post_number: post_number, prefectures_id: prefectures_id, city: city, address: address,
                   building_name: building_name, phone_number: phone_number, user_item_id: user_item.id)
  end
end
