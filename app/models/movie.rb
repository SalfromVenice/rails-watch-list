class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, uniqueness: true
  validates :title, :overview, presence: true

  before_destroy do
    destroy unless bookmarks.empty?
  end
end
