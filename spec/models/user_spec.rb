require 'rails_helper'
describe User do
  describe '#create' do
    it "nickname, email, password, password_confirmationが存在と登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end
