require 'rails_helper'
describe User do
  describe '#create' do

    it "nickname, email, password, password_confirmationが存在と登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameが空値の場合登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailが空値の場合登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "emailが空値の場合登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

  end
end