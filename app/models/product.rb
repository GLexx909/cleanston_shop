class Product < ApplicationRecord
  has_many :cart_item, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :available, -> { where("count > ?", 0) }
end
