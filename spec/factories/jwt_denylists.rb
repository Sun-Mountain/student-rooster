FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2023-12-06 11:49:07" }
  end
end
