class MakeDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '作りたて' },
    { id: 3, name: '作ってから半日' },
    { id: 4, name: '作ってから１日' },
    { id: 5, name: '作ってから２日以上'}
  ]

  include ActiveHash::Associations
  has_many :items
end
