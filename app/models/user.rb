class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
  validates :first_name
  validates :family_name
end
with_options presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' } do
  validates :read_first
  validates :read_family
end
PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
validates_format_of :password, presence: true, length: { minimum: 6 }, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
validates :nickname, presence: true
validates :birth, presence: true

with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
  validates :place_id
end

has_many :items
has_many :user_items
belongs_to :place
has_many :messages, dependent: :destroy
end
