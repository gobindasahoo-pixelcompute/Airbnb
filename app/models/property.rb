class Property < ApplicationRecord
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
