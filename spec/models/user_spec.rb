require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規ユーザ登録' do
    context '新規登録ができる場合' do
      it '全て入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'nicknameが空である' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空である' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email.delete!('@')
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空である' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが6文字以下である' do
        @user.password = '12345'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが英字のみでは登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードが数字のみでは登録できないこと ' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードが全角では登録できないこと  ' do
        @user.password = 'あかさたなは'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードがあってもパスワード(確認)が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameがない場合は登録できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors[:family_name]).to include("can't be blank", '全角文字を使用してください')
      end
      it 'family_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.family_name = 'aaaaa'
        @user.valid?
        expect(@user.errors[:family_name]).to include('全角文字を使用してください')
      end
      it 'first_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.first_name = 'aaaaa'
        @user.valid?
        expect(@user.errors[:first_name]).to include('全角文字を使用してください')
      end
      it 'read-familyが全角カタカナ以外では登録できないこと ' do
        @user.read_family = 'あああああ'
        @user.valid?
        expect(@user.errors[:read_family]).to include('はカタカナで入力して下さい。')
      end
      it 'read-firstが全角カタカナ以外では登録できないこと' do
        @user.read_first = 'あああああ'
        @user.valid?
        expect(@user.errors[:read_first]).to include('はカタカナで入力して下さい。')
      end
      it 'read-familyがない場合は登録できないこと' do
        @user.read_family = ''
        @user.valid?
        expect(@user.errors[:read_family]).to include("can't be blank", 'はカタカナで入力して下さい。')
      end
      it 'first_nameがない場合は登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank", '全角文字を使用してください')
      end
      it 'read_firstがない場合は登録できないこと' do
        @user.read_first = ''
        @user.valid?
        expect(@user.errors[:read_first]).to include("can't be blank", 'はカタカナで入力して下さい。')
      end
      it 'birth_dayがない場合は登録できないこと' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors[:birth]).to include("can't be blank")
      end
      it '地域が選択されていないと登録できない' do
        @user.place_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Place can't be blank")
      end
    end
  end
end
