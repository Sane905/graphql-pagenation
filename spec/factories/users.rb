# == Schema Information
#
# Table name: users
#
#  email           :string           not null
#  password_digest :string           not null
#  uid             :string           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
FactoryBot.define do
  factory :user do
    
  end
end
