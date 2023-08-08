class Game < ApplicationRecord

  #self.primary_key = "isbn"
  has_many :reviews, dependent: :destroy
  has_many :review_comments, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "hardware", "id", "label", "largeImageUrl", "mediumImageUrl", "salesDate", "title", "updated_at"]
  end


end
