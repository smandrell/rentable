class Unit < ApplicationRecord
  belongs_to :property
  validates :bedroom_count, presence: true
  validates :bathroom_count, presence: true
  validates :square_footage, presence: true
  validates :rent_price, presence: true
end
