require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
    end
    it "emailが空だと登録できない" do
    end
    it "既に登録されているemailは登録できない" do
    end
    it "emailは@を含んでいないと登録できない" do
    end
    it "passwordが空だと登録できない" do
    end
    it "passwordは6文字以上でないと登録できない" do
    end
    it "passwordは半角英数字が混合されていたら、登録できる" do
    end
    it "passwordは確認用を含めて、2回入力しないと登録できない" do
    end
    it "2つのpasswordが一致しないと、登録できない" do
    end
    it "last_nameとfirst_nameは、それぞれ存在しないと登録できない" do
    end
    it "last_nameとfirst_nameは、全角での入力でないと登録できない" do
    end
    it "last_name_kanaとfirst_name_kanaは、それぞれ存在しないと登録できない" do
    end
    it "last_name_kanaとfirst_name_kanaは、全角での入力でないと登録できない" do
    end
    it "birthdayが存在しないと登録できない" do
    end
end
