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

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "重複したemailが存在する場合登録できない" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "nicknameが7文字以上で登録できない" do
      user = build(:user, nickname: "aaaaaaa")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end

    it "nicknameが6文字未満で登録できる" do
      user = build(:user, nickname: "aaaaaa")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが5文字未満で登録できない" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end

    it "passwordが6文字以上で登録できる" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

  end
end
