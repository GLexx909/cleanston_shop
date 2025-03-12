class User < ApplicationRecord
  has_secure_password

  has_one :cart, dependent: :destroy
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  after_create :ensure_cart

  private

  def ensure_cart
    create_cart unless cart
  end
end
