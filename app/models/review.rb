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
end
