class Fellowship < ApplicationRecord
  has_many :circles
  has_many :users, through: :circles
  has_many :supporters, through: :circles

  validates :name, presence: true
end
