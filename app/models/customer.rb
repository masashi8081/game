class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :games, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

  def active_for_authentication?
    super && (is_deleted == false)
  end

end
