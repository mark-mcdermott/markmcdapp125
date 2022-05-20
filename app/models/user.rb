class User < ApplicationRecord

  has_secure_password

  has_many :scores

  validates :username, presence: true

end
