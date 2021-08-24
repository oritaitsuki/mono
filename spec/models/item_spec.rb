require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品登録' do
    context '新規商品登録ができる場合' do
      it '全て入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規商品登録ができない場合' do
      it '画像が入力されていないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が入力されていないと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が入力されていないと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが選択されていないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '地域が選択されていないと登録できない' do
        @item.place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Place can't be blank")
      end
      it '作ってからの日数が選択されていないと登録できない' do
        @item.make_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Make day can't be blank")
      end
      it '市長区村がないと登録できない' do
        @item.city = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("City can't be blank")
      end
      it '住所がないと登録できない' do
        @item.address = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Address can't be blank")
      end
      it '価格が入力されていないと登録できない' do
        @item.value = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Value can't be blank")
      end
      it '価格が半角数字以外登録できない' do
        @item.value = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Value is not included in the list')
      end
      it '金額が半角英数混合では登録できないこと' do
        @item.value = 'a1234bcd'
        @item.valid?
        expect(@item.errors.full_messages).to include('Value is not included in the list')
      end
      it '金額が半角英語だけでは登録できないこと' do
        @item.value = 'abcde'
        @item.valid?
        expect(@item.errors.full_messages).to include('Value is not included in the list')
      end
      it '価格が9999999以上の場合登録できない' do
        @item.value = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Value is not included in the list')
      end
      it 'ユーザー情報がない場合は登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
