require 'rails_helper'

RSpec.describe "新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context '新規登録できるとき' do
    it '正しい情報を入力すればユーザー新規登録ができる' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録ページに遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページに移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'last-name', with: @user.last_name
      fill_in 'first-name', with: @user.first_name
      fill_in 'last-name-kana', with: @user.last_name_ruby
      fill_in 'first-name-kana', with: @user.first_name_ruby
      select @user.birthday.year, from: 'user_birthday_1i'
      select @user.birthday.month, from: 'user_birthday_2i'
      select @user.birthday.day, from: 'user_birthday_3i'
      # 会員登録ボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change{User.count}.by(1)
      # トップページに遷移したことを確認する
      expect(current_path).to eq root_path
      # トップページにニックネーム/ログアウトボタンが表示される
      expect(
        find('.lists-right').hover
      ).to have_content(@user.nickname)
      expect(
        find('.lists-right').hover
      ).to have_content("ログアウト")
      # 新規登録ページ,ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context '新規登録できないとき' do
    it '誤った情報では新規登録できずに新規登録ページに戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録ページに遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページに移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'nickname', with: ""
      fill_in 'email', with: ""
      fill_in 'password', with: ""
      fill_in 'password-confirmation', with: ""
      fill_in 'last-name', with: ""
      fill_in 'first-name', with: ""
      fill_in 'last-name-kana', with: ""
      fill_in 'first-name-kana', with: ""
      select "--", from: 'user_birthday_1i'
      select "--", from: 'user_birthday_2i'
      select "--", from: 'user_birthday_3i'
      # 会員登録ボタンを押してもユーザーモデルのカウントが変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change{User.count}.by(0)
      # 新規登録ページに戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe "ログイン", type: :system do
  
end
