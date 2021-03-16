require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it "全ての項目を正しく入力したとき、登録できる" do
        expect(@user).to be_valid
      end
      it "last_name_kanaが全角で入力されているとき、登録できる" do
        @user.last_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角で入力されているとき、登録できる" do
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "既に登録されているemailは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "emailは@を含んでいないと登録できない" do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordは5文字以下では登録できない" do
        @user.password = '11qqq'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordは半角英数字が混合されていないと、登録できない" do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it "passwordは確認用を含めて、2回入力しないと登録できない" do
        @user.password = '111qqq'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "2つのpasswordが一致しないと、登録できない" do
        @user.password = '111qqq'
        @user.password_confirmation = '222qqq'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "passwordは、英語のみでは登録できない" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it "passwordは、全角文字では登録できない" do
        @user.password = 'ｅｉｂ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it "last_nameが存在しないと、登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it "first_nameが存在しないと、登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "last_nameは、全角（漢字）での入力でないと登録できない" do
        @user.last_name = 'YAMADA'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it "first_nameは、全角（漢字）での入力でないと登録できない" do
        @user.first_name = 'TARO'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it "last_name_kanaが空の場合、登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it "first_name_kanaが空の場合、登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "last_name_kanaは、全角での入力でないと登録できない" do
        @user.last_name_kana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
      it "first_name_kanaは、全角の入力でないと登録できない" do
        @user.first_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
