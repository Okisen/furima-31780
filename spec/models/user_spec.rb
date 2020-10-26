require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nickname,email,password,password_confirmation,first_name,last_name,
        first_name_ruby,last_name_ruby,birthdayが存在するとき新規登録できる" do
      
    end
    it "nicknameが空だと登録できない" do
      
    end
    it "emailが空だと登録できない" do
      
    end
    it "emailが重複すると登録できない" do
      
    end
    it "emailに@が含まれないと登録できない" do
      
    end
    it "passwordが5文字以下だと登録できない" do
      
    end
    it "passwordが6文字以上だと登録できる" do
      
    end
    it "passwordが半角英数字混合でないと登録できない" do
      
    end
    it "password_confirmationがpasswordと一致しないと登録できない" do
      
    end
    it "first_nameが空だと登録できない" do
      
    end
    it "first_nameが全角(漢字,平仮名,カタカナ)でないと登録できない" do
      
    end
    it "last_nameが空だと登録できない" do
      
    end
    it "last_nameが全角(漢字,平仮名,カタカナ)でないと登録できない" do
      
    end
  end
end
