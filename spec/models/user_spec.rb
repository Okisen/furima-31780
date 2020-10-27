require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname,email,password,password_confirmation,first_name,last_name,first_name_ruby,last_name_ruby,birthdayが存在するとき新規登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが重複すると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@が含まれないと登録できない" do
      @user.email = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが5文字以下だと登録できない" do
      @user.password = "123ab"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが6文字以上英数字混合だと登録できる" do
      @user.password = "123abc"
      @user.password_confirmation = @user.password
      expect(@user).to be_valid
    end
    it "passwordが半角英数字混合でないと登録できない" do
      @user.password = "123456"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "password_confirmationがpasswordと一致しないと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameが全角(漢字,平仮名,カタカナ)でないと登録できない" do
      @user.first_name = Faker::Name.first_name
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameが全角(漢字,平仮名,カタカナ)でないと登録できない" do
      @user.last_name = Faker::Name.last_name
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "first_name_rubyが空だと登録できない" do
      @user.first_name_ruby = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby can't be blank")
    end
    it "first_name_rubyが全角(カタカナ)でないと登録できない" do
      @user.first_name_ruby = Faker::Name.first_name
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby is invalid")
    end
    it "last_name_rubyが空だと登録できない" do
      @user.last_name_ruby = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
    end
    it "last_name_rubyが全角(カタカナ)でないと登録できない" do
      @user.last_name_ruby = Faker::Name.last_name
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name ruby is invalid")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end