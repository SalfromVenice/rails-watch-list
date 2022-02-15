class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :image

  validates :name, uniqueness: true
  validates :name, :image, :user_id, presence: true
end
