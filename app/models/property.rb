class Property < ApplicationRecord
  monetize :price_cents, allow_nil: true
  has_many_attached :images, dependent: :purge_later
  has_many :reviews, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :headline
    validates :description
    validates :address_1
    validates :city
    validates :state
    validates :country
  end
end
