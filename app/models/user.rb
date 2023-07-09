class User < ApplicationRecord
  self.primary_key = :uid
  before_validation(on: :create) do
    self.uid = Digest::UUID.uuid_v4.tr('-', '')
  end

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }


  def self.authenticate(email, password)
    user = User.find_by!(email: email)
    if user.authenticate(password)
      user
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end

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
