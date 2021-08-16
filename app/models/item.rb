class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :place_id
    validates :make_day_id
  end

  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    validates :value, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :place
  belongs_to :make_day
end
