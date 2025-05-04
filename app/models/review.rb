class Review < ApplicationRecord
  belongs_to :user
  belongs_to :property, counter_cache: true

  before_save :update_final_rating
  after_commit :update_average_final_rating, on: %i[create update destroy]

  validates :content, presence: true
  validates :cleanliness_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :accuracy_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :checking_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :communication_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :location_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :value_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  def update_final_rating
    total_rating= (self.cleanliness_rating +
    self.accuracy_rating +
    self.checking_rating +
    self.communication_rating +
    self.location_rating +
    self.value_rating)/6.0
    self.final_rating = total_rating.round(2)
  end

  def update_average_final_rating
    # this will be called a new review is added or updated
    return unless property.present?
    avg = property.reviews.average(:final_rating)
    property.update_column(:average_final_rating, avg&.to_f&.round(2) || 0.0)
  end
end
