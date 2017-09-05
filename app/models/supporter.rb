class Supporter < ApplicationRecord
  has_many :supporter_circles
  has_many :circles, through: :supporter_circles
  has_many :call_supporters
  has_many :calls, through: :call_supporters

  validates :phone, presence: true, uniqueness: true
  validates :first_name, presence: true
end
