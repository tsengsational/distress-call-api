class SupporterCircle < ApplicationRecord
  belongs_to :circle
  belongs_to :supporter
end
