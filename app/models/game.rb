class Game < ApplicationRecord

  #self.primary_key = "isbn"
  has_many :reviews, dependent: :destroy
  has_many :review_comments, dependent: :destroy


end
