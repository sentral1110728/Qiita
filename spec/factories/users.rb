FactoryGirl.define do

  factory :user do
    nickname   Faker::Name.initials(6)
    email      Faker::Internet.free_email
    password = Faker::Internet.password(6)
    password              password
    password_confirmation password
  end

end
