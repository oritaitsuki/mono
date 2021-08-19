class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '和食' },
    { id: 3, name: '洋食' },
    { id: 4, name: '中華料理' },
    { id: 5, name: 'アジア・エスニック' },
    { id: 6, name: 'ヨーロッパ' },
    { id: 7, name: '肉料理' },
    { id: 8, name: '魚料理' },
    { id: 9, name: 'サラダ' },
    { id: 10, name: '鍋料理' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
