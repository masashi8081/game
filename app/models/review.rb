class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :game
  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :comment, presence: true
  validates :rate, presence: true

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["comment", "created_at", "customer_id", "game_id", "id", "rate", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["customer", "favorites", "game", "review_comments"]
  end

end
