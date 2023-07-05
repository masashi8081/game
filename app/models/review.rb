class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :game, primary_key: "isbn"
end
