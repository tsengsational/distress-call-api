class Circle < ApplicationRecord
  belongs_to :user
  belongs_to :fellowship
  has_many :supporter_circles
  has_many :supporters, through: :supporter_circles
  has_many :calls
  has_many :call_supporters, through: :calls
end
