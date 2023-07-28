class Review < ApplicationRecord
  belongs_to :customer
  #belongs_to :game, primary_key: "isbn"
  belongs_to :game
  has_many :review_comments, dependent: :destroy
end
