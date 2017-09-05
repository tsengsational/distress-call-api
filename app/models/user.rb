class User < ApplicationRecord
  has_secure_password
  has_many :circles
  has_many :fellowships, through: :circles
  has_many :supporters, through: :circles

  validates :first_name, presence: true
  validates :username, presence: true, uniqueness: true
  

end
